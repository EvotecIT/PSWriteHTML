function New-HTMLChartLine {
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Chart,
        [Array] $Stroke,
        [Array] $Series,

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

    $Options = [ordered] @{ }
    $Options.chart = $Chart
    $Options['chart']['type'] = 'line'

    if ($Title) {
        $Options.title = $Title
    }
    if ($SubTitle) {
        $Options.subtitle = $SubTitle
    }
    if ($Legend) {
        $Options.legend = $Legend
    }
    if ($ChartAxisX) {
        New-ChartInternalAxisX -Options $Options @ChartAxisX
    }
    if ($ChartAxisY) {
        $Options.yaxis = $ChartAxisY
    }

    $Options.series = $DataSeries
    $Options.stroke = New-ChartInternalStroke -Stroke $Stroke
    # if stroke colors are defined we can either push them to stroke only or globally
    # if we push them to stroke only we don't get proper colors for the legend
    # but if we push them to both we could in theory have different colors for strokes and legend if need arises in the future.
    # in last approach we push them to global colors only
    $Options['colors'] = @($Colors)

    $Options.dataLabels = $DataLabel
    $Options.markers = $Markers

    # Default for all charts
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

Register-ArgumentCompleter -CommandName New-HTMLChartLine -ParameterName DataLabelsColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLChartLine -ParameterName LineColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLChartLine -ParameterName GridColors -ScriptBlock $Script:ScriptBlockColors