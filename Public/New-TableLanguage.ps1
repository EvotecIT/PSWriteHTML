function New-TableLanguage {
    <#
    .SYNOPSIS
    Provides ability to overwrite texts available in the table.

    .DESCRIPTION
    Provides ability to overwrite texts available in the table. This is useful for translating to different languages or choosing different naming.

    .PARAMETER Info
    Overwrites information about the table. Default value is: "Showing _START_ to _END_ of _TOTAL_ entries"

    .PARAMETER InfoFiltered
    Overwrites information about the table when filtered. Default value is: "(filtered from _MAX_ total entries)"

    .PARAMETER Search
    Overwrites the search text. Default value is: "Search:"

    .PARAMETER EmptyTable
    Overwrites the text when the table is empty. Default value is: "No data available in table"

    .PARAMETER ZeroRecords
    Overwrites the text when no records match the search. Default value is: "No matching records found"

    .PARAMETER PaginateFirst
    Overwrites the text for the first page button. Default value is: "First"

    .PARAMETER PaginateLast
    Overwrites the text for the last page button. Default value is: "Last"

    .PARAMETER PaginateNext
    Overwrites the text for the next page button. Default value is: "Next"

    .PARAMETER PaginatePrevious
    Overwrites the text for the previous page button. Default value is: "Previous"

    .EXAMPLE
    New-HTML -TitleText "Example41 - Table" -FilePath "$PSScriptRoot\Example41.html" {
        New-HTMLSection -HeaderText "Testing" -HeaderTextAlignment center -Content {
            New-HTMLTable -DataTable $Values {
                New-TableLanguage -Search 'Find' -PaginateFirst 'First Option' -EmptyTable 'No data in the table'
                New-HTMLTableConditionGroup {
                    New-HTMLTableCondition -Name 'Test1' -Value 1 -ComparisonType number
                    New-HTMLTableCondition -Name 'Test2' -Value 2 -ComparisonType number
                } -BackgroundColor Salmon -FailBackgroundColor Goldenrod -Logic OR -HighlightHeaders 'Test1', 'Test2', 'DisplayName', 'DomainName'
            } -DataStore JavaScript
        }
    } -ShowHTML -Online

    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param(
        [string] $Info,
        [string] $InfoFiltered,
        [string] $Search,
        [string] $EmptyTable,
        [string] $ZeroRecords,
        [string] $PaginateFirst,
        [string] $PaginateLast,
        [string] $PaginateNext,
        [string] $PaginatePrevious
    )

    $Object = [PSCustomObject] @{
        Type   = 'TableLanguage'
        Output = [ordered] @{
            "search"       = $Search
            "info"         = $Info
            "infoFiltered" = $InfoFiltered
            # Empty table is using custom option of New-HTMLTable because of the way PSWriteHTML handles things
            "emptyTable"   = $EmptyTable
            "zeroRecords"  = $ZeroRecords
            paginate       = [ordered] @{
                "first"    = $PaginateFirst
                "last"     = $PaginateLast
                "next"     = $PaginateNext
                "previous" = $PaginatePrevious
            }
        }
    }
    Remove-EmptyValue -Hashtable $Object.Output -Recursive
    $Object
}