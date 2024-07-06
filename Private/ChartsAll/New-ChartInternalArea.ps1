function New-ChartInternalArea {
    <#
    .SYNOPSIS
    Creates a new internal area chart with the specified data and options.

    .DESCRIPTION
    This function creates a new internal area chart with the provided data and options. It allows customization of the chart appearance and behavior.

    .PARAMETER Options
    Specifies the options for configuring the internal area chart. This should be a dictionary containing the necessary settings for the chart.

    .PARAMETER Data
    Specifies the data points to be displayed on the internal area chart.

    .PARAMETER DataNames
    Specifies the names of the data series to be displayed on the internal area chart.

    .PARAMETER DataLegend
    Specifies the legend for the data series displayed on the internal area chart.

    .PARAMETER DataCategoriesType
    Specifies the type of categories for the X-axis of the internal area chart. Valid values are 'datetime', 'category', or 'numeric'.

    .EXAMPLE
    $chartOptions = @{
        chart = @{
            id = 'internal-area-chart'
        }
    }
    $chartData = @(100, 200, 300, 400, 500)
    $chartDataNames = @('Series 1')
    $chartDataLegend = @('Legend 1')
    New-ChartInternalArea -Options $chartOptions -Data $chartData -DataNames $chartDataNames -DataLegend $chartDataLegend -DataCategoriesType 'numeric'

    Creates a new internal area chart with a single series named 'Series 1' displaying data points [100, 200, 300, 400, 500]. The legend 'Legend 1' is associated with the series, and the X-axis categories are of numeric type.

    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,

        [Array] $Data,
        [Array] $DataNames,
        [Array] $DataLegend,

        #[bool] $DataLabelsEnabled = $true,
        #[int] $DataLabelsOffsetX = -6,
        #[string] $DataLabelsFontSize = '12px',
        #[string] $DataLabelsColor,
        [ValidateSet('datetime', 'category', 'numeric')][string] $DataCategoriesType = 'category'

        #$Type
    )
    # Chart defintion type, size
    $Options.chart.type = 'area'
    $Options.series = @( New-ChartInternalDataSet -Data $Data -DataNames $DataNames )

    # X AXIS - CATEGORIES
    $Options.xaxis = [ordered] @{}
    if ($DataCategoriesType -ne '') {
        $Options.xaxis.type = $DataCategoriesType
    }
    if ($DataCategories.Count -gt 0) {
        $Options.xaxis.categories = $DataCategories
    }

}