function New-TableAlphabetSearch {
    <#
    .SYNOPSIS
    Creates a custom object for Table Alphabet Search with specified parameters.

    .DESCRIPTION
    This function creates a custom object for Table Alphabet Search with the specified parameters. It allows for customization of the search behavior by enabling case sensitivity and adding numbers to the search.

    .PARAMETER ColumnID
    Specifies the ID of the column to search.

    .PARAMETER ColumnName
    Specifies the name of the column to search.

    .PARAMETER AddNumbers
    Switch parameter to include numbers in the search.

    .PARAMETER CaseSensitive
    Switch parameter to perform a case-sensitive search.

    .EXAMPLE
    New-TableAlphabetSearch -ColumnID 1 -ColumnName "Name" -AddNumbers -CaseSensitive
    Creates a Table Alphabet Search object for column ID 1 with the name "Name", including numbers in the search and performing a case-sensitive search.

    .EXAMPLE
    New-TableAlphabetSearch -ColumnID 2 -ColumnName "ID" -CaseSensitive
    Creates a Table Alphabet Search object for column ID 2 with the name "ID", performing a case-sensitive search.

    #>
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