function redrawCalendar(calendar) {
    //calendarTracker[calendar.id].changeView(calendarTracker[calendar.id].view.type);
    calendarTracker[calendar.id].updateSize();
    console.log('Fitting calendar with id ' + calendar.id);
}
function resizeTable(table) {
    if (table.id) {
        if ($.fn.DataTable.isDataTable("#" + table.id)) {
            try {
                $("#" + table.id).DataTable().columns.adjust().responsive.recalc();
                console.log('Fitting table with id ' + table.id);
            } catch (e) {
                try {
                    $("#" + table.id).DataTable().columns.adjust();
                } catch (e) {
                    console.log('Failed to fit table with id ' + table.id);
                }
            }
        } else {
            console.log('Skipping fitting table id ' + table.id);
        }
    }
}
function redrawDiagram(diagram) {
    diagramTracker[diagram.id].fit();
    console.log('Fitting diagram with id ' + diagram.id);
}
function redrawFixedHeaderFooter() {
    if (typeof dataTablesFixedTracker !== 'undefined') {
        var keys = Object.keys(dataTablesFixedTracker);
        for (i in keys) {
            try {
                console.log('Fitting fixed footer/header for table with id ' + keys[i]);
                var table = $("#" + keys[i]).DataTable();
                table.fixedHeader.adjust();
            } catch (e) {
                console.log('Fitting fixed footer/header failed.');
            }
        }
    }
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
    // finds all tables with fixed headers and footers and forces them to check if they are visible or not and hide or show accordingly
    try {
        redrawFixedHeaderFooter();
    } catch (e) {
        console.log('No datatables fixed header/footer available.');
    }
}