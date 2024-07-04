function New-HTMLChartTimeLine {
    <#
    .SYNOPSIS
    Creates a new HTML timeline chart with customizable options.

    .DESCRIPTION
    This function generates an HTML timeline chart with various customization options such as title, subtitle, legend, data, colors, grid options, toolbar, theme, axis settings, tooltips, data labels, events, and design.

    .PARAMETER Chart
    Specifies the main chart configuration settings.

    .PARAMETER Title
    Specifies the title of the chart.

    .PARAMETER SubTitle
    Specifies the subtitle of the chart.

    .PARAMETER Legend
    Specifies the legend settings for the chart.

    .PARAMETER Data
    Specifies the data points to be displayed on the chart.

    .PARAMETER PatternedColors
    Indicates whether to use patterned colors for the chart.

    .PARAMETER GradientColors
    Indicates whether to use gradient colors for the chart.

    .PARAMETER GridOptions
    Specifies the grid options for the chart.

    .PARAMETER Toolbar
    Specifies the toolbar settings for the chart.

    .PARAMETER Theme
    Specifies the theme to be applied to the chart.

    .PARAMETER ChartAxisX
    Specifies the X-axis settings for the chart.

    .PARAMETER ChartAxisY
    Specifies the Y-axis settings for the chart.

    .PARAMETER ChartToolTip
    Specifies the tooltip settings for the chart.

    .PARAMETER DataLabel
    Specifies the data label settings for the chart.

    .PARAMETER Events
    Specifies any events to be associated with the chart.

    .PARAMETER Design
    Specifies the design options for the chart.

    .EXAMPLE
    $chartData = @{
        labels = @("Jan", "Feb", "Mar", "Apr")
        datasets = @(
            @{
                label = "Dataset 1"
                data = @([10, 20, 15, 25])
            },
            @{
                label = "Dataset 2"
                data = @([5, 15, 10, 20])
            }
        )
    }

    $chartOptions = @{
        Chart = @{
            height = 300
        }
        Title = @{
            text = "Monthly Sales"
        }
        SubTitle = @{
            text = "2021"
        }
        Legend = @{
            show = $true
        }
        Data = $chartData
        PatternedColors = $true
        GridOptions = @{
            show = $true
        }
        Theme = @{
            mode = "dark"
        }
        ChartAxisX = @{
            categories = @("Jan", "Feb", "Mar", "Apr")
        }
        ChartAxisY = @(
            @{
                seriesName = "Sales"
            }
        )
        ChartToolTip = @{
            enabled = $true
        }
        DataLabel = @{
            enabled = $true
        }
        Design = @{
            colors = @("#FF5733", "#33FF57")
        }
    }

    New-HTMLChartTimeLine @chartOptions
    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Chart,

        [System.Collections.IDictionary] $Title,
        [System.Collections.IDictionary] $SubTitle,
        [System.Collections.IDictionary] $Legend,

        [Array] $Data,
        [switch] $PatternedColors,
        [switch] $GradientColors,

        [System.Collections.IDictionary] $GridOptions,
        [System.Collections.IDictionary] $Toolbar,
        [System.Collections.IDictionary] $Theme,

        [System.Collections.IDictionary] $ChartAxisX,
        [Array] $ChartAxisY,

        [System.Collections.IDictionary] $ChartToolTip,
        [System.Collections.IDictionary] $DataLabel,
        [Object] $Events,
        [System.Collections.IDictionary] $Design
    )
    # Defaults
    $Options = [ordered] @{}
    $Options.chart = $Chart
    $Options['chart']['type'] = 'rangeBar'

    if ($Title) {
        $Options.title = $Title
    }
    if ($SubTitle) {
        $Options.subtitle = $SubTitle
    }
    if ($Legend) {
        $Options.legend = $Legend
    }

    if (-not $ChartAxisX) {
        $ChartAxisX = [ordered] @{}
    }
    $ChartAxisX.type = "datetime"
    New-ChartInternalAxisX -Options $Options @ChartAxisX

    if ($ChartAxisY) {
        # ChartAxisY in TimeLine charts doesn't support multiple AxisY
        # So we force it to use first one
        $Options.yaxis = $ChartAxisY[0]
    }

    if ($ChartToolTip) {
        New-ChartInternalToolTip -Options $Options @ChartToolTip
    }
    if ($DataLabel) {
        $Options.dataLabels = $DataLabel
    }

    New-ChartInternalTimeLine -Options $Options -Color $Color -Data $Data

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

Register-ArgumentCompleter -CommandName New-HTMLChartSpark -ParameterName Color -ScriptBlock $Script:ScriptBlockColors