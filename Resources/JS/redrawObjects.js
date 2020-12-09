function redrawCalendar(calendar) {
    calendarTracker[calendar.id].changeView(calendarTracker[calendar.id].view.type);
    console.log('Fitting calendar with id ' + calendar.id);
}
function resizeTable(table) {
    if ($.fn.DataTable.isDataTable("#" + table.id)) {
        try {
            $("#" + table.id).DataTable().columns.adjust().responsive.recalc();
            console.log('Fitting table with id ' + table.id);
        } catch (e) {
            console.log('Failed to fit table with id ' + table.id);
        }
    } else {
        console.log('Skipping fitting table id ' + table.id);
    }
}
function redrawDiagram(diagram) {
    diagramTracker[diagram.id].fit();
    console.log('Fitting diagram with id ' + diagram.id);
}

function findObjectsToRedraw(id) {
    // redrawTables
    try {
        var table = document.getElementById(id).querySelectorAll('table.dataTables'); //.querySelectorAll('table[id^="DT-"]');
        table.forEach(resizeTable);
    } catch (e) {
        console.log('No datatables available.');
    }
    // redrawCalendar
    try {
        var calendar = document.getElementById(id).querySelectorAll('div.calendarFullCalendar');
        calendar.forEach(redrawCalendar);
    } catch (e) {
        console.log('No calendars available.');
    }
    // redrawDiagram
    try {
        var diagram = document.getElementById(id).querySelectorAll('div.diagramObject');
        diagram.forEach(redrawDiagram);
    } catch (e) {
        console.log('No diagrams available.');
    }
}