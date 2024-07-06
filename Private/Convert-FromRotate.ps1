function ConvertFrom-Rotate {
    <#
    .SYNOPSIS
    Converts the input value to a CSS rotation string.

    .DESCRIPTION
    This function converts the input value to a CSS rotation string based on the input type and content.

    .PARAMETER Rotate
    Specifies the value to be converted to a CSS rotation string.

    .EXAMPLE
    ConvertFrom-Rotate -Rotate 90
    Output: "rotate(90deg)"

    .EXAMPLE
    ConvertFrom-Rotate -Rotate "rotate(180deg)"
    Output: "rotate(180deg)"

    .EXAMPLE
    ConvertFrom-Rotate -Rotate "180deg"
    Output: "rotate(180deg)"

    .EXAMPLE
    ConvertFrom-Rotate -Rotate "180"
    Output: "rotate(180deg)"
    #>
    [cmdletBinding()]
    param(
        [object] $Rotate
    )
    if ($Rotate -is [int]) {
        if ($Rotate -ne 0) {
            "rotate($($Rotate)deg)"
        }
    } elseif ($Rotate -is [string]) {
        if ($Rotate) {
            if (($Rotate -like '*deg*') -and ($Rotate -notlike '*rotate*')) {
                "rotate($Rotate)"
            } elseif (($Rotate -like '*deg*') -and ($Rotate -like '*rotate*')) {
                "$Rotate"
            } else {
                $Rotate
            }
        }
    }
}