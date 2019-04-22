function Add-TableState {
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