function New-HTMLChartArea {
    <#
    .SYNOPSIS
    Creates a new HTML chart area with customizable options.

    .DESCRIPTION
    The New-HTMLChartArea function creates a new HTML chart area with various customizable options for creating interactive charts.

    .PARAMETER Chart
    Specifies the chart configuration settings.

    .PARAMETER Height
    Specifies the height of the chart area. Default is 350.

    .PARAMETER DataLabelsEnabled
    Indicates whether data labels are enabled. Default is $true.

    .PARAMETER DataLabelsOffsetX
    Specifies the horizontal offset for data labels. Default is -6.

    .PARAMETER DataLabelsFontSize
    Specifies the font size for data labels. Default is '12px'.

    .PARAMETER DataLabelsColor
    Specifies the color of data labels.

    .PARAMETER DataCategoriesType
    Specifies the type of data categories. Valid values are 'datetime', 'category', or 'numeric'. Default is 'category'.

    .PARAMETER LineCurve
    Specifies the curve type for lines. Valid values are 'straight', 'smooth', or 'stepline'. Default is 'straight'.

    .PARAMETER LineWidth
    Specifies the width of lines.

    .PARAMETER LineColor
    Specifies the color of lines.

    .PARAMETER GridColors
    Specifies the colors of the grid lines.

    .PARAMETER GridOpacity
    Specifies the opacity of the grid lines.

    .PARAMETER LegendPosition
    Specifies the position of the legend. Valid values are 'top', 'topRight', 'left', 'right', 'bottom', or 'default'. Default is 'default'.

    .PARAMETER TitleX
    Specifies the title for the X-axis.

    .PARAMETER TitleY
    Specifies the title for the Y-axis.

    .PARAMETER MarkerSize
    Specifies the size of markers.

    .PARAMETER Data
    Specifies the data points for the chart.

    .PARAMETER DataNames
    Specifies the names of the data series.

    .PARAMETER DataLegend
    Specifies the legends for the data series.

    .PARAMETER Zoom
    Indicates whether zoom functionality is enabled.

    .PARAMETER ChartAxisY
    Specifies the configuration settings for the Y-axis.

    .PARAMETER Legend
    Specifies the legend settings.

    .PARAMETER Title
    Specifies the title of the chart.

    .PARAMETER TitleAlignment
    Specifies the alignment of the chart title. Valid values are 'center', 'left', 'right', or 'default'. Default is 'default'.

    .PARAMETER PatternedColors
    Indicates whether to use patterned colors.

    .PARAMETER GradientColors
    Indicates whether to use gradient colors.

    .PARAMETER GridOptions
    Specifies additional grid options.

    .PARAMETER Toolbar
    Specifies the toolbar settings.

    .PARAMETER Theme
    Specifies the theme settings.

    .PARAMETER Design
    Specifies the design settings.

    .EXAMPLE
    New-HTMLChartArea -Chart @{ type = 'line'; data = @((1, 10), (2, 20), (3, 30)) } -Title 'Sample Line Chart' -DataLabelsEnabled $true

    Creates a new HTML line chart with sample data points and enables data labels.

    .EXAMPLE
    New-HTMLChartArea -Chart @{ type = 'bar'; data = @((1, 10), (2, 20), (3, 30)) } -Title 'Sample Bar Chart' -DataLabelsEnabled $false

    Creates a new HTML bar chart with sample data points and disables data labels.
    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Chart,
        #[nullable[int]] $Height = 350,

        [bool] $DataLabelsEnabled = $true,
        [int] $DataLabelsOffsetX = -6,
        [string] $DataLabelsFontSize = '12px',
        [string[]] $DataLabelsColor,
        [ValidateSet('datetime', 'category', 'numeric')][string] $DataCategoriesType = 'category',

        [ValidateSet('straight', 'smooth', 'stepline')] $LineCurve = 'straight',
        [int] $LineWidth,
        [string[]] $LineColor,

        [string[]] $GridColors,
        [double] $GridOpacity,

        [ValidateSet('top', 'topRight', 'left', 'right', 'bottom', 'default')][string] $LegendPosition = 'default',

        [string] $TitleX,
        [string] $TitleY,

        [int] $MarkerSize,

        [Array] $Data,
        [Array] $DataNames,
        [Array] $DataLegend,

        [switch] $Zoom,

        [System.Collections.IDictionary] $ChartAxisY,
        [System.Collections.IDictionary] $Legend,

        [string] $Title,
        [ValidateSet('center', 'left', 'right', 'default')][string] $TitleAlignment = 'default',
        [switch] $PatternedColors,
        [switch] $GradientColors,
        [System.Collections.IDictionary] $GridOptions,
        [System.Collections.IDictionary] $Toolbar,
        [System.Collections.IDictionary] $Theme,
        [System.Collections.IDictionary] $Design
    )

    $Options = [ordered] @{ }
    $Options.chart = $Chart
    if ($ChartAxisY) {
        $Options.yaxis = $ChartAxisY
    }
    if ($Legend) {
        $Options.legend = $Legend
    }
    New-ChartInternalArea -Options $Options -Data $Data -DataNames $DataNames

    New-ChartInternalStrokeDefinition -Options $Options `
        -LineShow $true `
        -LineCurve $LineCurve `
        -LineWidth $LineWidth `
        -LineColor $LineColor

    New-ChartInternalDataLabels -Options $Options `
        -DataLabelsEnabled $DataLabelsEnabled `
        -DataLabelsOffsetX $DataLabelsOffsetX `
        -DataLabelsFontSize $DataLabelsFontSize `
        -DataLabelsColor $DataLabelsColor


    New-ChartInternalAxisX -Options $Options `
        -Title $TitleX `
        -DataCategoriesType $DataCategoriesType `
        -DataCategories $DataLegend
    <# This needs rebuilding to new method - set above - remember to remove TitleY
    New-ChartInternalAxisY -Options $Options -Title $TitleY
    #>
    New-ChartInternalMarker -Options $Options -MarkerSize $MarkerSize
    New-ChartInternalZoom -Options $Options -Enabled:$Zoom

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
    New-ChartInternalTitle -Options $Options -Title $Title -TitleAlignment $TitleAlignment
    New-ChartInternalSize -Options $Options -Height $Height -Width $Width
    if ($GridOptions) { New-ChartInternalGrid -Options $Options @GridOptions }
    if ($Theme) { New-ChartInternalTheme -Options $Options @Theme }
    if ($Toolbar) { New-ChartInternalToolbar -Options $Options @Toolbar -Show $true }
    New-ApexChart -Options $Options
}
Register-ArgumentCompleter -CommandName New-HTMLChartArea -ParameterName DataLabelsColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLChartArea -ParameterName LineColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLChartArea -ParameterName GridColors -ScriptBlock $Script:ScriptBlockColors