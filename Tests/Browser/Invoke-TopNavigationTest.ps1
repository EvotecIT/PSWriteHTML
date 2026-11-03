<#
.SYNOPSIS
Checks that generated top navigation remains reachable after resizing.
.DESCRIPTION
Serve ReportDirectory at BaseUri through a loopback HTTP server before running.
PSParseHTML owns the headless Edge session; no browser installation is performed.
Exercises both embedded and Online reports, keyboard controls and nested menus.
.PARAMETER ReportDirectory
Directory served by the loopback server for the generated reports.
.PARAMETER BaseUri
Loopback HTTP address serving ReportDirectory.
.PARAMETER CaptureDirectory
Optional directory for screenshots of the desktop, drawer and short-frame states.
.EXAMPLE
./Tests/Browser/Invoke-TopNavigationTest.ps1 -ReportDirectory D:/Scratch/navigation -BaseUri http://127.0.0.1:58990/
.OUTPUTS
Strings describing each successful navigation check. Throws on failure.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string] $ReportDirectory,
    [Parameter(Mandatory)][uri] $BaseUri,
    [string] $CaptureDirectory
)

$ErrorActionPreference = 'Stop'
if ($BaseUri.Scheme -ne 'http' -or $BaseUri.Host -ne '127.0.0.1') {
    throw 'BaseUri must point to the loopback HTTP server serving ReportDirectory.'
}
Import-Module (Join-Path $PSScriptRoot '../../PSWriteHTML.psd1') -Force
Import-Module PSParseHTML -MinimumVersion 3.0.3 -ErrorAction Stop
$null = New-Item -ItemType Directory -Path $ReportDirectory -Force
if ($CaptureDirectory) { $null = New-Item -ItemType Directory -Path $CaptureDirectory -Force }
$Logo = 'data:image/svg+xml;base64,' + [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes('<svg xmlns="http://www.w3.org/2000/svg" width="150" height="50"><text x="10" y="32" fill="#00a4d6" font-family="Arial" font-size="22">REPORT</text></svg>'))
$IconPath = Join-Path $ReportDirectory 'navigation-icon.svg'
[IO.File]::WriteAllText($IconPath, '<svg xmlns="http://www.w3.org/2000/svg" width="1" height="1"/>')
$Results = [System.Collections.Generic.List[string]]::new()

foreach ($Mode in @('offline', 'online')) {
    $ReportName = "top-navigation-$Mode.html"
    $null = New-HTML -TitleText 'Responsive report navigation' -FavIcon $IconPath -FilePath (Join-Path $ReportDirectory $ReportName) -Online:($Mode -eq 'online') {
        New-HTMLNavTop -Logo $Logo -MenuItemsWidth 300px {
            foreach ($Name in @('Overall Information', 'Forest Information', 'Domains Information', 'Group Policies', 'Security and Compliance', 'Operations')) {
                $HeadingOptions = @{}
                if ($Name -eq 'Overall Information') { $HeadingOptions.Href = '#heading-href' }
                if ($Name -eq 'Forest Information') { $HeadingOptions.InternalPageID = 'heading-internal' }
                New-NavTopMenu -Name $Name -IconSolid folder @HeadingOptions {
                    foreach ($Number in 1..20) {
                        New-NavLink -Name "$Name item $Number" -Href "#item-$Number"
                    }
                    New-NavLink -Name 'Nested reports' {
                        New-NavLink -Name 'Nested destination' -Href '#nested-destination'
                        New-NavLink -Name 'Deeper reports' {
                            New-NavLink -Name 'Deep destination' -Href '#deep-destination'
                        }
                    }
                }
            }
        }
        New-HTMLSection -HeaderText 'Report overview' {
            New-HTMLText -Text 'All navigation groups remain available when this report is resized.'
        }
    }
    $ReportUri = [uri]::new($BaseUri, $ReportName).AbsoluteUri
    $Session = Start-HtmlBrowserSession -Url $ReportUri -Browser Chromium -BrowserChannel msedge -Visible:$false -ViewportWidth 1600 -ViewportHeight 800 -ErrorAction Stop
    try {
        $Session.Page.SetDefaultTimeout(10000)
        function Assert-Navigation {
            param([string] $Expression, [string] $Case)
            try {
                $null = $Session.Page.WaitForFunctionAsync($Expression).GetAwaiter().GetResult()
            } catch {
                throw "Navigation case '$Mode / $Case' failed: $($_.Exception.Message)"
            }
            $Results.Add("$Mode / $Case")
        }
        Assert-Navigation '() => document.fonts.status === "loaded" && !document.querySelector("nav").classList.contains("is-compact") && document.querySelectorAll(".dropdown-heading").length === 6' 'Wide layout shows all groups'
        $Session.Page.Locator('.dropdown-heading').Nth(0).PressAsync('Enter').GetAwaiter().GetResult()
        Assert-Navigation '() => location.hash === "#heading-href"' 'Enter follows a heading Href'
        $Session.Page.Locator('.dropdown-heading').Nth(1).PressAsync('Enter').GetAwaiter().GetResult()
        Assert-Navigation '() => location.hash === "#heading-internal"' 'Enter follows a heading InternalPageID'
        foreach ($Width in @(1024, 480, 390, 240)) {
            $Session.Page.SetViewportSizeAsync($Width, 650).GetAwaiter().GetResult()
            Assert-Navigation '() => document.querySelector("nav").classList.contains("is-compact") && document.querySelector(".dropdown-items").inert' "Closed drawer at ${Width}px excludes hidden links from keyboard navigation"
            $Session.Page.Locator('.hamburger').PressAsync('Enter').GetAwaiter().GetResult()
            Assert-Navigation '() => { const row = document.querySelector(".dropdown-items"); return !row.inert && Math.abs(row.getBoundingClientRect().left) < 1 && [...row.children].every(li => getComputedStyle(li).display !== "none") && document.documentElement.scrollWidth <= innerWidth; }' "All groups reachable at ${Width}px"
            if ($CaptureDirectory -and $Width -eq 390) {
                Save-HtmlBrowserScreenshot -Session $Session -OutFile (Join-Path $CaptureDirectory "$Mode-drawer.png") -ErrorAction Stop | Out-Null
            }
            $Session.Page.Locator('.hamburger').PressAsync('Escape').GetAwaiter().GetResult()
            Assert-Navigation '() => document.querySelector(".hamburger").getAttribute("aria-expanded") === "false" && document.activeElement.matches(".hamburger")' "Escape closes drawer and restores focus at ${Width}px"
        }
        $Session.Page.Locator('.hamburger').PressAsync('Enter').GetAwaiter().GetResult()
        $Session.Page.SetViewportSizeAsync(1600, 360).GetAwaiter().GetResult()
        Assert-Navigation '() => !document.querySelector("nav").classList.contains("is-compact") && !document.querySelector(".dropdown-items").inert && !document.querySelector(".codehim-dim-overlay").getClientRects().length && document.activeElement.matches(".home-link a")' 'Widening an open drawer restores the desktop row and visible keyboard focus'
        $Session.Page.Locator('.dropdown-heading').Last.PressAsync('Space').GetAwaiter().GetResult()
        Assert-Navigation '() => { const menu = document.querySelector(".dropdown-items > li:last-child > ul"); const r = menu.getBoundingClientRect(); return r.height > 0 && r.bottom <= innerHeight && r.right <= innerWidth && menu.scrollHeight > menu.clientHeight; }' 'Long right-edge dropdown fits the short viewport and scrolls'
        $Session.Page.Locator('.dropdown-items > li:last-child .parent').First.ClickAsync().GetAwaiter().GetResult()
        Assert-Navigation '() => { const menu = document.querySelector(".dropdown-items > li:last-child .menu-subitems"); const r = menu.getBoundingClientRect(); return r.height > 0 && r.left >= 0 && r.right <= innerWidth && r.bottom <= innerHeight; }' 'Nested flyout remains inside the viewport'
        $Session.Page.Locator('.dropdown-items > li:last-child .parent').Last.ClickAsync().GetAwaiter().GetResult()
        $Session.Page.Locator('a[href="#deep-destination"]').Last.ClickAsync().GetAwaiter().GetResult()
        Assert-Navigation '() => location.hash === "#deep-destination" && [...document.querySelectorAll(".menu-items, .menu-subitems")].every(menu => !menu.getClientRects().length)' 'Deep destination navigates and closes dropdowns'
        if ($CaptureDirectory) {
            $Session.Page.Locator('.dropdown-heading').First.ClickAsync().GetAwaiter().GetResult()
            Save-HtmlBrowserScreenshot -Session $Session -OutFile (Join-Path $CaptureDirectory "$Mode-short.png") -ErrorAction Stop | Out-Null
        }
        $Session.Page.SetViewportSizeAsync(390, 360).GetAwaiter().GetResult()
        Assert-Navigation '() => document.querySelector("nav").classList.contains("is-compact")' 'Short mobile viewport selects drawer'
        $Session.Page.Locator('.hamburger').ClickAsync().GetAwaiter().GetResult()
        $Session.Page.Locator('.dropdown-heading').Last.ClickAsync().GetAwaiter().GetResult()
        $Session.Page.Locator('.dropdown-items > li:last-child a[href="#item-20"]').ClickAsync().GetAwaiter().GetResult()
        Assert-Navigation '() => location.hash === "#item-20" && document.querySelector(".dropdown-items").inert' 'Last link remains reachable by scrolling the short drawer'
        $Session.Page.Locator('.hamburger').ClickAsync().GetAwaiter().GetResult()
        $Session.Page.Locator('.hamburger').ClickAsync().GetAwaiter().GetResult()
        Assert-Navigation '() => document.querySelector(".hamburger").getAttribute("aria-expanded") === "false"' 'Toggle closes an open drawer'

        $HostName = "top-navigation-frame-$Mode.html"
        [IO.File]::WriteAllText((Join-Path $ReportDirectory $HostName), "<!doctype html><html><title>Embedded report</title><link rel='icon' href='data:,'><iframe title='Report' src='$ReportName' style='width:700px;height:360px;border:0'></iframe></html>")
        $Session.Page.SetViewportSizeAsync(1600, 800).GetAwaiter().GetResult()
        $null = $Session.Page.GotoAsync([uri]::new($BaseUri, $HostName).AbsoluteUri).GetAwaiter().GetResult()
        Assert-Navigation '() => { const doc = document.querySelector("iframe").contentDocument; return doc && doc.querySelector("nav.is-compact"); }' 'Frame width selects compact mode independently of the outer window'
        $Frame = $Session.Page.FrameLocator('iframe')
        $Frame.Locator('.hamburger').ClickAsync().GetAwaiter().GetResult()
        $Frame.Locator('.dropdown-heading').Last.ClickAsync().GetAwaiter().GetResult()
        $Frame.Locator('.dropdown-items > li:last-child a[href="#item-20"]').ClickAsync().GetAwaiter().GetResult()
        Assert-Navigation '() => document.querySelector("iframe").contentWindow.location.hash === "#item-20"' 'Last dropdown item navigates inside a short embedded report'
        $ConsoleErrors = @(Get-HtmlBrowserConsoleLog -Session $Session -Severity Error)
        if ($ConsoleErrors.Count) { throw ($ConsoleErrors | ConvertTo-Json -Depth 5) }
    } finally {
        Close-HtmlBrowserSession -Session $Session -ErrorAction Stop
    }
}
$Results | ForEach-Object { "PASS: $_" }
