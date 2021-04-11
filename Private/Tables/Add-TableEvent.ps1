function Add-TableEvent {
    [cmdletBinding()]
    param(
        [Array] $Events,
        [string[]] $HeaderNames,
        [string] $DataStore
    )
    foreach ($Event in $Events) {
        $ID = -join ('#', $Event.TableID)
        $ColumnID = $Event.SourceColumnID
        if ($null -ne $ColumnID) {
            $ColumnName = $HeaderNames[$ColumnID]
        } else {
            $ColumnName = $Event.SourceColumnName
            $ColumnID = $HeaderNames.IndexOf($Event.SourceColumnName)
        }
        $TargetColumnID = $Event.TargetColumnID

        $Value = @"
    var dataStore = '$DataStore'
    table.on('deselect', function (e, dt, type, indexes) {
        var table1 = `$('$ID').DataTable();
        table1.columns($TargetColumnID).search('').draw();
    });

    table.on('select', function (e, dt, type, indexes) {
        if (type === 'row') {
            // var data = table.rows(indexes).data().pluck('id');
            var data = table.rows(indexes).data();
            //console.log(data)
            //alert(data[0][$ColumnID])

            if (dataStore.toLowerCase() === 'html') {
                var findValue = escapeRegExp(data[0][$ColumnID]);
            } else {
                var findValue = escapeRegExp(data[0].$ColumnName);
            }
            var table1 = `$('$ID').DataTable();
            if (findValue != '') {
                table1.columns($TargetColumnID).search("^" + findValue + "`$", true, false, true).draw();
            } else {
                table1.columns($TargetColumnID).search('').draw();
            }
            /* Disabled due to rare cases where the search wouldn't show that there are no matches - TO DO: Remove this later
            if (table1.page.info().recordsDisplay == 0) {
                table1.columns($TargetColumnID).search('').draw();
            }
            */
        }
    });
"@
        $Value
    }
}