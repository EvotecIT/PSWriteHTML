function New-DiagramInternalEvent {
    [CmdletBinding()]
    param(
        #[switch] $OnClick,
        [string] $ID,
        #[switch] $FadeSearch,
        [nullable[int]] $ColumnID
    )
    # not ready
    $FadeSearch = $false
    if ($FadeSearch) {
        $EventVar = @"
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
        if ($null -ne $ColumnID) {
            $EventVar = @"
        var table = `$('#$ID').DataTable();
        if (findValue != '') {
            table.columns($ColumnID).search("^" + findValue + "$", true, false, true).draw();
        } else {
            table.columns($ColumnID).search('').draw();
        }
        if (table.page.info().recordsDisplay == 0) {
            table.columns($ColumnID).search('').draw();
        }
"@
        } else {
            $EventVar = @"
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
    $EventVar
}