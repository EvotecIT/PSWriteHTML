function Convert-TableRowGrouping {
    <#
    .SYNOPSIS
    Configures ordered grouping levels with collapse state scoped to the complete group path.
    #>
    [CmdletBinding()]
    param(
        [string] $Options,
        [int[]] $RowGroupingColumnID,
        [string[]] $HeaderNames,
        [string] $DataStore
    )
    $Keys = @(foreach ($Index in $RowGroupingColumnID) { if ($DataStore -eq 'HTML') { $Index } else { $HeaderNames[$Index] } })
    $Columns = ConvertTo-HTMLScriptJson -InputObject $Keys -Compress
    $DataSources = ConvertTo-HTMLScriptJson -InputObject @(foreach ($Key in $Keys) { if ($Key -is [string]) { $Key.Replace('.', '\.') } else { $Key } }) -Compress
    $Renderer = @"
    "rowGroup": {dataSrc: $DataSources, startRender: function (rows, group, level) {
        var columns = $Columns;
        var first = rows.data()[0];
        var path = columns.slice(0, level + 1).map(function (column) { return first[column]; });
        var key = JSON.stringify(path);
        var parentCollapsed = path.some(function (value, index) {
            return index < level && !!collapsedGroups[JSON.stringify(path.slice(0, index + 1))];
        });
        var collapsed = !!collapsedGroups[key];
        rows.nodes().each(function (row) { row.style.display = parentCollapsed || collapsed ? 'none' : ''; });
        if (parentCollapsed) { return null; }
        var count = rows.columns().visible().toArray().filter(function (visible) { return visible; }).length;
        var toggle = `$('<button/>', {type: 'button', 'aria-expanded': !collapsed})
            .css({background: 'none', border: 'none', color: 'inherit', font: 'inherit', cursor: 'pointer'})
            .append(`$('<span/>', {'aria-hidden': 'true'}).text(collapsed ? '+' : '\u2212'))
            .append(document.createTextNode(' ' + `$('<div/>').html(group).text() + ' (' + rows.count() + ')'));
        return `$('<tr/>').append(`$('<td/>', {colspan: count}).append(toggle))
            .attr('data-group-key', key).toggleClass('collapsed', collapsed);
    }}
"@
    [regex]::Replace($Options, '"rowGroup"\s*:\s*""', [System.Text.RegularExpressions.MatchEvaluator]{ param($Match) $Renderer })
}
