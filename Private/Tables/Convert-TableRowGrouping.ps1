function Convert-TableRowGrouping {
    [CmdletBinding()]
    param(
        [string] $Options,
        [int] $RowGroupingColumnID
    )
    if ($RowGroupingColumnID -gt -1) {

        $TextToReplace = @"
        rowGroup: {
            // Uses the 'row group' plugin
            dataSrc: $RowGroupingColumnID,
            startRender: function (rows, group) {
                var collapsed = !!collapsedGroups[group];

                rows.nodes().each(function (r) {
                    r.style.display = collapsed ? 'none' : '';
                });

                var toggleClass = collapsed ? 'fa-plus-square' : 'fa-minus-square';

                // Add group name to <tr>
                return `$('<tr/>')
                    .append('<td colspan="' + rows.columns()[0].length + '">' + '<span class="fa fa-fw ' + toggleClass + ' toggler"/> ' + group + ' (' + rows.count() + ')</td>')
                    .attr('data-name', group)
                    .toggleClass('collapsed', collapsed);
            },
        },
"@
    } else {
        $TextToReplace = ''
    }
    <#
    if ($PSEdition -eq 'Desktop') {
        $TextToFind = '"rowGroup":  "",'
    } else {
        $TextToFind = '"rowGroup": "",'
    }
    #>
    $TextToFind = '"rowGroup":"",'
    $Options = $Options -Replace ($TextToFind, $TextToReplace)
    $Options
}