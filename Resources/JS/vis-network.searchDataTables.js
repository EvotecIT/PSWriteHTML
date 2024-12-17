// Usage: network.on("click", function (params) { searchTableOnNodeClick(params, 'RandomID', 0); });
function searchTableOnNodeClick(params, tableId, columnId) {
    params.event = "[original event]";
    // clicked node
    var escapedFindValue = escapeRegExp(params.nodes);
    // table to search
    var table = $('#' + tableId).DataTable();
    // column to search within table
    if (escapedFindValue != '') {
        table.columns(columnId).search("^" + escapedFindValue + "$", true, false, true).draw();
    } else {
        table.columns(columnId).search('').draw();
    }

    if (table.page.info().recordsDisplay == 0) {
        table.columns(columnId).search('').draw();
    }
}