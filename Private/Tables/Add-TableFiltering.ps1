function Add-TableFiltering {
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
