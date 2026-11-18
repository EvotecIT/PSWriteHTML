<#
.SYNOPSIS
Prints generated reports to A4 portrait and landscape in Edge and checks their rightmost chart labels.
.DESCRIPTION
Requires PSParseHTML and Poppler's pdftotext on PATH. Writes the HTML and PDF fixtures to ReportDirectory.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string] $ReportDirectory
)

$ErrorActionPreference = 'Stop'
Import-Module (Join-Path $PSScriptRoot '../../PSWriteHTML.psd1') -Force
Import-Module PSParseHTML -MinimumVersion 3.0.3 -ErrorAction Stop
$PdfToText = Get-Command pdftotext -CommandType Application
$ReportDirectory = (New-Item -ItemType Directory -Path $ReportDirectory -Force).FullName
$IconPath = Join-Path $ReportDirectory 'print-icon.svg'
[IO.File]::WriteAllText($IconPath, '<svg xmlns="http://www.w3.org/2000/svg" width="1" height="1"/>')

function Add-ChartPrintFixture {
    param([string] $Id, [string] $RightLabel, [switch] $Line)

    $Size = if ($Line) { @{ Width = 1200 } } else { @{} }
    $Labels = 'Start', 'Early', 'Middle', 'Late', $RightLabel
    New-HTMLChart -Id $Id -Height 260 @Size {
        if ($Line) {
            New-ChartAxisX -Names $Labels
            New-ChartLine -Name 'Requests' -Value 2, 5, 3, 7, 9
        } else {
            New-ChartBarOptions -Vertical bar -DataLabelsEnabled $true
            for ($Index = 0; $Index -lt $Labels.Count; $Index++) {
                New-ChartBar -Name $Labels[$Index] -Value (5 - $Index)
            }
        }
    }
}

$Cases = @(
    @{ Name = 'single'; Labels = @('FinalBar') }
    @{ Name = 'multiple'; Labels = @('FinalBar', 'FinalLine') }
)
foreach ($Case in $Cases) {
    $null = New-HTML -TitleText 'Chart Print' -FilePath (Join-Path $ReportDirectory "$($Case.Name).html") -FavIcon $IconPath {
        # Keep this layout check independent of how quickly the browser paints chart animations.
        Add-HTMLScript -Placement Header -Content 'window.Apex = { chart: { animations: { enabled: false } } };'
        New-HTMLTab -Name 'Overview' {
            New-HTMLSection -HeaderText 'Status' {
                Add-ChartPrintFixture -Id bar-chart -RightLabel FinalBar
                if ($Case.Name -eq 'multiple') {
                    Add-ChartPrintFixture -Id line-chart -RightLabel FinalLine -Line
                }
            }
        }
    }
}

$ReadScreenState = @'
() => JSON.stringify(Array.from(document.querySelectorAll('svg.apexcharts-svg'), svg => ({
    width: svg.getBoundingClientRect().width,
    height: svg.getBoundingClientRect().height,
    viewBox: svg.getAttribute('viewBox')
})))
'@
$Session = Start-HtmlBrowserSession -Url ([uri](Join-Path $ReportDirectory 'single.html')).AbsoluteUri -Browser Chromium -BrowserChannel msedge -Visible:$false -ViewportWidth 1650 -ViewportHeight 1000
try {
    $Session.Page.SetDefaultTimeout(10000)
    foreach ($Case in $Cases) {
        $null = $Session.Page.GotoAsync(([uri](Join-Path $ReportDirectory "$($Case.Name).html")).AbsoluteUri).GetAwaiter().GetResult()
        $Ready = "() => document.querySelectorAll('.apexcharts-xaxis-label').length === $($Case.Labels.Count * 5)"
        $null = $Session.Page.WaitForFunctionAsync($Ready).GetAwaiter().GetResult()
        $Before = Invoke-HtmlBrowserScript -Session $Session -Script $ReadScreenState
        foreach ($Landscape in $false, $true) {
            $Orientation = if ($Landscape) { 'landscape' } else { 'portrait' }
            $PdfPath = Join-Path $ReportDirectory "$($Case.Name)-$Orientation.pdf"
            $OptionsType = $Session.Page.GetType().GetMethod('PdfAsync').GetParameters()[0].ParameterType
            $Options = [Activator]::CreateInstance($OptionsType)
            $Options.Format = 'A4'
            $Options.Landscape = $Landscape
            $Options.Path = $PdfPath
            $null = $Session.Page.PdfAsync($Options).GetAwaiter().GetResult()
            [xml] $PdfText = (& $PdfToText.Source -bbox $PdfPath -) -join "`n"
            if ($LASTEXITCODE -ne 0) { throw "Could not read $PdfPath." }
            foreach ($Label in $Case.Labels) {
                $Word = $PdfText.SelectSingleNode("//*[local-name()='word' and text()='$Label']")
                if (-not $Word -or [double]$Word.xMax -ge [double]$Word.ParentNode.width) {
                    throw "$Label is missing or clipped in $($Case.Name) $Orientation."
                }
            }
            $After = Invoke-HtmlBrowserScript -Session $Session -Script $ReadScreenState
            if ($Before -cne $After) { throw "Printing changed the screen charts in $($Case.Name) $Orientation." }
            "PASS: $($Case.Name) $Orientation (all right-edge labels visible; screen charts unchanged)"
        }
    }
    $Errors = @(Get-HtmlBrowserConsoleLog -Session $Session -Severity Error)
    if ($Errors.Count) { throw ($Errors | ConvertTo-Json -Depth 5) }
} finally {
    Close-HtmlBrowserSession -Session $Session -ErrorAction Stop
}
