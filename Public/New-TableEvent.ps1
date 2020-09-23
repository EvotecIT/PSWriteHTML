function New-TableEvent {
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