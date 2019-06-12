function New-ChartInternalAxisY {
    param(
        [System.Collections.IDictionary] $Options,
        [string] $Title,
        [int] $MinValue,
        [int] $MaxValue
    )
    if (-not $Options.Contains('yaxis')) {
        $Options.yaxis = @{}
    }
    if ($Title -ne '') {
        $Options.yaxis.title = @{}
        $Options.yaxis.title.text = $Title
    }
    if ($MinValue -gt 0) {
        $Options.yaxis.min = $MinValue
    }
    if ($MinValue -gt 0) {
        $Options.yaxis.max = $MaxValue
    }
}
