function New-ChartDonut {
    [alias('ChartDonut')]
    [CmdletBinding()]
    param(
        [string] $Name,
        [object] $Value,
        [RGBColors] $Color
    )

    [PSCustomObject] @{
        ObjectType = 'Donut'
        Name       = $Name
        Value      = $Value
        Color      = $Color
    }
}
