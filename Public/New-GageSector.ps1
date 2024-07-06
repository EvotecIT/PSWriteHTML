function New-GageSector {
    <#
    .SYNOPSIS
    Creates a new gauge sector with specified color, minimum value, and maximum value.

    .DESCRIPTION
    This function creates a new gauge sector with the provided color, minimum value, and maximum value. It is useful for visualizing data within a specific range.

    .PARAMETER Color
    Specifies the color of the gauge sector.

    .PARAMETER Min
    Specifies the minimum value of the gauge sector.

    .PARAMETER Max
    Specifies the maximum value of the gauge sector.

    .EXAMPLE
    $sector = New-GageSector -Color 'red' -Min 0 -Max 100
    Creates a new gauge sector with a red color, minimum value of 0, and maximum value of 100.

    .NOTES
    Additional notes
    #>
    [CmdletBinding()]
    param(
        [string] $Color,
        [int] $Min,
        [int] $Max
    )

    [ordered] @{
        color = ConvertFrom-Color -Color $Color
        lo   = $Min
        hi   = $Max
    }
}
Register-ArgumentCompleter -CommandName New-GageSection -ParameterName Color -ScriptBlock $Script:ScriptBlockColors