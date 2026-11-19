<#
.SYNOPSIS
Checks responsive row details and the fixed-footer scrollbar in generated reports.
.DESCRIPTION
Serve ReportDirectory at BaseUri on loopback before running this test.
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

$Details = @(
    [pscustomobject]@{ Name = 'DC01'; Details = 'Primary directory server' }
    [pscustomobject]@{ Name = 'DC02'; Details = 'Secondary directory server' }
)
$null = New-HTML -FilePath (Join-Path $ReportDirectory 'row-details.html') -FavIcon $Icon {
    New-HTMLTable -DataTable $Details -DataTableID modalDetails -ResponsiveDetailsModal {
        New-TableHeader -Names Details -ResponsiveOperations none
    }
    New-HTMLTable -DataTable $Details -DataTableID inlineDetails {
        New-TableHeader -Names Details -ResponsiveOperations none
    }
}

$Rows = 1..65 | ForEach-Object {
    $Row = [ordered]@{ Name = "Record $_" }
    foreach ($Column in 1..12) {
        $Row["Field$Column"] = "Representative content in column $Column"
    }
    [pscustomobject]$Row
}
$null = New-HTML -FilePath (Join-Path $ReportDirectory 'wide.html') -FavIcon $Icon {
    New-HTMLTable -DataTable $Rows -DataTableID wide -ScrollX -FixedFooter -DisablePaging -HideButtons -DisableStateSave
    New-HTMLSection -Height 700px {
        New-HTMLText -Text 'Report notes'
    }
}

$Options = @{ Browser = 'Firefox'; Visible = $false; ViewportWidth = 720; ViewportHeight = 650 }
if ($Browser -eq 'Edge') {
    $Options.Browser = 'Chromium'
    $Options.BrowserChannel = 'msedge'
}
$Session = Start-HtmlBrowserSession -Url ([uri]::new($BaseUri, 'row-details.html')).AbsoluteUri @Options
try {
    $Session.Page.SetDefaultTimeout(10000)
    $ModalControl = $Session.Page.Locator('#modalDetails tbody td.dtr-control').Nth(1)
    $null = $ModalControl.PressAsync('Enter').GetAwaiter().GetResult()
    $null = $Session.Page.Locator('.dtr-modal-content:has-text("Secondary directory server")').WaitForAsync().GetAwaiter().GetResult()
    $null = $Session.Page.Keyboard.PressAsync('Escape').GetAwaiter().GetResult()
    $null = $Session.Page.WaitForFunctionAsync('() => !document.querySelector(".dtr-modal")').GetAwaiter().GetResult()
    $null = $Session.Page.Locator('#inlineDetails tbody td.dtr-control').First.ClickAsync().GetAwaiter().GetResult()
    $null = $Session.Page.Locator('#inlineDetails .dtr-details:has-text("Primary directory server")').WaitForAsync().GetAwaiter().GetResult()

    $null = $Session.Page.GotoAsync(([uri]::new($BaseUri, 'wide.html')).AbsoluteUri).GetAwaiter().GetResult()
    $null = $Session.Page.WaitForFunctionAsync('() => { const body = document.querySelector(".dataTables_scrollBody"); const rail = document.querySelector(".pswh-footer-scrollbar"); return body && rail?.hidden && body.scrollWidth > body.clientWidth && body.getBoundingClientRect().bottom <= innerHeight; }').GetAwaiter().GetResult()
    $null = Invoke-HtmlBrowserScript -Session $Session -Script '() => window.scrollTo(0, 200)'
    $Rail = $Session.Page.Locator('.pswh-footer-scrollbar:not([hidden])')
    $null = $Rail.WaitForAsync().GetAwaiter().GetResult()
    $null = $Session.Page.WaitForFunctionAsync('() => { const body = document.querySelector(".dataTables_scrollBody"); const rect = document.querySelector(".pswh-footer-scrollbar").getBoundingClientRect(); return body.getBoundingClientRect().bottom > innerHeight && rect.height > 0 && rect.bottom <= innerHeight + 1 && rect.top >= 0; }').GetAwaiter().GetResult()
    $null = Invoke-HtmlBrowserScript -Session $Session -Script '() => { document.querySelector(".dataTables_scrollBody").scrollLeft = 160; }'
    $null = $Session.Page.WaitForFunctionAsync('() => Math.abs(document.querySelector(".pswh-footer-scrollbar").scrollLeft - 160) <= 1').GetAwaiter().GetResult()
    $null = $Rail.PressAsync('ArrowRight').GetAwaiter().GetResult()
    $null = $Session.Page.WaitForFunctionAsync('() => { const body = document.querySelector(".dataTables_scrollBody"); const rail = document.querySelector(".pswh-footer-scrollbar"); const head = document.querySelector(".dataTables_scrollHead"); return body.scrollLeft > 160 && Math.abs(body.scrollLeft - rail.scrollLeft) <= 1 && Math.abs(body.scrollLeft - head.scrollLeft) <= 1; }').GetAwaiter().GetResult()
    $null = Invoke-HtmlBrowserScript -Session $Session -Script '() => window.scrollTo(0, 0)'
    $null = $Session.Page.WaitForFunctionAsync('() => document.querySelector(".pswh-footer-scrollbar").hidden && document.querySelector(".dataTables_scrollBody").getBoundingClientRect().bottom <= innerHeight').GetAwaiter().GetResult()
    "PASS: $Browser opened and closed modal details, preserved inline details, and synchronized the fixed-footer scrollbar."
} finally {
    Close-HtmlBrowserSession -Session $Session -ErrorAction Stop
}
