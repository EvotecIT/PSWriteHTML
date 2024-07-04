function New-HTMLChartSpark {
    <#
    .SYNOPSIS
    Creates a new HTML chart spark with customizable options.

    .DESCRIPTION
    This function generates an HTML chart spark with various customizable options such as chart type, title, subtitle, legend, colors, grid options, and more.

    .PARAMETER Chart
    Specifies the main chart configuration settings.

    .PARAMETER ChartAxisX
    Specifies the X-axis configuration settings for the chart.

    .PARAMETER Title
    Specifies the title of the chart.

    .PARAMETER SubTitle
    Specifies the subtitle of the chart.

    .PARAMETER Legend
    Specifies the legend configuration settings.

    .PARAMETER Data
    Specifies the data to be displayed in the spark chart.

    .PARAMETER Colors
    Specifies the colors to be used in the chart.

    .PARAMETER PatternedColors
    Indicates whether patterned colors should be used.

    .PARAMETER GradientColors
    Indicates whether gradient colors should be used.

    .PARAMETER GridOptions
    Specifies the grid options for the chart.

    .PARAMETER Toolbar
    Specifies the toolbar configuration settings.

    .PARAMETER Theme
    Specifies the theme of the chart.

    .PARAMETER Events
    Specifies any events to be associated with the chart.

    .PARAMETER Design
    Specifies the design settings for the chart.

    .EXAMPLE
    New-HTMLChartSpark -Chart @{ type = 'line' } -ChartAxisX @{ categories = @('Jan', 'Feb', 'Mar') } -Title @{ text = 'Monthly Sales' } -Data @(100, 200, 150) -Colors @('red', 'blue', 'green')

    Creates a new HTML chart spark with a line chart type, X-axis categories for Jan, Feb, Mar, a title of 'Monthly Sales', data points of 100, 200, 150, and colors red, blue, green.

    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Chart,
        [System.Collections.IDictionary] $ChartAxisX,
        #[nullable[int]] $Height = 350,
        #[nullable[int]] $Width,

        [System.Collections.IDictionary] $Title,
        [System.Collections.IDictionary] $SubTitle,
        [System.Collections.IDictionary] $Legend,

        # Data to display in Spark
        [Array] $Data,

        [string[]] $Colors,

        [switch] $PatternedColors,
        [switch] $GradientColors,
        [System.Collections.IDictionary] $GridOptions,
        [System.Collections.IDictionary] $Toolbar,
        [System.Collections.IDictionary] $Theme,
        [Object] $Events,
        [System.Collections.IDictionary] $Design
    )

    $Options = [ordered] @{ }
    $Options.chart = $Chart
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
    New-ChartInternalSpark -Options $Options -Color $Colors -Values $Data


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
    #New-ChartInternalSize -Options $Options -Height $Height -Width $Width
    if ($GridOptions) { New-ChartInternalGrid -Options $Options @GridOptions }
    if ($Theme) { New-ChartInternalTheme -Options $Options @Theme }
    if ($Toolbar) { New-ChartInternalToolbar -Options $Options @Toolbar -Show $true }
    New-ApexChart -Options $Options -Events $Events
}

Register-ArgumentCompleter -CommandName New-HTMLChartSpark -ParameterName Color -ScriptBlock $Script:ScriptBlockColors