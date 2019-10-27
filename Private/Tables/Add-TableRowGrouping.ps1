function Add-TableRowGrouping {
    [CmdletBinding()]
    param(
        [string] $DataTableName,
        [System.Collections.IDictionary] $Settings,
        [switch] $Top,
        [switch] $Bottom
    )
    if ($Settings.Count -gt 0) {

        if ($Top) {
            $Output = "var collapsedGroups = {};"
        }
        if ($Bottom) {
            $Output = @"
        `$('#$DataTableName tbody').on('click', 'tr.dtrg-start', function () {
            var name = `$(this).data('name');
            collapsedGroups[name] = !collapsedGroups[name];
            table.draw(false);
        });
"@
        }
        $Output
    }
}