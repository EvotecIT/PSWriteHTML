function New-TableAlphabetSearch {
    [alias('TableAlphabetSearch', 'New-HTMLTableAlphabetSearch')]
    [CmdletBinding(DefaultParameterSetName = 'ID')]
    param(
        [Parameter(Mandatory, ParameterSetName = 'ID')][int] $ColumnID,
        [Parameter(Mandatory, ParameterSetName = 'Name')][string] $ColumnName,
        [switch] $AddNumbers,
        [switch] $CaseSensitive
    )
    $Output = [PSCustomObject]@{
        Type   = 'TableAlphabetSearch'
        Output = @{
            ColumnID   = $ColumnID
            ColumnName = $ColumnName
        }
    }
    if ($CaseSensitive) {
        $Output.Output['caseSensitive'] = $true
    }
    if ($AddNumbers) {
        $Output.Output['numbers'] = $true
    }
    Remove-EmptyValue -Hashtable $Output.Output
    $Output
}