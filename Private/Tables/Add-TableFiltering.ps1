function Add-TableFiltering {
    <#
    .SYNOPSIS
    Adds filtering functionality to a DataTable.

    .DESCRIPTION
    This function adds filtering functionality to a DataTable by allowing users to search for specific data within the table.

    .PARAMETER Filtering
    Specifies whether filtering functionality should be enabled.

    .PARAMETER FilteringLocation
    Specifies the location of the filtering input box. Valid values are 'Top', 'Bottom', or 'Both'.

    .PARAMETER DataTableName
    Specifies the name of the DataTable to which filtering will be applied.

    .PARAMETER SearchRegularExpression
    Indicates whether the search should be treated as a regular expression.

    .EXAMPLE
    Add-TableFiltering -Filtering $true -FilteringLocation 'Bottom' -DataTableName 'myTable'

    Adds filtering functionality to the DataTable named 'myTable' at the bottom of the table.

    .EXAMPLE
    Add-TableFiltering -Filtering $true -FilteringLocation 'Both' -DataTableName 'myTable' -SearchRegularExpression

    Adds filtering functionality to the DataTable named 'myTable' at both the top and bottom of the table, treating the search as a regular expression.

    #>
    [CmdletBinding()]
    param(
        [bool] $Filtering,
        [ValidateSet('Top', 'Bottom', 'Both')][string]$FilteringLocation = 'Bottom',
        [string] $DataTableName,
        [alias('RegularExpression')][switch]$SearchRegularExpression
    )

    if ($SearchRegularExpression.IsPresent) {
        [string]$JSDataTableRegEx = 'true'
        [string]$JSDataTableSmart = 'false'
    } else {
        [string]$JSDataTableRegEx = 'false'
        [string]$JSDataTableSmart = 'true'
    }
    
    $Output = @{}
    if ($Filtering) {
        # https://datatables.net/examples/api/multi_filter.html

        if ($FilteringLocation -eq 'Bottom') {

            $Output.FilteringTopCode = @"
                // Setup - add a text input to each footer cell
                `$('#$DataTableName tfoot th').each(function () {
                    var title = `$(this).text();
                    `$(this).html('<input type="text" placeholder="' + title + '" />');
                });
"@
            $Output.FilteringBottomCode = @"
                // Apply the search for footer cells
                table.columns().every(function () {
                    var that = this;

                    `$('input', this.footer()).on('keyup change', function () {
                        if (that.search() !== this.value) {
                            that.search(this.value, $JSDataTableRegEx, $JSDataTableSmart).draw();
                        }
                    });
                });
"@

        } elseif ($FilteringLocation -eq 'Both') {

            $Output.FilteringTopCode = @"
                // Setup - add a text input to each header cell
                `$('#$DataTableName thead th').each(function () {
                    var title = `$(this).text();
                    `$(this).html('<input type="text" placeholder="' + title + '" />');
                });
                // Setup - add a text input to each footer cell
                `$('#$DataTableName tfoot th').each(function () {
                    var title = `$(this).text();
                    `$(this).html('<input type="text" placeholder="' + title + '" />');
                });
"@
            $Output.FilteringBottomCode = @"
                // Apply the search for header cells
                table.columns().eq(0).each(function (colIdx) {
                    `$('input', table.column(colIdx).header()).on('keyup change', function () {
                        table
                            .column(colIdx)
                            .search(this.value)
                            .draw();
                    });

                    `$('input', table.column(colIdx).header()).on('click', function (e) {
                        e.stopPropagation();
                    });
                });
                // Apply the search for footer cells
                table.columns().every(function () {
                    var that = this;

                    `$('input', this.footer()).on('keyup change', function () {
                        if (that.search() !== this.value) {
                            that.search(this.value, $JSDataTableRegEx, $JSDataTableSmart).draw();
                        }
                    });
                });
"@

        } else {
            # top headers
            $Output.FilteringTopCode = @"
                // Setup - add a text input to each header cell
                `$('#$DataTableName thead th').each(function () {
                    var title = `$(this).text();
                    `$(this).html('<input type="text" placeholder="' + title + '" />');
                });
"@

            $Output.FilteringBottomCode = @"
                // Apply the search for header cells
                table.columns().eq(0).each(function (colIdx) {
                    `$('input', table.column(colIdx).header()).on('keyup change', function () {
                        table
                            .column(colIdx)
                            .search(this.value)
                            .draw();
                    });

                    `$('input', table.column(colIdx).header()).on('click', function (e) {
                        e.stopPropagation();
                    });
                });
"@
        }
    } else {
        $Output.FilteringTopCode = $Output.FilteringBottomCode = '' # assign multiple same values trick
    }
    return $Output
}
