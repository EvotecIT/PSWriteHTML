function New-TableEvent {
    <#
    .SYNOPSIS
    Creates a new table event object.

    .DESCRIPTION
    This function creates a new table event object with the specified parameters.

    .PARAMETER TableID
    Specifies the ID of the table.

    .PARAMETER SourceColumnName
    Specifies the name of the source column.

    .PARAMETER TargetColumnID
    Specifies the ID of the target column.

    .PARAMETER SourceColumnID
    Specifies the ID of the source column.

    .EXAMPLE
    New-TableEvent -TableID "Table1" -SourceColumnName "Column1" -TargetColumnID 1 -SourceColumnID 2

    Creates a new table event object for Table1 with SourceColumnName "Column1", TargetColumnID 1, and SourceColumnID 2.

    #>
    [cmdletBinding()]
    param(
        [alias('ID')][string] $TableID,
        [string] $SourceColumnName,
        [nullable[int]] $TargetColumnID,
        [nullable[int]] $SourceColumnID
    )
    if (($null -ne $SourceColumnID -or $SourceColumnName) -and $null -ne $TargetColumnID) {
        $Object = [PSCustomObject] @{
            Type   = 'TableEvent'
            Output = @{
                TableID          = $TableID
                SourceColumnID   = $SourceColumnID
                SourceColumnName = $SourceColumnName
                TargetColumnID   = $TargetColumnID
            }
        }
        $Object
    } else {
        Write-Warning "New-TableEvent - SourceColumnId or SourceColumnName and TargetColumnID are required for events to work."
    }
}