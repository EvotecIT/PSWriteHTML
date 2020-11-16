function New-ChartInternalAxisX {
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [string] $TitleText,
        [Int64] $Min,
        [Int64] $Max,
        [ValidateSet('datetime', 'category', 'numeric')][string] $Type = 'category',
        [Array] $Names
    )

    if (-not $Options.Contains('xaxis')) {
        $Options.xaxis = @{ }
    }
    if ($TitleText -ne '') {
        $Options.xaxis.title = @{ }
        $Options.xaxis.title.text = $TitleText
    }
    if ($Min -gt 0) {
        $Options.xaxis.min = $Min
    }
    if ($Max -gt 0) {
        $Options.xaxis.max = $Max
    }
    if ($Type -ne '') {
        $Options.xaxis.type = $Type
    }
    if ($Names.Count -gt 0) {
        $Options.xaxis.categories = $Names
    }
}