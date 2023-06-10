function New-ChartRadial {
    [alias('ChartRadial')]
    [CmdletBinding()]
    param(
        [string] $Name,
        [object] $Value,
        [string] $Color
    )
    [PSCustomObject] @{
        ObjectType = 'Radial'
        Name       = $Name
        Value      = $Value
        Color      = if ($Color) { ConvertFrom-Color -Color $Color } else { $null }
    }
}

Register-ArgumentCompleter -CommandName New-ChartRadial -ParameterName Color -ScriptBlock $Script:ScriptBlockColors