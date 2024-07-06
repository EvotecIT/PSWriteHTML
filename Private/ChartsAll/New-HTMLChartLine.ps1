function New-HTMLChartLine {
    <#
    .SYNOPSIS
    Creates a new HTML line chart with customizable options.

    .DESCRIPTION
    The New-HTMLChartLine function generates an HTML line chart with various customization options such as title, subtitle, legend, axis labels, colors, and more.

    .PARAMETER Chart
    Specifies the main chart configuration settings.

    .PARAMETER Stroke
    Specifies the stroke settings for the chart lines.

    .PARAMETER Series
    Specifies the data series for the chart.

    .PARAMETER DataLabel
    Specifies the data label settings.

    .PARAMETER Markers
    Specifies the marker settings for data points.

    .PARAMETER ChartAxisX
    Specifies the X-axis configuration settings.

    .PARAMETER ChartAxisY
    Specifies the Y-axis configuration settings.

    .PARAMETER Title
    Specifies the title of the chart.

    .PARAMETER SubTitle
    Specifies the subtitle of the chart.

    .PARAMETER Legend
    Specifies the legend settings.

    .PARAMETER PatternedColors
    Indicates whether to use patterned colors for the chart.

    .PARAMETER GradientColors
    Indicates whether to use gradient colors for the chart.

    .PARAMETER Colors
    Specifies custom colors for the chart elements.

    .PARAMETER GridOptions
    Specifies the grid options for the chart.

    .PARAMETER Toolbar
    Specifies the toolbar settings for the chart.

    .PARAMETER Theme
    Specifies the theme settings for the chart.

    .PARAMETER Events
    Specifies any events associated with the chart.

    .PARAMETER Design
    Specifies the design settings for the chart.

    .EXAMPLE
    New-HTMLChartLine -Chart @{width=800;height=400} -Stroke @("solid") -Series @(@{name="Series 1";data=@(10, 20, 30)}) -Title @{text="Line Chart"} -SubTitle @{text="Example"} -Legend @{show=$true} -ChartAxisX @{categories=@("Jan", "Feb", "Mar")} -ChartAxisY @("Y-Axis Label 1", "Y-Axis Label 2") -PatternedColors -GridOptions @{show=$true} -Toolbar @{show=$true} -Theme @{mode="light"} -Design @{colors=@("#FF5733", "#33FF57")}

    #>
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