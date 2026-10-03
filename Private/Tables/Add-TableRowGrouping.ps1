function Add-TableRowGrouping {
    <#
    .SYNOPSIS
    Adds collapse state and handlers for grouped tables.
    #>
    [CmdletBinding()]
    param(
        [string] $DataTableName,
        [Array] $Settings,
        [switch] $Top,
        [switch] $Bottom
    )
    if ($Settings.Count -eq 0) { return }
    if ($Top) { 'var collapsedGroups = Object.create(null);' }
    if ($Bottom) {
        @"
        function syncGroupedDetails() {
            table.rows().every(function () {
                var node = this.node(), child = this.child();
                if (node && child) { child.toggle(node.style.display !== 'none'); }
            });
        }
        table.on('draw.dt responsive-display.dt responsive-resize.dt', syncGroupedDetails);
        `$('#$DataTableName tbody').on('click', 'tr.dtrg-start', function () {
            var key = `$(this).attr('data-group-key');
            collapsedGroups[key] = !collapsedGroups[key];
            table.draw(false);
        });
        syncGroupedDetails();
"@
    }
}
