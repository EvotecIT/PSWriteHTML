function New-HTMLChartBar {
    <#
    .SYNOPSIS
    Creates a new HTML bar chart with customizable options.

    .DESCRIPTION
    This function generates an HTML bar chart with various customization options such as colors, data labels, axis settings, and more.

    .PARAMETER Chart
    Specifies the main configuration settings for the chart.

    .PARAMETER Type
    Specifies the type of bar chart. Valid values are 'bar', 'barStacked', 'barStacked100Percent'. Default is 'bar'.

    .PARAMETER Colors
    Specifies an array of colors to be used in the chart.

    .PARAMETER Horizontal
    Indicates whether the chart should be displayed horizontally. Default is $true.

    .PARAMETER DataLabelsEnabled
    Indicates whether data labels should be displayed on the chart. Default is $true.

    .PARAMETER DataLabelsOffsetX
    Specifies the horizontal offset for data labels. Default is -6.

    .PARAMETER DataLabelsFontSize
    Specifies the font size for data labels. Default is '12px'.

    .PARAMETER DataLabelsColor
    Specifies the color for data labels.

    .PARAMETER Distributed
    Indicates whether the data is distributed evenly across the chart.

    .PARAMETER Data
    Specifies an array of data points for the chart.

    .PARAMETER DataNames
    Specifies an array of names for the data points.

    .PARAMETER DataLegend
    Specifies an array of legends for the data points.

    .PARAMETER ChartAxisX
    Specifies the configuration settings for the X-axis of the chart.

    .PARAMETER ChartAxisY
    Specifies the configuration settings for the Y-axis of the chart.

    .PARAMETER Title
    Specifies the title of the chart.

    .PARAMETER SubTitle
    Specifies the subtitle of the chart.

    .PARAMETER Legend
    Specifies the legend settings for the chart.

    .PARAMETER PatternedColors
    Indicates whether patterned colors should be used in the chart.

    .PARAMETER GradientColors
    Indicates whether gradient colors should be used in the chart.

    .PARAMETER GridOptions
    Specifies the grid options for the chart.

    .PARAMETER Toolbar
    Specifies the toolbar settings for the chart.

    .PARAMETER Theme
    Specifies the theme settings for the chart.

    .PARAMETER Events
    Specifies any events to be associated with the chart.

    .PARAMETER Design
    Specifies the design settings for the chart.

    .EXAMPLE
    New-HTMLChartBar -Chart @{ type = 'bar'; data = @([1, 2, 3]); categories = @('A', 'B', 'C') } -Title @{ text = 'Sample Chart' } -Colors @('red', 'blue', 'green')

    Creates a new bar chart with specified data, categories, title, and colors.

    .EXAMPLE
    New-HTMLChartBar -Chart @{ type = 'barStacked'; data = @([10, 20, 30]); categories = @('X', 'Y', 'Z') } -Title @{ text = 'Stacked Chart' } -Colors @('orange', 'purple', 'yellow')

    Creates a new stacked bar chart with specified data, categories, title, and colors.
    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Chart,
        [ValidateSet('bar', 'barStacked', 'barStacked100Percent')] $Type = 'bar',
        [string[]] $Colors,

        [bool] $Horizontal = $true,
        [bool] $DataLabelsEnabled = $true,
        [int] $DataLabelsOffsetX = -6,
        [string] $DataLabelsFontSize = '12px',
        [string] $DataLabelsColor,

        [switch] $Distributed,
        [Array] $Data,
        [Array] $DataNames,
        [Array] $DataLegend,

        [System.Collections.IDictionary] $ChartAxisX,
        [Array] $ChartAxisY,
        [System.Collections.IDictionary] $Title,
        [System.Collections.IDictionary] $SubTitle,
        [System.Collections.IDictionary] $Legend,

        [switch] $PatternedColors,
        [switch] $GradientColors,
        [System.Collections.IDictionary] $GridOptions,
        [System.Collections.IDictionary] $Toolbar,
        [System.Collections.IDictionary] $Theme,
        [Object] $Events,
        [System.Collections.IDictionary] $Design
    )
    # Defaults
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
    if ($ChartAxisY) {
        # ChartAxisY in Bar charts doesn't support multiple AxisY
        # So we force it to use first one
        $Options.yaxis = $ChartAxisY[0]
    }

    New-ChartInternalBar -Options $Options -Horizontal $Horizontal -DataLabelsEnabled $DataLabelsEnabled `
        -DataLabelsOffsetX $DataLabelsOffsetX -DataLabelsFontSize $DataLabelsFontSize -DataLabelsColor $DataLabelsColor `
        -Data $Data -DataNames $DataNames -DataLegend $DataLegend `
        -Type $Type -Distributed:$Distributed

    New-ChartInternalColors -Options $Options -Colors $Colors
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

Register-ArgumentCompleter -CommandName New-HTMLChartBar -ParameterName Colors -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLChartBar -ParameterName DataLabelsColor -ScriptBlock $Script:ScriptBlockColors