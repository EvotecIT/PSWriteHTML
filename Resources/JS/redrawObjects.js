function redrawCalendar(calendar) {
    //console.log(calendarTracker[calendar.id].view);
    calendarTracker[calendar.id].changeView(calendarTracker[calendar.id].view.type);
    console.log('Redrawing view for ' + calendar.id);
}
function resizeTable(table) {
    if ($.fn.DataTable.isDataTable("#" + table.id)) {
        try {
            $("#" + table.id).DataTable().columns.adjust().responsive.recalc();
            console.log('Resized table with id ' + table.id);
        } catch (e) {
            console.log('Failed to resize table with ' + table.id);
        }
    } else {
        console.log('Skipping resizing ' + table.id);
    }
}
function redrawDiagram(diagram) {
    diagramTracker[diagram.id].fit();
    console.log('Redrawing view for ' + diagram.id);
}