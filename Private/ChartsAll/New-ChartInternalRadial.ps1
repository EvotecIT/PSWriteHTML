function New-ChartInternalRadial {
    <#
    .SYNOPSIS
    Creates a new radial chart with specified options, values, names, and type.

    .DESCRIPTION
    This function creates a new radial chart with the provided options, values, names, and type. The radial chart type is set to 'radialBar'.

    .PARAMETER Options
    An IDictionary containing the options for the radial chart.

    .PARAMETER Values
    An array of values to be displayed in the radial chart.

    .PARAMETER Names
    An array of names corresponding to the values in the radial chart.

    .PARAMETER Type
    Specifies the type of radial chart to create.

    .EXAMPLE
    $options = @{}
    $values = 1, 2, 3
    $names = 'A', 'B', 'C'
    New-ChartInternalRadial -Options $options -Values $values -Names $names -Type 1
    # Creates a radial chart of Type 1 with values 1, 2, 3 and names 'A', 'B', 'C'.

    .EXAMPLE
    $options = @{}
    $values = 4, 5, 6
    $names = 'X', 'Y', 'Z'
    New-ChartInternalRadial -Options $options -Values $values -Names $names -Type 2
    # Creates a radial chart of Type 2 with values 4, 5, 6 and names 'X', 'Y', 'Z'.
    #>

    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [Array] $Values,
        [Array] $Names,
        $Type
    )
    # Chart defintion type, size
    $Options.chart.type = 'radialBar'


    if ($Type -eq '1') {
        New-ChartInternalRadialType1 -Options $Options
    } elseif ($Type -eq '2') {
        New-ChartInternalRadialType2 -Options $Options
    }

    $Options.series = @($Values)
    $Options.labels = @($Names)


}