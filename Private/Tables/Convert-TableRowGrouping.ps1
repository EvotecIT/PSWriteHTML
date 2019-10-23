function Convert-TableRowGrouping {
    [CmdletBinding()]
    param(
        [string] $Options,
        [System.Collections.IDictionary] $Settings,
        [string[]] $HeaderNames
    )
    if ($Settings.Count -gt 0) {
        if ($Settings.Name) {
            $ColumnID = ($HeaderNames).ToLower().IndexOf($Settings.Name.ToLower())
        } else {
            $ColumnID = $Settings.ColumnID
        }

        $TextToReplace = @"
        rowGroup: {
            // Uses the 'row group' plugin
            dataSrc: $ColumnID,
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
    if ($PSEdition -eq 'Desktop') {
        $TextToFind = '"rowGroup":  "",'
    } else {
        $TextToFind = '"rowGroup": "",'
    }

    $Options = $Options -Replace ($TextToFind, $TextToReplace)
    $Options
}