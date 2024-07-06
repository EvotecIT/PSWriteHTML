function ConvertTo-Size {
    <#
    .SYNOPSIS
    Converts a given size value to an integer value, supporting both pixels (px) and points (pt).

    .DESCRIPTION
    This function takes a size value as input and converts it to an integer value. It supports both pixel (px) and point (pt) units. If the input size is in points, it will be converted to pixels using a conversion factor of 1.3333333333333333.

    .PARAMETER Size
    Specifies the size value to be converted. This parameter supports aliases 'TextSize' and 'FontSize'.

    .EXAMPLE
    ConvertTo-Size -Size 12
    Converts the size value 12 to an integer value 12.

    .EXAMPLE
    ConvertTo-Size -Size '14px'
    Converts the size value '14px' to an integer value 14.

    .EXAMPLE
    ConvertTo-Size -Size '10pt'
    Converts the size value '10pt' to an integer value 13 (converted to pixels using the conversion factor).

    #>
    [cmdletBinding()]
    param(
        [alias('TextSize', 'FontSize')][object] $Size
    )
    $Point = $false
    if ($Size -is [int]) {
        $Size
    } elseif ($Size -is [string]) {
        $IntSize = 0
        if ($Size -like '*px') {
            $Size = $Size -replace 'px'
        } elseif ($Size -like '*pt') {
            $Size = $Size -replace 'pt'
            $Point = $true # 1.3333333333333333
        }
        $Conversion = [int]::TryParse($Size, [ref] $IntSize)
        if ($Conversion) {
            if ($Point) {
                $IntSize * 1.3333333333333333
            } else {
                $IntSize
            }
        }
    }
}