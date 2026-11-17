<#
.SYNOPSIS
Exercises initial row-group collapse and chart bounds in a generated report.
.DESCRIPTION
Serve ReportDirectory at BaseUri through a loopback HTTP server. PSParseHTML
owns the headless Edge session and the report embeds the checkout's assets.
.EXAMPLE
./Tests/Browser/Invoke-SmallIssueFixesTest.ps1 -ReportDirectory D:/Scratch/report -BaseUri http://127.0.0.1:58994/
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
$IconPath = Join-Path $ReportDirectory 'report-icon.svg'
[IO.File]::WriteAllText($IconPath, '<svg xmlns="http://www.w3.org/2000/svg" width="1" height="1"><rect width="1" height="1" fill="#00bfff"/></svg>')
$Rows = @(
    [pscustomobject]@{ Location = 'North'; Manager = 'A'; Name = 'One' }
    [pscustomobject]@{ Location = 'North'; Manager = 'B'; Name = 'Two' }
    [pscustomobject]@{ Location = 'South'; Manager = 'A'; Name = 'Three' }
)
$null = New-HTML -TitleText 'Grouping and axis bounds' -FavIcon $IconPath -FilePath (Join-Path $ReportDirectory 'small-issue-fixes.html') {
    foreach ($Store in 'HTML', 'JavaScript') {
        New-HTMLSection -HeaderText "$Store groups start collapsed" {
            New-HTMLTable -DataTable $Rows -DataStore $Store -DataTableID "groups$Store" -DisableStateSave -HideButtons {
                New-TableRowGrouping -Name Location -Collapsed
            }
        }
    }
    New-HTMLSection -HeaderText 'Nested groups retain independent state' {
        New-HTMLTable -DataTable $Rows -DataStore JavaScript -DataTableID groupsNested -DisableStateSave -HideButtons {
            New-TableRowGrouping -Name Missing -Collapsed
            New-TableRowGrouping -Name Location
            New-TableRowGrouping -Name Manager -Collapsed
        }
    }
    New-HTMLSection -HeaderText 'Default groups stay expanded' {
        New-HTMLTable -DataTable $Rows -DataTableID groupsDefault -DisableStateSave -HideButtons {
            New-TableRowGrouping -Name Location
        }
    }
    New-HTMLSection -HeaderText 'Fractional X-axis bounds' {
        New-HTMLChart -Id bounds -Title 'Samples between -0.25 and 0' {
            New-ChartAxisX -Type numeric -MinValue -0.25 -MaxValue 0
            New-ChartScatter -Name Samples -X -0.2, -0.1 -Y 1, 2
        }
    }
}
$Session = Start-HtmlBrowserSession -Url ([uri]::new($BaseUri, 'small-issue-fixes.html').AbsoluteUri) -Browser Chromium -BrowserChannel msedge -Visible:$false -ViewportWidth 1440 -ViewportHeight 1000 -ErrorAction Stop
$Results = [System.Collections.Generic.List[string]]::new()
try {
    $Session.Page.SetDefaultTimeout(10000)
    function Assert-Report {
        param([string] $Expression, [string] $Case)
        $null = $Session.Page.WaitForFunctionAsync($Expression).GetAwaiter().GetResult()
        $Results.Add($Case)
    }
    foreach ($Store in 'HTML', 'JavaScript') {
        $Id = "groups$Store"
        Assert-Report "() => jQuery.fn.dataTable.isDataTable('#$Id') && jQuery('#$Id tbody tr.dtrg-start button[aria-expanded=false]').length === 2 && jQuery('#$Id tbody tr:not(.dtrg-start):visible').length === 0" "$Store initially collapsed"
        $Session.Page.Locator("#$Id tbody tr.dtrg-start button").First.ClickAsync().GetAwaiter().GetResult()
        Assert-Report "() => jQuery('#$Id tbody tr:not(.dtrg-start):visible').length === 2 && jQuery('#$Id tbody tr.dtrg-start button[aria-expanded=false]').length === 1" "$Store expands one group independently"
        $null = Invoke-HtmlBrowserScript -Session $Session -Script "jQuery('#$Id').DataTable().search('One').draw()"
        Assert-Report "() => jQuery('#$Id tbody tr:not(.dtrg-start):visible').length === 1" "$Store preserves expanded state during filtering"
        $Session.Page.Locator("#$Id tbody tr.dtrg-start button").First.ClickAsync().GetAwaiter().GetResult()
        $null = Invoke-HtmlBrowserScript -Session $Session -Script "jQuery('#$Id').DataTable().search('').draw()"
        Assert-Report "() => jQuery('#$Id tbody tr:not(.dtrg-start):visible').length === 0" "$Store preserves collapsed state after redraw"
    }
    Assert-Report '() => jQuery("#groupsNested tbody tr.dtrg-level-0 button[aria-expanded=true]").length === 2 && jQuery("#groupsNested tbody tr:not(.dtrg-start):visible").length === 0' 'Skipped columns do not shift nested collapse settings'
    $Session.Page.Locator('#groupsNested tbody tr.dtrg-level-1 button').First.ClickAsync().GetAwaiter().GetResult()
    Assert-Report '() => jQuery("#groupsNested tbody tr:not(.dtrg-start):visible").length === 1' 'Nested child expands independently'
    $Session.Page.Locator('#groupsNested tbody tr.dtrg-level-0 button').First.ClickAsync().GetAwaiter().GetResult()
    $Session.Page.Locator('#groupsNested tbody tr.dtrg-level-0 button').First.ClickAsync().GetAwaiter().GetResult()
    Assert-Report '() => jQuery("#groupsNested tbody tr:not(.dtrg-start):visible").length === 1' 'Parent collapse preserves child state'
    Assert-Report '() => jQuery("#groupsDefault tbody tr:not(.dtrg-start):visible").length === 3' 'Existing groups stay expanded by default'
    Assert-Report '() => { const chart = Apex._chartInstances.find(c => c.id === "bounds"); return chart && chart.chart.w.globals.minX === -0.25 && chart.chart.w.globals.maxX === 0; }' 'Rendered chart retains fractional and zero limits'
    $Session.Page.SetViewportSizeAsync(390, 844).GetAwaiter().GetResult()
    $Session.Page.Locator('#groupsHTML tbody tr.dtrg-start button').First.PressAsync('Enter').GetAwaiter().GetResult()
    Assert-Report '() => jQuery("#groupsHTML tbody tr:not(.dtrg-start):visible").length === 2' 'Keyboard activation opens a group at phone width'
    $Session.Page.Locator('#groupsHTML tbody tr.dtrg-start button').First.PressAsync('Space').GetAwaiter().GetResult()
    Assert-Report '() => jQuery("#groupsHTML tbody tr:not(.dtrg-start):visible").length === 0' 'Keyboard activation closes the group at phone width'
    if ($CaptureDirectory) {
        $null = New-Item -ItemType Directory -Path $CaptureDirectory -Force
        Save-HtmlBrowserScreenshot -Session $Session -OutFile (Join-Path $CaptureDirectory 'grouping-phone.png') -ErrorAction Stop | Out-Null
    }
    $Session.Page.SetViewportSizeAsync(1440, 1000).GetAwaiter().GetResult()
    Assert-Report '() => { const chart = Apex._chartInstances.find(c => c.id === "bounds"); return chart && chart.chart.w.globals.svgWidth > 1000; }' 'Chart resizes after returning to desktop width'
    if ($CaptureDirectory) {
        Save-HtmlBrowserScreenshot -Session $Session -OutFile (Join-Path $CaptureDirectory 'grouping-desktop.png') -ErrorAction Stop | Out-Null
        $null = $Session.Page.Locator('#bounds').ScrollIntoViewIfNeededAsync().GetAwaiter().GetResult()
        Save-HtmlBrowserScreenshot -Session $Session -OutFile (Join-Path $CaptureDirectory 'chart-bounds.png') -ErrorAction Stop | Out-Null
    }
    $ConsoleErrors = @(Get-HtmlBrowserConsoleLog -Session $Session -Severity Error)
    if ($ConsoleErrors.Count) { throw ($ConsoleErrors | ConvertTo-Json -Depth 5) }
} finally {
    Close-HtmlBrowserSession -Session $Session -ErrorAction Stop
}
$Results | ForEach-Object { "PASS: $_" }
