function New-ChartInternalTitle {
    param(
        [System.Collections.IDictionary] $Options,
        [string] $Title,
        [ValidateSet('center', 'left', 'right', '')][string] $TitleAlignment = ''
    )
    # title
    $Options.title = [ordered] @{}
    if ($TitleText -ne '') {
        $Options.title.text = $Title
    }
    if ($TitleAlignment -ne '') {
        $Options.title.align = $TitleAlignment
    }
}