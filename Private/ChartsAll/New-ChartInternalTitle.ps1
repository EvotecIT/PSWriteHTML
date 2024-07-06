function New-ChartInternalTitle {
    <#
    .SYNOPSIS
    Creates a new chart internal title with specified options.

    .DESCRIPTION
    This function creates a new chart internal title with the provided title text and alignment options.

    .PARAMETER Options
    An IDictionary object containing options for the chart title.

    .PARAMETER Title
    The text to be displayed as the chart title.

    .PARAMETER TitleAlignment
    Specifies the alignment of the chart title. Valid values are 'center', 'left', 'right', or 'default'.

    .EXAMPLE
    $chartOptions = [ordered]@{}
    New-ChartInternalTitle -Options $chartOptions -Title "Sales Data" -TitleAlignment "center"
    # Creates a chart title with the text "Sales Data" aligned to the center.

    .EXAMPLE
    $chartOptions = [ordered]@{}
    New-ChartInternalTitle -Options $chartOptions -Title "Revenue" -TitleAlignment "left"
    # Creates a chart title with the text "Revenue" aligned to the left.

    .EXAMPLE
    $chartOptions = [ordered]@{}
    New-ChartInternalTitle -Options $chartOptions -Title "Expenses" -TitleAlignment "right"
    # Creates a chart title with the text "Expenses" aligned to the right.
    #>

    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [string] $Title,
        [ValidateSet('center', 'left', 'right', 'default')][string] $TitleAlignment = 'default'
    )
    # title
    $Options.title = [ordered] @{ }
    if ($Title -ne '') {
        $Options.title.text = $Title
    }
    if ($TitleAlignment -ne 'default') {
        $Options.title.align = $TitleAlignment
    }
}