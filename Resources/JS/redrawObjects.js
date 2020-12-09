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

    // console.log(table);
    // console.log(table.style);
    // console.log(table.style.visibility);
    // console.log('test');
    // console.log("resize table started " + dataTablesInitializationTracker[table.id] + ' ' + table.id);
    // if (dataTablesInitializationTracker[table.id] !== 'initialized') {
    //     if ($.fn.DataTable.isDataTable("#" + table.id))
    //         try {
    //             $("#" + table.id).DataTable().columns.adjust().responsive.recalc();
    //             console.log("Fitting table with id " + table.id)
    //             var tempTable = $("#" + table.id).DataTable();
    //             var tableContainer = $(tempTable.table().container());
    //             console.log(tableContainer.style);
    //             console.log(tempTable);
    //             //console.log(table);
    //             //console.log(tableContainer);
    //             //console.log(tempTable.visible);
    //             dataTablesInitializationTracker[table.id] = 'initialized';
    //         }
    //         catch (e) {
    //             console.log("Failed to fit table with id " + table.id)
    //         }
    //     else
    //         console.log("Skipping fitting table id " + table.id)
    // } else {
    //     console.log("Already initialized table id " + table.id)
    // }
}
function redrawDiagram(diagram) {
    diagramTracker[diagram.id].fit();
    console.log('Fitting diagram with id ' + diagram.id);
}
function redrawFixedHeaderFooter() {
    var keys = Object.keys(dataTablesFixedTracker);
    for (i in keys) {
        console.log('Fitting fixed footer/header for table with id ' + keys[i]);
        var table = $("#" + keys[i]).DataTable();
        table.fixedHeader.adjust();
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
    redrawFixedHeaderFooter();
}