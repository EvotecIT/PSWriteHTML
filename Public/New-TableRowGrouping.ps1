function New-TableRowGrouping {
    [alias('TableRowGrouping', 'EmailTableRowGrouping', 'New-HTMLTableRowGrouping')]
    [CmdletBinding()]
    param(
        [alias('ColumnName')][string] $Name,
        [int] $ColumnID = -1
    )
    [PSCustomObject] @{
        Type   = 'TableRowGrouping'
        Output = @{
            Name     = $Name
            ColumnID = $ColumnID
        }
    }
}