<#
.SYNOPSIS
Exercises first-tab hash navigation in a generated report using a headless browser.
.DESCRIPTION
Serve ReportDirectory at BaseUri through a loopback HTTP server before running this
test. The report embeds the checkout's assets. PSParseHTML owns the browser session;
an installed Edge browser is used without installing browsers or opening a window.
.EXAMPLE
./Tests/Browser/Invoke-TabHashNavigationTest.ps1 -ReportDirectory D:/Scratch/report -BaseUri http://127.0.0.1:58990/ -CaptureDirectory D:/Scratch/captures
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
$ReportPath = Join-Path $ReportDirectory 'tab-hash-navigation.html'
$IconPath = Join-Path $ReportDirectory 'tab-icon.svg'
[IO.File]::WriteAllText($IconPath, '<svg xmlns="http://www.w3.org/2000/svg" width="1" height="1"><rect width="1" height="1" fill="#00bfff"/></svg>')
$null = New-HTML -TitleText 'Nested tab navigation' -FavIcon $IconPath -FilePath $ReportPath {
    New-HTMLSection -HeaderText 'Report navigation' {
        New-HTMLText -Text 'Select either nested tab, then use history or a link to return to the first tab.'
        New-HTMLAnchor -Href '#nested-first' -Text 'Open first nested tab'
    }
    New-HTMLTabPanel {
        New-HTMLTab -Name 'Overview' -AnchorName overview {
            New-HTMLText -Text 'Overview content'
        }
        New-HTMLTab -Name 'Recovery' -AnchorName recovery -Default {
            New-HTMLTabPanel {
                New-HTMLTab -Name 'Nested first' -AnchorName nested-first {
                    New-HTMLSection -HeaderText 'Recovery inventory' {
                        New-HTMLText -Text 'First nested tab is selected. Asset identifiers stay visible when navigation changes.'
                        New-HTMLTable -DataTable @(
                            [pscustomobject]@{ Asset = 'Directory server'; Identifier = '000123456789012345678'; State = 'Ready' }
                            [pscustomobject]@{ Asset = 'Recovery server'; Identifier = '000042'; State = 'Ready' }
                        ) -HideButtons -DataTableID nested-inventory
                    }
                }
                New-HTMLTab -Name 'Nested second' -AnchorName nested-second -Default {
                    New-HTMLText -Text 'Second nested tab is selected.'
                }
            }
        }
    }
}
$ReportUri = [uri]::new($BaseUri, 'tab-hash-navigation.html').AbsoluteUri
$Session = Start-HtmlBrowserSession -Url ($ReportUri + '#nested-second') -Browser Chromium -BrowserChannel msedge -Visible:$false -ViewportWidth 1440 -ViewportHeight 1000 -ErrorAction Stop
$Results = [System.Collections.Generic.List[string]]::new()
try {
    $Session.Page.SetDefaultTimeout(10000)
    function Assert-SelectedTab {
        param([string] $Id, [string] $Case)
        $Expression = '() => jQuery("#{0}").is(":visible") && jQuery(''a[href="#{0}"]'').hasClass("active")' -f $Id
        try {
            $null = $Session.Page.WaitForFunctionAsync($Expression).GetAwaiter().GetResult()
        } catch {
            throw "Navigation case '$Case' failed: $($_.Exception.Message)"
        }
        $Results.Add($Case)
    }
    Assert-SelectedTab nested-second 'Initial configured second tab'

    $null = Invoke-HtmlBrowserScript -Session $Session -Script "location.hash = '#nested-first'"
    Assert-SelectedTab nested-first 'Hash edit selects first nested tab'
    $null = Invoke-HtmlBrowserScript -Session $Session -Script "location.hash = '#nested-second'"
    Assert-SelectedTab nested-second 'Hash edit selects second nested tab'
    $null = $Session.Page.GoBackAsync().GetAwaiter().GetResult()
    Assert-SelectedTab nested-first 'Back selects first nested tab'
    $null = $Session.Page.GoForwardAsync().GetAwaiter().GetResult()
    Assert-SelectedTab nested-second 'Forward restores second nested tab'

    $Session.Page.Locator('a[href="#nested-first"]').First.ClickAsync().GetAwaiter().GetResult()
    Assert-SelectedTab nested-first 'In-document link selects first nested tab'
    $null = Invoke-HtmlBrowserScript -Session $Session -Script "location.hash = '#nested-second'"
    Assert-SelectedTab nested-second 'Select second tab before an unknown hash'
    $null = Invoke-HtmlBrowserScript -Session $Session -Script @'
() => new Promise(resolve => {
    window.addEventListener('hashchange', () => requestAnimationFrame(() => resolve(true)), { once: true });
    location.hash = '#missing-tab';
})
'@
    Assert-SelectedTab nested-second 'Unknown hash preserves second tab'

    $null = $Session.Page.GotoAsync('about:blank').GetAwaiter().GetResult()
    $Response = $Session.Page.GotoAsync($ReportUri + '#nested-first').GetAwaiter().GetResult()
    if ($null -eq $Response -or $Response.Status -ne 200) { throw 'Expected a fresh report document for the initial-link test.' }
    Assert-SelectedTab nested-first 'Cold first-tab hash overrides configured second tab'
    $null = $Session.Page.WaitForSelectorAsync('#nested-inventory_wrapper').GetAwaiter().GetResult()
    if ($CaptureDirectory) {
        $null = New-Item -ItemType Directory -Path $CaptureDirectory -Force
        foreach ($Theme in @('light', 'dark')) {
            $MediaType = $Session.Page.GetType().GetMethod('EmulateMediaAsync').GetParameters()[0].ParameterType
            $Media = [Activator]::CreateInstance($MediaType)
            $ColorType = [Nullable]::GetUnderlyingType($MediaType.GetProperty('ColorScheme').PropertyType)
            $Media.ColorScheme = [Enum]::Parse($ColorType, $Theme, $true)
            $Session.Page.EmulateMediaAsync($Media).GetAwaiter().GetResult()
            foreach ($Width in @(390, 1024, 1440)) {
                $Session.Page.SetViewportSizeAsync($Width, 1000).GetAwaiter().GetResult()
                $null = Invoke-HtmlBrowserScript -Session $Session -Script "jQuery('#nested-inventory').DataTable().columns.adjust().responsive.recalc()"
                Save-HtmlBrowserScreenshot -Session $Session -OutFile (Join-Path $CaptureDirectory "nested-first-$Width-$Theme.png") -Full -ErrorAction Stop | Out-Null
            }
        }
    }
    $ConsoleErrors = @(Get-HtmlBrowserConsoleLog -Session $Session -Severity Error)
    if ($ConsoleErrors.Count) { throw ($ConsoleErrors | ConvertTo-Json -Depth 5) }
    $Results | ForEach-Object { "PASS: $_" }
} finally {
    Close-HtmlBrowserSession -Session $Session -ErrorAction Stop
}
