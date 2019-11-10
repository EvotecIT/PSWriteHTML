function New-ChartBar {
    [alias('ChartBar')]
    [CmdletBinding()]
    param(
        [string] $Name,
        [object] $Value
    )
    [PSCustomObject] @{
        ObjectType = 'Bar'
        Name       = $Name
        Value      = $Value
    }
}