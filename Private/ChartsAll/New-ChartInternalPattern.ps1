function New-ChartInternalPattern {
    <#
    .SYNOPSIS
    Creates a new chart internal pattern with specified options.

    .DESCRIPTION
    The New-ChartInternalPattern function creates a new chart internal pattern with the specified options. It allows customization of the pattern style, opacity, and type.

    .EXAMPLE
    New-ChartInternalPattern -Type 'pattern' -Opacity 1 -PatternStyle 'circles'

    Description
    -----------
    Creates a new chart internal pattern with circles pattern style and opacity of 1.

    .EXAMPLE
    New-ChartInternalPattern -Type 'pattern' -Opacity 0.5 -PatternStyle 'verticalLines'

    Description
    -----------
    Creates a new chart internal pattern with vertical lines pattern style and opacity of 0.5.

    #>
    [CmdletBinding()]
    param(

    )
    $Options.fill = [ordered]@{
        type    = 'pattern'
        opacity = 1
        pattern = [ordered]@{
            style = @('circles', 'slantedLines', 'verticalLines', 'horizontalLines')
        }
    }
}