function New-ChartSpark {
    [alias('ChartSpark')]
    [CmdletBinding()]
    param(
        [string] $Name,
        [object] $Value,
        [string] $Color
    )

    [PSCustomObject] @{
        ObjectType = 'Spark'
        Name       = $Name
        Value      = $Value
        Color      = $Color
    }
}