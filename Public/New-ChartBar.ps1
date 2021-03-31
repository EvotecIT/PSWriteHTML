function New-ChartBar {
    [alias('ChartBar')]
    [CmdletBinding()]
    param(
        [string] $Name,
        [object] $Value
    )
    if ($null -eq $Value -or $Value -eq '') {
        $Value = 0
    }
    [PSCustomObject] @{
        ObjectType = 'Bar'
        Name       = $Name
        Value      = $Value
    }
}