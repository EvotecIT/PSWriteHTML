function New-DiagramInternalEvent {
    <#
    .SYNOPSIS
    Creates a new internal event for a diagram.

    .DESCRIPTION
    This function creates a new internal event for a diagram based on the provided parameters.

    .PARAMETER OnClick
    Specifies if the event is triggered on click.

    .PARAMETER ID
    Specifies the ID of the diagram element.

    .PARAMETER FadeSearch
    Specifies whether to fade the search results.

    .PARAMETER ColumnID
    Specifies the ID of the column to search within.

    .EXAMPLE
    New-DiagramInternalEvent -OnClick -ID "diagramElement1" -FadeSearch -ColumnID 2
    Creates a new internal event triggered on click for the diagram element with ID "diagramElement1", fading the search results within column 2.

    .EXAMPLE
    New-DiagramInternalEvent -ID "diagramElement2" -ColumnID 1
    Creates a new internal event for the diagram element with ID "diagramElement2", searching within column 1.

    #>
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