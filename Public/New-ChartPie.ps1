function New-ChartPie {
    [alias('ChartPie')]
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
        ObjectType = 'Pie'
        Name       = $Name
        Value      = $Value
        Color      = $Color
    }
}

Register-ArgumentCompleter -CommandName New-ChartPie -ParameterName Color -ScriptBlock $Script:ScriptBlockColors