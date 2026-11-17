<#
.SYNOPSIS
Checks generated email layout widths and chart legend spacing in headless Edge.
.DESCRIPTION
Serve ReportDirectory through BaseUri on loopback. These are browser checks;
they do not establish native Outlook rendering behavior.
.EXAMPLE
./Tests/Browser/Invoke-EmailLayoutWidthTest.ps1 -ReportDirectory D:/Scratch/reports -BaseUri http://127.0.0.1:58995/
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

foreach ($Case in @(
    @{ Name = 'pixels'; Layout = @{ Width = '800' }; Left = '200'; Right = '600' }
    @{ Name = 'percent'; Layout = @{ Width = '75%' }; Left = '25%'; Right = '75%' }
    @{ Name = 'default'; Layout = @{}; Left = '25%'; Right = '75%' }
)) {
    $LayoutParameters = $Case.Layout
    $EmailHtml = EmailBody {
        EmailLayout @LayoutParameters {
            EmailLayoutColumn -Width $Case.Left -BorderBottomStyle solid -BorderBottomColor Gray -BorderBottomWidthSize 1 {
                EmailText -Text 'Summary' -FontSize 16 -Color Navy
            }
            EmailLayoutColumn -Width $Case.Right -BorderBottomStyle solid -BorderBottomColor Gray -BorderBottomWidthSize 1 {
                EmailText -Text 'Details use the remaining column width.' -FontSize 16
            }
        }
    }
    $EmailHtml = $EmailHtml.Replace('</head>', '<link rel="icon" type="image/svg+xml" href="report-icon.svg"></head>')
    [IO.File]::WriteAllText((Join-Path $ReportDirectory ("layout-$($Case.Name).html")), $EmailHtml)
}
$null = New-HTML -TitleText 'Legend spacing' -FavIcon $IconPath -FilePath (Join-Path $ReportDirectory 'legend-spacing.html') {
    foreach ($Margin in @(12, 0)) {
        New-HTMLChart -Id "legend$Margin" -Title "Vertical legend spacing: $Margin" -Height 260 {
            New-ChartPie -Name First -Value 40
            New-ChartPie -Name Second -Value 60
            New-ChartLegend -LegendPosition right -ItemMarginVertical $Margin
        }
    }
}

$Session = Start-HtmlBrowserSession -Url ([uri]::new($BaseUri, 'layout-pixels.html').AbsoluteUri) -Browser Chromium -BrowserChannel msedge -Visible:$false -ViewportWidth 1440 -ViewportHeight 900 -ErrorAction Stop
$Results = [System.Collections.Generic.List[string]]::new()
try {
    $Session.Page.SetDefaultTimeout(10000)
    function Assert-Layout {
        param([string] $Expression, [string] $Case)
        $null = $Session.Page.WaitForFunctionAsync($Expression).GetAwaiter().GetResult()
        $Results.Add($Case)
    }
    Assert-Layout '() => { const table = document.querySelector("table.layoutTable"); return table && Math.abs(table.getBoundingClientRect().width - 800) < 1 && Math.abs(table.rows[0].cells[0].getBoundingClientRect().width - 200) < 1 && Math.abs(table.rows[0].cells[1].getBoundingClientRect().width - 600) < 1; }' 'Pixel layout renders at 800 with 200 and 600 pixel columns'
    if ($CaptureDirectory) {
        $null = New-Item -ItemType Directory -Path $CaptureDirectory -Force
        Save-HtmlBrowserScreenshot -Session $Session -OutFile (Join-Path $CaptureDirectory 'email-desktop.png') -ErrorAction Stop | Out-Null
    }
    $Session.Page.SetViewportSizeAsync(390, 844).GetAwaiter().GetResult()
    Assert-Layout '() => { const table = document.querySelector("table.layoutTable"); return table && table.getBoundingClientRect().width <= innerWidth && document.documentElement.scrollWidth <= innerWidth && table.textContent.includes("Summary") && table.textContent.includes("Details"); }' 'Pixel layout fits a phone viewport without losing content'
    if ($CaptureDirectory) {
        Save-HtmlBrowserScreenshot -Session $Session -OutFile (Join-Path $CaptureDirectory 'email-phone.png') -ErrorAction Stop | Out-Null
    }
    $Session.Page.SetViewportSizeAsync(1440, 900).GetAwaiter().GetResult()
    foreach ($Case in @(@{ Name = 'percent'; Fraction = 0.75 }, @{ Name = 'default'; Fraction = 1 })) {
        $null = $Session.Page.GotoAsync([uri]::new($BaseUri, "layout-$($Case.Name).html").AbsoluteUri).GetAwaiter().GetResult()
        Assert-Layout ('() => { const table = document.querySelector("table.layoutTable"); return table && Math.abs(table.getBoundingClientRect().width - document.body.clientWidth * ' + $Case.Fraction.ToString([Globalization.CultureInfo]::InvariantCulture) + ') < 2 && Math.abs(table.rows[0].cells[0].getBoundingClientRect().width / table.getBoundingClientRect().width - 0.25) < 0.01; }') "$($Case.Name) outer and column percentage widths render correctly"
    }
    $null = $Session.Page.GotoAsync([uri]::new($BaseUri, 'legend-spacing.html').AbsoluteUri).GetAwaiter().GetResult()
    foreach ($Margin in @(12, 0)) {
        Assert-Layout ('() => { const items = document.querySelectorAll("#legend' + $Margin + ' .apexcharts-legend-series"); return items.length === 2 && [...items].every(item => parseFloat(getComputedStyle(item).marginTop) === ' + $Margin + ' && parseFloat(getComputedStyle(item).marginBottom) === ' + $Margin + '); }') "Legend vertical-only spacing renders at $Margin pixels"
    }
    Assert-Layout '() => Apex._chartInstances.length === 2 && Apex._chartInstances.every(item => item.chart.w.globals.animationEnded)' 'Charts finish animation before visual inspection'
    if ($CaptureDirectory) {
        Save-HtmlBrowserScreenshot -Session $Session -OutFile (Join-Path $CaptureDirectory 'legend-desktop.png') -ErrorAction Stop | Out-Null
    }
    $ConsoleErrors = @(Get-HtmlBrowserConsoleLog -Session $Session -Severity Error)
    if ($ConsoleErrors.Count) { throw ($ConsoleErrors | ConvertTo-Json -Depth 5) }
} finally {
    Close-HtmlBrowserSession -Session $Session -ErrorAction Stop
}
$Results | ForEach-Object { "PASS: $_" }
