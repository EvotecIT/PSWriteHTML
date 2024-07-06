function New-HTMLChartPie {
    <#
    .SYNOPSIS
    Creates a new HTML pie chart with customizable options.

    .DESCRIPTION
    The New-HTMLChartPie function generates an HTML pie chart with various customization options such as data labels, colors, titles, legends, and more.

    .PARAMETER Chart
    Specifies the chart configuration settings.

    .PARAMETER Type
    Specifies the type of chart to create.

    .PARAMETER DataLabelsEnabled
    Indicates whether data labels are enabled. Default is $true.

    .PARAMETER DataLabelsOffsetX
    Specifies the horizontal offset for data labels.

    .PARAMETER DataLabelsFontSize
    Specifies the font size for data labels.

    .PARAMETER DataLabelsColor
    Specifies the color for data labels.

    .PARAMETER Data
    Specifies the data values for the chart.

    .PARAMETER DataNames
    Specifies the names corresponding to the data values.

    .PARAMETER Title
    Specifies the title settings for the chart.

    .PARAMETER SubTitle
    Specifies the subtitle settings for the chart.

    .PARAMETER Legend
    Specifies the legend settings for the chart.

    .PARAMETER Colors
    Specifies the colors to be used in the chart.

    .PARAMETER PatternedColors
    Indicates whether patterned colors are used.

    .PARAMETER GradientColors
    Indicates whether gradient colors are used.

    .PARAMETER GridOptions
    Specifies the grid options for the chart.

    .PARAMETER Toolbar
    Specifies the toolbar settings for the chart.

    .PARAMETER Theme
    Specifies the theme settings for the chart.

    .PARAMETER Events
    Specifies the events to be associated with the chart.

    .PARAMETER Design
    Specifies the design settings for the chart.

    .EXAMPLE
    New-HTMLChartPie -Chart @{ type = 'pie' } -Type 'pie' -Data @(10, 20, 30) -DataNames @('A', 'B', 'C') -Colors @('red', 'green', 'blue')

    Creates a new pie chart with specified data values and names using custom colors.

    .EXAMPLE
    New-HTMLChartPie -Chart @{ type = 'donut' } -Type 'donut' -Data @(25, 35, 40) -DataNames @('X', 'Y', 'Z') -Colors @('orange', 'purple', 'yellow')

    Creates a new donut chart with specified data values and names using custom colors.
    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Chart,
        [string] $Type,
        #[nullable[int]] $Height = 350,
        #[nullable[int]] $Width,

        [bool] $DataLabelsEnabled = $true,
        [int] $DataLabelsOffsetX = -6,
        [string] $DataLabelsFontSize = '12px',
        [string[]] $DataLabelsColor,
        [Array] $Data,
        [Array] $DataNames,

        [System.Collections.IDictionary] $Title,
        [System.Collections.IDictionary] $SubTitle,
        [System.Collections.IDictionary] $Legend,

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
    New-ChartInternalPie -Options $Options -Names $DataNames -Values $Data -Type $Type
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
    New-ChartInternalSize -Options $Options -Height $Height -Width $Width
    if ($GridOptions) { New-ChartInternalGrid -Options $Options @GridOptions }
    if ($Theme) { New-ChartInternalTheme -Options $Options @Theme }
    if ($Toolbar) { New-ChartInternalToolbar -Options $Options @Toolbar -Show $true }
    New-ApexChart -Options $Options -Events $Events
}

Register-ArgumentCompleter -CommandName New-HTMLChartPie -ParameterName DataLabelsColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLChartPie -ParameterName Colors -ScriptBlock $Script:ScriptBlockColors