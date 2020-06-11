function New-GageSector {
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