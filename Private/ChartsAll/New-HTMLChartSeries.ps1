function New-HTMLChartSeries {
    <#
    .SYNOPSIS
    Creates an ApexCharts series chart from prebuilt series definitions.

    .DESCRIPTION
    Shared renderer for additive ApexCharts types that use a series array, such as
    area, scatter, bubble, heatmap, and radar charts.
    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Chart,
        [ValidateSet('area', 'scatter', 'bubble', 'heatmap', 'radar')][string] $Type,
        [Array] $Series,
        [Array] $Stroke,

        [System.Collections.IDictionary] $DataLabel,
        [System.Collections.IDictionary] $Markers,
        [System.Collections.IDictionary] $ChartAxisX,
        [Array] $ChartAxisY,
        [System.Collections.IDictionary] $Title,
        [System.Collections.IDictionary] $SubTitle,
        [System.Collections.IDictionary] $Legend,

        [switch] $PatternedColors,
        [switch] $GradientColors,
        [string[]] $Colors,
        [System.Collections.IDictionary] $GridOptions,
        [System.Collections.IDictionary] $Toolbar,
        [System.Collections.IDictionary] $Theme,
        [Object] $Events,
        [System.Collections.IDictionary] $Design
    )

    $Options = [ordered] @{}
    $Options.chart = $Chart
    $Options.chart.type = $Type

    if ($Title) { $Options.title = $Title }
    if ($SubTitle) { $Options.subtitle = $SubTitle }
    if ($Legend) { $Options.legend = $Legend }
    if ($ChartAxisX) { New-ChartInternalAxisX -Options $Options @ChartAxisX }
    if ($ChartAxisY) { $Options.yaxis = $ChartAxisY }

    $Options.series = $Series
    if ($Stroke.Count -gt 0) {
        $Options.stroke = New-ChartInternalStroke -Stroke $Stroke
    }
    if ($Colors.Count -gt 0) {
        $Options.colors = @($Colors)
    }
    if ($DataLabel) {
        $Options.dataLabels = $DataLabel
    }
    if ($Markers) {
        $Options.markers = $Markers
    }

    if ($Design.fill.pattern) {
        $Options.fill = [ordered] @{
            type    = 'pattern'
            pattern = $Design.fill.pattern
        }
    } elseif ($Design.fill.gradient) {
        $Options.fill = [ordered] @{
            type     = 'gradient'
            gradient = $Design.fill.gradient
        }
    } elseif ($PatternedColors) {
        New-ChartInternalPattern
    } elseif ($GradientColors) {
        New-ChartInternalGradient
    }
    if ($GridOptions) { New-ChartInternalGrid -Options $Options @GridOptions }
    if ($Theme) { New-ChartInternalTheme -Options $Options @Theme }
    if ($Toolbar) { New-ChartInternalToolbar -Options $Options @Toolbar -Show $true }
    New-ApexChart -Options $Options -Events $Events
}
