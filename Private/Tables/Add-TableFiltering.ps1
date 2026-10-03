function Add-TableFiltering {
    <#
    .SYNOPSIS
    Adds column filters without replacing semantic column titles.
    #>
    [CmdletBinding()]
    param(
        [bool] $Filtering,
        [ValidateSet('Top', 'Bottom', 'Both')][string] $FilteringLocation = 'Bottom',
        [string] $DataTableName,
        [string[]] $HeaderNames,
        [alias('RegularExpression')][switch] $SearchRegularExpression
    )
    $Output = @{ FilteringTopCode = ''; FilteringBottomCode = '' }
    if (-not $Filtering) { return $Output }
    $RegEx = $SearchRegularExpression.IsPresent.ToString().ToLowerInvariant()
    $Smart = (-not $SearchRegularExpression.IsPresent).ToString().ToLowerInvariant()
    if ($FilteringLocation -in 'Top', 'Both') {
        $Titles = ConvertTo-HTMLScriptJson -InputObject @($HeaderNames | ForEach-Object { [Net.WebUtility]::HtmlDecode($_) }) -Compress
        $Output.FilteringTopCode += @"
        var filterRow = `$('<tr/>', {'class': 'pswritehtml-filter-row'});
        $Titles.forEach(function (title, index) {
            filterRow.append(`$('<th/>').append(`$('<input/>', {
                type: 'text', placeholder: title, 'aria-label': 'Search ' + title, 'data-column': index
            })));
        });
        filterRow.prependTo('#$DataTableName thead');
"@
    }
    if ($FilteringLocation -in 'Bottom', 'Both') {
        $Output.FilteringTopCode += @"
        `$('#$DataTableName tfoot tr:not(.pswritehtml-static-footer-row) th').each(function () {
            var title = `$(this).text();
            `$(this).empty().append(`$('<input/>', {type: 'text', placeholder: title, 'aria-label': 'Search ' + title}));
        });
"@
    }
    $Output.FilteringBottomCode = @"
        var filterInputs = `$('#$DataTableName thead .pswritehtml-filter-row input, #$DataTableName tfoot tr:not(.pswritehtml-static-footer-row) input');
        filterInputs.each(function () {
            var input = this;
            table.columns().every(function () {
                if (`$(this.header()).text() === input.placeholder) { `$(input).data('pswh-header', this.header()); }
            });
        }).on('keyup change', function () {
            var header = `$(this).data('pswh-header');
            if (!header) { return; }
            var column = table.column(header);
            if (column.search() !== this.value) { column.search(this.value, $RegEx, $Smart).draw(); }
        }).on('click', function (event) { event.stopPropagation(); });
        function syncColumnFilters() {
            filterInputs.each(function () {
                var header = `$(this).data('pswh-header');
                if (!header) { return; }
                var column = table.column(header);
                `$(this).val(column.search());
                `$(this).closest('th').toggle(column.visible() && `$(header).css('display') !== 'none');
            });
        }
        table.on('draw.dt responsive-resize.dt column-visibility.dt column-reorder.dt', syncColumnFilters);
        syncColumnFilters();
"@
    return $Output
}
