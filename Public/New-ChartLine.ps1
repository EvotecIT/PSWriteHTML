function New-ChartLine {
    [alias('ChartLine')]
    [CmdletBinding()]
    param(
        [string] $Name,
        [object] $Value
    )
    [PSCustomObject] @{
        ObjectType = 'Line'
        Name       = $Name
        Value      = $Value
    }
}
