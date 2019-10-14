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
        Color      = $Color
    }
}