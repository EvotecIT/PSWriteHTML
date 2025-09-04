function redrawCalendar(calendar) {
    //calendarTracker[calendar.id].changeView(calendarTracker[calendar.id].view.type);
    calendarTracker[calendar.id].updateSize();
    console.log('Fitting calendar with id ' + calendar.id);
}
function resizeTable(table) {
    if (!table || !table.id) return;
    // Skip hidden tables
    if (table.offsetParent === null) return;

    if ($.fn.DataTable.isDataTable("#" + table.id)) {
        try {
            var dt = $("#" + table.id).DataTable();
            var opts = (window.pswhRedrawOptions || {});
            var recordsTotal = 0;
            try { recordsTotal = dt.page().info().recordsTotal || 0; } catch (e) { }
            var largeThreshold = typeof opts.dataTablesLargeThreshold === 'number' ? opts.dataTablesLargeThreshold : 20000;
            var skipResponsive = opts.skipDataTablesResponsive === true || recordsTotal >= largeThreshold;
            var skipAll = opts.skipDataTables === true;

            if (!skipAll) {
                if (!skipResponsive) {
                    dt.columns.adjust().responsive.recalc();
                } else {
                    dt.columns.adjust();
                }
                console.log('Fitting table with id ' + table.id + (skipResponsive ? ' (light)' : ''));
            }
        } catch (e) {
            try {
                $("#" + table.id).DataTable().columns.adjust();
            } catch (e2) {
                console.log('Failed to fit table with id ' + table.id);
            }
        }
    } else {
        console.log('Skipping fitting table id ' + table.id);
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
function redrawApexCharts(container) {
    try {
        // Reflow visible ApexCharts within the container
        var charts = container.querySelectorAll('.apexcharts-canvas');
        charts.forEach(function (el) {
            var chart = el.__apexcharts__;
            if (chart && el.offsetParent !== null) {
                try {
                    if (!(window.pswhRedrawOptions && window.pswhRedrawOptions.skipApexCharts === true)) {
                        chart.windowResizeHandler();
                    }
                    console.log('Resized ApexChart for element ' + (el.id || '[no-id]'));
                } catch (e) {
                    console.log('ApexChart resize failed for element ' + (el.id || '[no-id]'));
                }
            }
        });
    } catch (e) {
        console.log('No ApexCharts available.');
    }
}
function refreshKinetoCarousels(container) {
    try {
        if (window.Kineto) {
            // Refresh each Kineto carousel within the container
            var carousels = container.querySelectorAll('div.carousel');
            carousels.forEach(function (c) {
                try {
                    // Kineto exposes a static refresh API that accepts a container element
                    if (!(window.pswhRedrawOptions && window.pswhRedrawOptions.skipCarousels === true)) {
                        window.Kineto.refresh(c);
                    }
                    console.log('Refreshed Kineto carousel for element ' + (c.id || '[no-id]'));
                } catch (e) {
                    console.log('Kineto refresh failed for element ' + (c.id || '[no-id]'));
                }
            });
        }
    } catch (e) {
        console.log('No Kineto carousels available.');
    }
}
function findObjectsToRedraw(id) {
    try {
        var root = document.getElementById(id) || document;

        // redrawTables
        try {
            var table = root.querySelectorAll('table.dataTables'); //.querySelectorAll('table[id^="DT-"]');
            table.forEach(resizeTable);
        } catch (e) {
            console.log('No datatables available.');
        }

        // redrawCalendar
        try {
            var calendar = root.querySelectorAll('div.calendarFullCalendar');
            calendar.forEach(redrawCalendar);
        } catch (e) {
            console.log('No calendars available.');
        }

        // redrawDiagram
        try {
            var diagram = root.querySelectorAll('div.diagramObject');
            diagram.forEach(redrawDiagram);
        } catch (e) {
            console.log('No diagrams available.');
        }

        // Resize ApexCharts in the visible container
        redrawApexCharts(root);

        // Refresh Kineto carousels in the visible container
        refreshKinetoCarousels(root);

        // finds all tables with fixed headers and footers and forces them to check if they are visible or not and hide or show accordingly
        try {
            redrawFixedHeaderFooter();
        } catch (e) {
            console.log('No datatables fixed header/footer available.');
        }
    } catch (e) {
        console.log('Redraw failed for id ' + id);
    }

    // As a safety net, dispatch a window resize to notify components
    try {
        if (!(window.pswhRedrawOptions && window.pswhRedrawOptions.skipWindowResizeEvent === true)) {
            window.dispatchEvent(new Event('resize'));
        }
    } catch (e) { }
}
