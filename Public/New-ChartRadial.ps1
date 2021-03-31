function New-ChartRadial {
    [alias('ChartRadial')]
    [CmdletBinding()]
    param(
        [string] $Name,
        [object] $Value,
        [string] $Color
    )
    if ($null -eq $Value -or $Value -eq '') {
        $Value = 0
    }
    [PSCustomObject] @{
        ObjectType = 'Radial'
        Name       = $Name
        Value      = $Value
        Color      = $Color
    }
}

Register-ArgumentCompleter -CommandName New-ChartRadial -ParameterName Color -ScriptBlock $Script:ScriptBlockColors