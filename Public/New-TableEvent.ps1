function New-TableEvent {
    [cmdletBinding()]
    param(
        [string] $ID,
        [nullable[int]] $ColumnID
    )
    $Object = [PSCustomObject] @{
        Type     = 'TableEvent'
        Output = @{
            ID       = $ID
            ColumnID = $ColumnID
        }
    }
    $Object
}