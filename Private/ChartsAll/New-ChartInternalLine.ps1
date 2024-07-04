function New-ChartInternalLine {
    <#
    .SYNOPSIS
    Creates a new internal line chart configuration with specified data and options.

    .DESCRIPTION
    This function creates a new internal line chart configuration with the provided data points and data series names. It allows customization of the line chart type and data categories type.

    .PARAMETER Options
    Specifies the options for configuring the internal line chart. This should be a dictionary containing the necessary settings for the line chart.

    .PARAMETER Data
    Specifies the data points to be displayed in the line chart.

    .PARAMETER DataNames
    Specifies the names of the data series in the line chart.

    .PARAMETER DataCategoriesType
    Specifies the type of data categories for the line chart. Valid values are 'datetime', 'category', or 'numeric'.

    .EXAMPLE
    $lineChartOptions = @{
        chart = @{
            type = 'line'
        }
    }
    $dataPoints = @(100, 200, 300, 400, 500)
    $dataSeriesNames = @('Series A', 'Series B', 'Series C')
    New-ChartInternalLine -Options $lineChartOptions -Data $dataPoints -DataNames $dataSeriesNames -DataCategoriesType 'category'

    Creates a new internal line chart configuration with a line chart type, data points [100, 200, 300, 400, 500], data series named 'Series A', 'Series B', 'Series C', and data categories type as 'category'.
    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,

        [Array] $Data,
        [Array] $DataNames,
        #[Array] $DataLegend,

        # [bool] $DataLabelsEnabled = $true,
        #[int] $DataLabelsOffsetX = -6,
        #[string] $DataLabelsFontSize = '12px',
        # [string] $DataLabelsColor,
        [ValidateSet('datetime', 'category', 'numeric')][string] $DataCategoriesType = 'category'

        # $Type
    )
    # Chart defintion type, size
    $Options.chart = @{
        type = 'line'
    }

   # $Options.series = @( New-ChartInternalDataSet -Data $Data -DataNames $DataNames )

    # X AXIS - CATEGORIES
    if (-not $Options.xaxis) {
        $Options.xaxis = [ordered] @{}
    }
    if ($DataCategoriesType -ne '') {
        $Options.xaxis.type = $DataCategoriesType
    }
    #if ($DataCategories.Count -gt 0) {
    #   $Options.xaxis.categories = $DataCategories
    #}

}