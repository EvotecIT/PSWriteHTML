function New-ChartInternalAxisX {
    param(
        [System.Collections.IDictionary] $Options,
        [string] $Title,
        [int] $MinValue,
        [int] $MaxValue,
        [ValidateSet('datetime', 'category', 'numeric')][string] $DataCategoriesType = 'category',
        $DataCategories
    )

    if (-not $Options.Contains('xaxis')) {
        $Options.xaxis = @{}
    }
    if ($Title -ne '') {
        $Options.xaxis.title = @{}
        $Options.xaxis.title.text = $Title
    }
    if ($MinValue -gt 0) {
        $Options.xaxis.min = $MinValue
    }
    if ($MinValue -gt 0) {
        $Options.xaxis.max = $MaxValue
    }
    if ($DataCategoriesType -ne '') {
        $Options.xaxis.type = $DataCategoriesType
    }
    if ($DataCategories.Count -gt 0) {
        $Options.xaxis.categories = $DataCategories
    }
}