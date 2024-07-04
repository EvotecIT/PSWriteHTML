function New-HTMLChartRadial {
    <#
    .SYNOPSIS
    Creates a radial chart in HTML format.

    .DESCRIPTION
    This function generates a radial chart in HTML format based on the provided data and options.

    .PARAMETER Chart
    Specifies the chart configuration settings.

    .PARAMETER DataNames
    Specifies an array of names for the data points.

    .PARAMETER Data
    Specifies an array of values for the data points.

    .PARAMETER Type
    Specifies the type of radial chart to create.

    .PARAMETER LabelAverage
    Specifies the label for the average value on the chart.

    .PARAMETER PlotOptions
    Specifies additional plot options for the chart.

    .PARAMETER Title
    Specifies the title of the chart.

    .PARAMETER SubTitle
    Specifies the subtitle of the chart.

    .PARAMETER Legend
    Specifies the legend configuration settings.

    .PARAMETER Colors
    Specifies an array of colors for the chart.

    .PARAMETER PatternedColors
    Indicates whether to use patterned colors for the chart.

    .PARAMETER GradientColors
    Indicates whether to use gradient colors for the chart.

    .PARAMETER GridOptions
    Specifies the grid options for the chart.

    .PARAMETER Toolbar
    Specifies the toolbar configuration settings.

    .PARAMETER Theme
    Specifies the theme for the chart.

    .PARAMETER Events
    Specifies the events to be associated with the chart.

    .PARAMETER Design
    Specifies the design settings for the chart.

    .EXAMPLE
    New-HTMLChartRadial -Chart @{ type = 'radial' } -DataNames @('A', 'B', 'C') -Data @(10, 20, 30) -Type 'line' -LabelAverage 'Average' -Title @{ text = 'Radial Chart' } -Colors @('#FF5733', '#33FF57', '#3357FF')

    Creates a radial chart with three data points labeled A, B, and C, with corresponding values 10, 20, and 30, using a line type, and a custom title with specified colors.

    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Chart,
        #[nullable[int]] $Height = 350,
        #[nullable[int]] $Width,

        [Array] $DataNames,
        [Array] $Data,
        [string] $Type,

        [string] $LabelAverage,


        [System.Collections.IDictionary] $PlotOptions,


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
    New-ChartInternalRadial -Options $Options -Names $DataNames -Values $Data -Type $Type
    if ($PlotOptions) {
        $Options.plotOptions = $PlotOptions
    }
    # This added label. It's useful if there's more then one data
    New-ChartInternalRadialDataLabels -Options $Options -Label $LabelAverage


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
    #New-ChartInternalSize -Options $Options -Height $Height -Width $Width
    if ($GridOptions) { New-ChartInternalGrid -Options $Options @GridOptions }
    if ($Theme) { New-ChartInternalTheme -Options $Options @Theme }
    if ($Toolbar) { New-ChartInternalToolbar -Options $Options @Toolbar -Show $true }
    New-ApexChart -Options $Options -Events $Events
}

#Register-ArgumentCompleter -CommandName New-HTMLChartRadial -ParameterName Colors -ScriptBlock $Script:ScriptBlockColors