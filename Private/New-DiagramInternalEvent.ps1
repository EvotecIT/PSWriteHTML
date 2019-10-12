function New-DiagramInternalEvent {
    param(
        #[switch] $OnClick,
        [string] $ID,
        #[switch] $FadeSearch,
        [int] $ColumnID = -1
    )


    if ($FadeSearch) {
        $Event = @"
        var table = `$('#$ID').DataTable();
        //table.search(params.nodes).draw();
        table.rows(':visible').every(function (rowIdx, tableLoop, rowLoop) {
            var present = true;
            if (params.nodes) {
                present = table.row(rowIdx).data().some(function (v) {
                        return v.match(new RegExp(params.nodes, 'i')) != null;
                    });
            }
            `$(table.row(rowIdx).node()).toggleClass('notMatched', !present);
        });

"@

    } else {
        if ($ColumnID -ne -1) {
            $Event = @"
        var table = `$('#$ID').DataTable();
        if (findValue != '') {
            table.columns(1).search("^" + findValue + "$", true, false, true).draw();
        } else {
            table.columns(1).search('').draw();
        }
        if (table.page.info().recordsDisplay == 0) {
            table.columns(1).search('').draw();
        }
"@
        } else {
            $Event = @"
        var table = `$('#$ID').DataTable();
        if (findValue != '') {
            table.search("^" + findValue + "$", true, false, true).draw();
        } else {
            table.search('').draw();
        }
        if (table.page.info().recordsDisplay == 0) {
            table.search('').draw();
        }
"@
        }
    }
    $Event

}