function Convert-TableRowGrouping {
    <#
    .SYNOPSIS
    Converts a specified row grouping column in a table to a collapsible row group.

    .DESCRIPTION
    This function converts a specified row grouping column in a table to a collapsible row group. It adds a rowGroup property to the options object with the necessary configuration for the 'row group' plugin.

    .PARAMETER Options
    The options object containing the table configuration.

    .PARAMETER RowGroupingColumnID
    The ID of the column to be used for row grouping.

    .EXAMPLE
    Convert-TableRowGrouping -Options $options -RowGroupingColumnID 2
    Converts the table to have a collapsible row group using column 2 for grouping.

    .EXAMPLE
    Convert-TableRowGrouping -Options $options -RowGroupingColumnID 0
    Converts the table to have a collapsible row group using column 0 for grouping.
    #>
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
    if ($PSEdition -eq 'Desktop') {
        $TextToFind = '"rowGroup":  "",'
    } else {
        $TextToFind = '"rowGroup": "",'
    }
    # $TextToFind = '"rowGroup":"",' # this is a workaround for ConvertTo-JsonLiteral
    $Options = $Options -Replace ($TextToFind, $TextToReplace)
    $Options
}