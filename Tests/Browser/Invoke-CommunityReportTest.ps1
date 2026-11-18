<#
.SYNOPSIS
Checks generated sidebar, gauge, and Search Panes reports in Edge and Firefox.
.DESCRIPTION
Serve ReportDirectory through BaseUri on loopback. Uses PSParseHTML to open the generated reports.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string] $ReportDirectory,
    [Parameter(Mandatory)][uri] $BaseUri,
    [ValidateSet('Edge', 'Firefox')][string] $Browser = 'Edge'
)

$ErrorActionPreference = 'Stop'
if ($BaseUri.Scheme -ne 'http' -or $BaseUri.Host -ne '127.0.0.1') {
    throw 'BaseUri must point to the loopback HTTP server serving ReportDirectory.'
}
Import-Module (Join-Path $PSScriptRoot '../../PSWriteHTML.psd1') -Force
Import-Module PSParseHTML -MinimumVersion 3.0.9
$null = New-Item -ItemType Directory -Path $ReportDirectory -Force
$Icon = Join-Path $ReportDirectory 'icon.svg'
[IO.File]::WriteAllText($Icon, '<svg xmlns="http://www.w3.org/2000/svg" width="1" height="1"/>')

$Rows = 1..30 | ForEach-Object {
    [pscustomobject]@{
        Team   = @('Operations', 'Support', 'Sales')[$_ % 3]
        Status = @('Open', 'Closed')[$_ % 2]
        Ticket = "SR-$_"
    }
}
$null = New-HTML -FilePath (Join-Path $ReportDirectory 'community.html') -FavIcon $Icon {
    New-HTMLNav -Logo 'icon.svg' {
        New-NavLink -Name 'Compute' {
            New-NavLink -Name 'VMware' {
                New-NavLink -Name 'Clusters' -InternalPageID Clusters
                New-NavLink -Name 'Hosts' -InternalPageID Hosts
            }
        }
        New-NavLink -Name 'Other' {
            New-NavLink -Name 'Home' -Href 'community.html'
        }
    }
    New-HTMLPage -Name 'Clusters' -ID Clusters {
        New-HTMLGauge -Label 'Queue utilization' -Value 67 -Unit '%'
        New-HTMLGauge -Label 'Load above warning range' -Value 115 -Unit '%'
    }
    New-HTMLPage -Name 'Hosts' -ID Hosts {
        New-HTMLText -Text 'Hosts report'
    }
}
$null = New-HTML -FilePath (Join-Path $ReportDirectory 'search-panes.html') -FavIcon $Icon {
    New-HTMLTable -DataTable $Rows -PagingLength 10 -HideFooter -ScrollCollapse -FixedHeader -Style cell-border -Buttons excelHtml5, pageLength, searchPanes -SearchBuilder
}

$Options = @{ Browser = 'Firefox'; Visible = $false; ViewportWidth = 1440; ViewportHeight = 900 }
if ($Browser -eq 'Edge') {
    $Options.Browser = 'Chromium'
    $Options.BrowserChannel = 'msedge'
}
$Session = Start-HtmlBrowserSession -Url ([uri]::new($BaseUri, 'community_Clusters.html')).AbsoluteUri @Options
try {
    $Session.Page.SetDefaultTimeout(10000)
    $null = $Session.Page.WaitForFunctionAsync('() => { const link = document.querySelector(".nav-links [aria-current=page]"); return link && link.textContent.trim() === "Clusters" && [...document.querySelectorAll(".nav-links .its-parent")].map(x=>x.getAttribute("aria-expanded")).join() === "true,true,false"; }').GetAwaiter().GetResult()
    $null = $Session.Page.WaitForFunctionAsync('() => document.querySelectorAll("svg[role=img]").length === 2 && [...document.querySelectorAll("svg[role=img]")].map(g=>g.querySelector("path[stroke-dasharray]").getAttribute("stroke-dasharray")).join() === "67 100,100 100"').GetAwaiter().GetResult()
    $null = $Session.Page.WaitForFunctionAsync('() => document.querySelectorAll("svg[role=img]")[1].getAttribute("aria-label").includes("115%")').GetAwaiter().GetResult()
    $null = $Session.Page.WaitForFunctionAsync('() => getComputedStyle(document.querySelector(".nav-links")).visibility === "hidden"').GetAwaiter().GetResult()
    $Session.Page.Locator('.menu-trigger').ClickAsync().GetAwaiter().GetResult()
    $null = $Session.Page.WaitForFunctionAsync('() => getComputedStyle(document.querySelector(".nav-links")).visibility === "visible"').GetAwaiter().GetResult()
    $Branch = $Session.Page.Locator('.nav-links .its-parent').Nth(1)
    $Branch.PressAsync('Enter').GetAwaiter().GetResult()
    $null = $Session.Page.WaitForFunctionAsync('() => document.querySelectorAll(".nav-links .its-parent")[1].getAttribute("aria-expanded") === "false"').GetAwaiter().GetResult()
    $Branch.PressAsync('Space').GetAwaiter().GetResult()
    $null = $Session.Page.WaitForFunctionAsync('() => document.querySelectorAll(".nav-links .its-parent")[1].getAttribute("aria-expanded") === "true"').GetAwaiter().GetResult()
    $Session.Page.Locator('.nav-links a[href$="_Hosts.html"]').ClickAsync().GetAwaiter().GetResult()
    $null = $Session.Page.WaitForFunctionAsync('() => document.querySelector(".nav-links [aria-current=page]")?.textContent.trim() === "Hosts"').GetAwaiter().GetResult()
    $null = $Session.Page.GotoAsync(([uri]::new($BaseUri, 'search-panes.html')).AbsoluteUri).GetAwaiter().GetResult()
    $null = $Session.Page.Locator('button.dt-button:has-text("SearchPanes")').ClickAsync().GetAwaiter().GetResult()
    $null = $Session.Page.WaitForFunctionAsync('() => { const p = document.querySelector(".dt-button-collection:has(.dtsp-panesContainer)"); return p && p.getBoundingClientRect().width <= 900 && p.querySelectorAll(".dtsp-searchPane").length >= 2; }').GetAwaiter().GetResult()
    $null = $Session.Page.WaitForFunctionAsync('() => { const panes = [...document.querySelectorAll(".dt-button-collection .dtsp-searchPane")].map(p=>p.getBoundingClientRect()).filter(r=>r.width>0); return panes.length === 2 && Math.abs(panes[0].top - panes[1].top) <= 1; }').GetAwaiter().GetResult()
    $Session.Page.SetViewportSizeAsync(390, 844).GetAwaiter().GetResult()
    $null = $Session.Page.WaitForFunctionAsync('() => { const p = document.querySelector(".dt-button-collection:has(.dtsp-panesContainer)"); return p && p.getBoundingClientRect().width <= innerWidth; }').GetAwaiter().GetResult()
    "PASS: $Browser current-page navigation, gauge range, and responsive Search Panes popup"
} finally {
    Close-HtmlBrowserSession -Session $Session -ErrorAction Stop
}
