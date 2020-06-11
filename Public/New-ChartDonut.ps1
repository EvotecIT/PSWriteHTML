function New-ChartDonut {
    [alias('ChartDonut')]
    [CmdletBinding()]
    param(
        [string] $Name,
        [object] $Value,
        [string] $Color
    )

    [PSCustomObject] @{
        ObjectType = 'Donut'
        Name       = $Name
        Value      = $Value
        Color      = $Color
    }
}
Register-ArgumentCompleter -CommandName New-ChartDonut -ParameterName Color -ScriptBlock $Script:ScriptBlockColors