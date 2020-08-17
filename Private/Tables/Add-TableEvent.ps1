function Add-TableEvent {
    [cmdletBinding()]
    param(
        [Array] $Events
    )
    foreach ($Event in $Events) {
        $ID = -join ('#', $Event.ID)
        $ColumnID = $Event.ColumnID
        $Value = @"
    table.on('deselect', function (e, dt, type, indexes) {
        var table1 = `$('$ID').DataTable();
        table1.columns(1).search('').draw();
    });

    table.on('select', function (e, dt, type, indexes) {
        if (type === 'row') {
            // var data = table.rows(indexes).data().pluck('id');
            var data = table.rows(indexes).data();
            console.log(data)
            //alert(data[0][$ColumnID])

            var findValue = data[0][$ColumnID];
            var table1 = `$('$ID').DataTable();
            if (findValue != '') {
                table1.columns(1).search("^" + findValue + "`$", true, false, true).draw();
            } else {
                table1.columns(1).search('').draw();
            }
            if (table1.page.info().recordsDisplay == 0) {
                table1.columns(1).search('').draw();
            }
        }
    });
"@
        $Value
    }


}