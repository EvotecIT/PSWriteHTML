function New-ChartInternalAxisX {
    <#
    .SYNOPSIS
    Creates a new internal X-axis configuration for a chart with the specified options.

    .DESCRIPTION
    This function creates a new internal X-axis configuration for a chart with the provided options. It allows customization of the X-axis appearance and behavior.

    .PARAMETER Options
    Specifies the options for configuring the X-axis. This should be a dictionary containing the necessary settings for the X-axis.

    .PARAMETER TitleText
    Specifies the title text to be displayed for the X-axis.

    .PARAMETER Min
    Specifies the minimum value for the X-axis.

    .PARAMETER Max
    Specifies the maximum value for the X-axis.

    .PARAMETER Type
    Specifies the type of categories for the X-axis. Valid values are 'datetime', 'category', or 'numeric'.

    .PARAMETER Names
    Specifies the names of the categories to be displayed on the X-axis.

    .EXAMPLE
    $axisOptions = @{
        xaxis = @{}
    }
    $axisTitle = 'Time'
    $axisMin = 0
    $axisMax = 100
    $axisType = 'numeric'
    $axisNames = @('Category A', 'Category B', 'Category C')
    New-ChartInternalAxisX -Options $axisOptions -TitleText $axisTitle -Min $axisMin -Max $axisMax -Type $axisType -Names $axisNames

    Creates a new internal X-axis configuration with a title 'Time', a minimum value of 0, a maximum value of 100, categories of numeric type, and displays categories 'Category A', 'Category B', 'Category C' on the X-axis.
    #>
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