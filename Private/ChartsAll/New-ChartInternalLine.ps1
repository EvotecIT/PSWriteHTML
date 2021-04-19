function New-ChartInternalLine {
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