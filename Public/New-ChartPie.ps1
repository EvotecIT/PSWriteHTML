function New-ChartPie {
    [alias('ChartPie')]
    [CmdletBinding()]
    param(
        [string] $Name,
        [object] $Value,
        [string] $Color
    )

    [PSCustomObject] @{
        ObjectType = 'Pie'
        Name       = $Name
        Value      = $Value
        Color      = $Color
    }
}
