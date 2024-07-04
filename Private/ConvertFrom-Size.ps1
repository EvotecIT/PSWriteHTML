function ConvertFrom-Size {
    <#
    .SYNOPSIS
    Converts the input size to a pixel value.

    .DESCRIPTION
    This function converts the input size to a pixel value. It accepts either an integer or a string representing a number.

    .PARAMETER Size
    Specifies the size to convert. This can be provided as an integer or a string.

    .EXAMPLE
    ConvertFrom-Size -Size 12
    Output: "12px"

    .EXAMPLE
    ConvertFrom-Size -Size "24"
    Output: "24px"

    .NOTES
    Author: Your Name
    Date: Current Date
    Version: 1.0
    #>
    [cmdletBinding()]
    param(
        [alias('TextSize', 'FontSize')][object] $Size
    )
    if ($Size -is [int]) {
        "$($Size)px"
    } elseif ($Size -is [string]) {
        $IntSize = 0
        $Conversion = [int]::TryParse($Size, [ref] $IntSize)
        if ($Conversion) {
            "$($Size)px"
        } else {
            $Size
        }
    } else {
        $Size
    }
}