function Add-TableState {
    <#
    .SYNOPSIS
    Adds table state functionality to a DataTable.

    .DESCRIPTION
    This function adds table state functionality to a DataTable, allowing for the loading of text input from a saved state.

    .PARAMETER Filtering
    Specifies whether filtering is enabled.

    .PARAMETER SavedState
    Specifies whether the saved state is being used.

    .PARAMETER DataTableName
    The name of the DataTable.

    .PARAMETER FilteringLocation
    Specifies the location of the filtering (Top, Bottom, Both).

    .EXAMPLE
    Add-TableState -Filtering $true -SavedState $true -DataTableName "myTable" -FilteringLocation "Top"
    Adds table state functionality to the DataTable named "myTable" with filtering at the top.

    .EXAMPLE
    Add-TableState -Filtering $true -SavedState $true -DataTableName "anotherTable" -FilteringLocation "Both"
    Adds table state functionality to the DataTable named "anotherTable" with filtering at both the top and bottom.
    #>
    [CmdletBinding()]
    param(
        [bool] $Filtering,
        [bool] $SavedState,
        [string] $DataTableName,
        [ValidateSet('Top', 'Bottom', 'Both')][string]$FilteringLocation = 'Bottom'
    )
    if ($Filtering -and $SavedState) {
        if ($FilteringLocation -eq 'Top') {
            $Output = @"
                // Setup - Looading text input from SavedState
                `$('#$DataTableName').on('stateLoaded.dt', function(e, settings, data) {
                    settings.aoPreSearchCols.forEach(function(col, index) {
                        if (col.sSearch) setTimeout(function() {
                            `$('#$DataTableName thead th:eq('+index+') input').val(col.sSearch)
                        }, 50)
                    })
                });
"@
        } elseif ($FilteringLocation -eq 'Both') {
            $Output = @"
                // Setup - Looading text input from SavedState
                `$('#$DataTableName').on('stateLoaded.dt', function(e, settings, data) {
                    settings.aoPreSearchCols.forEach(function(col, index) {
                        if (col.sSearch) setTimeout(function() {
                            `$('#$DataTableName thead th:eq('+index+') input').val(col.sSearch)
                        }, 50)
                    })
                });
                // Setup - Looading text input from SavedState
                `$('#$DataTableName').on('stateLoaded.dt', function(e, settings, data) {
                    settings.aoPreSearchCols.forEach(function(col, index) {
                        if (col.sSearch) setTimeout(function() {
                            `$('#$DataTableName tfoot th:eq('+index+') input').val(col.sSearch)
                        }, 50)
                    })
                });
"@

        } else {
            $Output = @"
                // Setup - Looading text input from SavedState
                `$('#$DataTableName').on('stateLoaded.dt', function(e, settings, data) {
                    settings.aoPreSearchCols.forEach(function(col, index) {
                        if (col.sSearch) setTimeout(function() {
                            `$('#$DataTableName tfoot th:eq('+index+') input').val(col.sSearch)
                        }, 50)
                    })
                })
"@

        }
    } else {
        $Output = ''
    }
    return $Output
}