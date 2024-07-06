Function New-ChartInternalBar {
    <#
    .SYNOPSIS
    Creates a new internal bar chart with the specified data and options.

    .DESCRIPTION
    This function creates a new internal bar chart with the provided data and options. It allows customization of the chart appearance and behavior.

    .PARAMETER Options
    Specifies the options for configuring the internal bar chart. This should be a dictionary containing the necessary settings for the chart.

    .PARAMETER Horizontal
    Specifies whether the bars should be displayed horizontally. Default is true.

    .PARAMETER DataLabelsEnabled
    Specifies whether data labels should be enabled on the bars. Default is true.

    .PARAMETER DataLabelsOffsetX
    Specifies the horizontal offset for the data labels. Default is -6.

    .PARAMETER DataLabelsFontSize
    Specifies the font size for the data labels. Default is '12px'.

    .PARAMETER DataLabelsColor
    Specifies the color for the data labels.

    .PARAMETER Formatter
    Specifies the formatter for the data labels.

    .PARAMETER Type
    Specifies the type of bar chart. Valid values are 'bar', 'barStacked', or 'barStacked100Percent'. Default is 'bar'.

    .PARAMETER Distributed
    Indicates whether the bars should be distributed evenly. This is a switch parameter.

    .PARAMETER Data
    Specifies the data points to be displayed on the internal bar chart.

    .PARAMETER DataNames
    Specifies the names of the data series to be displayed on the internal bar chart.

    .PARAMETER DataLegend
    Specifies the legend for the data series displayed on the internal bar chart.

    .EXAMPLE
    $chartOptions = @{
        chart = @{
            id = 'internal-bar-chart'
        }
    }
    $chartData = @(100, 200, 300, 400, 500)
    $chartDataNames = @('Series 1')
    $chartDataLegend = @('Legend 1')
    New-ChartInternalBar -Options $chartOptions -Data $chartData -DataNames $chartDataNames -DataLegend $chartDataLegend

    Creates a new internal bar chart with a single series named 'Series 1' displaying data points [100, 200, 300, 400, 500]. The legend 'Legend 1' is associated with the series.

    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [bool] $Horizontal = $true,
        [bool] $DataLabelsEnabled = $true,
        [int] $DataLabelsOffsetX = -6,
        [string] $DataLabelsFontSize = '12px',
        [string[]] $DataLabelsColor,
        #[string] $Title,
        #[ValidateSet('center', 'left', 'right', 'default')][string] $TitleAlignment = 'default',
        [string] $Formatter,
        [ValidateSet('bar', 'barStacked', 'barStacked100Percent')] $Type = 'bar',
        #[string[]] $Colors,

        [switch] $Distributed,

        [Array] $Data,
        [Array] $DataNames,
        [Array] $DataLegend
    )

    if ($Type -eq 'bar') {
        $Options.chart.type = 'bar'
    } elseif ($Type -eq 'barStacked') {
        $Options.chart.type = 'bar'
        $Options.chart.stacked = $true
    } else {
        $Options.chart.type = 'bar'
        $Options.chart.stacked = $true
        $Options.chart.stackType = '100%'
    }

    $Options.plotOptions = @{
        bar = @{
            horizontal = $Horizontal
        }
    }
    if ($Distributed) {
        $Options.plotOptions.bar.distributed = $Distributed.IsPresent
    }
    $Options.dataLabels = [ordered] @{
        enabled = $DataLabelsEnabled
        offsetX = $DataLabelsOffsetX
        style   = @{
            fontSize = $DataLabelsFontSize
        }
    }
    if ($null -ne $DataLabelsColor) {
        $RGBColorLabel = ConvertFrom-Color -Color $DataLabelsColor
        $Options.dataLabels.style.colors = @($RGBColorLabel)
    }
    $Options.series = @(New-ChartInternalDataSet -Data $Data -DataNames $DataLegend)

    # X AXIS - CATEGORIES
    if (-not $Options.Contains('xaxis')) {
        $Options.xaxis = [ordered] @{ }
    }
    # if ($DataCategoriesType -ne '') {
    #    $Options.xaxis.type = $DataCategoriesType
    #}
    if ($DataNames.Count -gt 0) {
        $Options.xaxis.categories = $DataNames
        # Need to figure out how to conver to json and leave function without ""
        #if ($Formatter -ne '') {
        #$Options.xaxis.labels = @{
        #formatter = "function(val) { return val + `"$Formatter`" }"
        #}
        #}
    }
}
Register-ArgumentCompleter -CommandName New-ChartInternalBar -ParameterName DataLabelsColor -ScriptBlock $Script:ScriptBlockColors