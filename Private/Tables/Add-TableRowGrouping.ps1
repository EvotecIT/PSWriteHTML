function Add-TableRowGrouping {
    <#
    .SYNOPSIS
    Adds row grouping functionality to a DataTable.

    .DESCRIPTION
    This function adds row grouping functionality to a DataTable based on the provided settings. It allows collapsing and expanding groups of rows.

    .PARAMETER DataTableName
    The name of the DataTable to which row grouping will be applied.

    .PARAMETER Settings
    A dictionary containing settings for row grouping.

    .PARAMETER Top
    Indicates whether to add row grouping at the top of the table.

    .PARAMETER Bottom
    Indicates whether to add row grouping at the bottom of the table.

    .EXAMPLE
    Add-TableRowGrouping -DataTableName "myTable" -Settings @{ "group1" = "Group 1"; "group2" = "Group 2" } -Top

    Adds row grouping at the top of the table "myTable" with groups "Group 1" and "Group 2".

    .EXAMPLE
    Add-TableRowGrouping -DataTableName "anotherTable" -Settings @{ "groupA" = "Group A"; "groupB" = "Group B" } -Bottom

    Adds row grouping at the bottom of the table "anotherTable" with groups "Group A" and "Group B".
    #>
    [CmdletBinding()]
    param(
        [string] $DataTableName,
        [System.Collections.IDictionary] $Settings,
        [switch] $Top,
        [switch] $Bottom
    )
    if ($Settings.Count -gt 0) {

        if ($Top) {
            $Output = "var collapsedGroups = {};"
        }
        if ($Bottom) {
            $Output = @"
        `$('#$DataTableName tbody').on('click', 'tr.dtrg-start', function () {
            var name = `$(this).data('name');
            collapsedGroups[name] = !collapsedGroups[name];
            table.draw(false);
        });
"@
        }
        $Output
    }
}