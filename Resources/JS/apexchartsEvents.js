function chartEventClick(tableid, columnid, config, dataPointIndex, seriesIndex, escapeSpecialChars) {
    var table = $('#' + tableid).DataTable();
    if (['donut', 'pie', 'radialBar'].includes(config.chart.type)) {
        // temporary disabled until fixed in ApexCharts, uses dataPointEvent instead
        return true;
    }
    if (['line'].includes(config.chart.type)) {
        // line charts are supported in markerClick
        return true;
    }
    if (seriesIndex === -1 || dataPointIndex === -1) {
        dataTablesSearchClear(tableid, columnid);
    } else {
        if (['donut', 'pie', 'radialBar'].includes(config.chart.type)) {
            // not used
            var columnValue = config.labels[dataPointIndex];
            var highlightValue = config.series[dataPointIndex];
        } else if (config.chart.type === 'rangeBar') {
            var columnValue = config.series[0].data[dataPointIndex].x; // name
            var highlightValue = config.series[0].data[dataPointIndex].y[0]; // date from
            //var columnValue2 = escapeRegExp(config.config.series[0].data[config.dataPointIndex].y[1]) // date to
        } else {
            //console.log(config.config.series[config.seriesIndex].data[config.dataPointIndex]); // Value
            //console.log(config.config.series[config.seriesIndex].name);  // Name of ChartLegend
            //console.log(config.config.xaxis.categories[config.dataPointIndex]); // Name of Object on X axis
            var columnValue = config.xaxis.categories[dataPointIndex];
            var highlightValue = config.series[seriesIndex].data[dataPointIndex];
            //var columnValue2 = escapeRegExp(config.config.series[config.seriesIndex].name);
        }

        if (escapeSpecialChars) {
            columnValue = escapeRegExp(columnValue);
            highlightValue = escapeRegExp(highlightValue);
        }

        console.log('event click type:' + config.chart.type + ' columnValue:' + columnValue + ' highlight:' + highlightValue);
        if (columnValue != '') {
            dataTablesFindMatch(table, tableid, columnid, columnValue, highlightValue);
        } else {
            dataTablesSearchClear(tableid, columnid);
        }
        if (table.page.info().recordsDisplay == 0) {
            table.columns(columnid).search('').draw();
        }
    }
}
function chartEventDataPointClick(tableid, columnid, config, dataPointIndex, seriesIndex, escapeSpecialChars) {
    if (['line'].includes(config.chart.type)) {
        // line charts are supported in markerClick
        return true;
    }
    if (['donut', 'pie', 'radialBar'].includes(config.chart.type)) {
        var columnValue = config.labels[dataPointIndex];
        var highlightValue = config.series[dataPointIndex];

        if (escapeSpecialChars) {
            columnValue = escapeRegExp(columnValue);
            highlightValue = escapeRegExp(highlightValue);
        }

        // if value is the same we clicked on before, we clear the search, if not we continue
        if (dataTablesChartsEvents[tableid] != undefined) {
            if (dataTablesChartsEvents[tableid].highlightValue == highlightValue) {
                dataTablesSearchClear(tableid, columnid);
                return true;
            }
        }
    } else {
        // if it's not pie chart we need to quit, as we deal with other charts in click events until this bug in ApexCharts is fixed
        return true;
    }

    var table = $('#' + tableid).DataTable();

    console.log('data click, type:' + config.chart.type + ' columnValue:' + columnValue + ' highlight:' + highlightValue);
    if (columnValue != '') {
        dataTablesFindMatch(table, tableid, columnid, columnValue, highlightValue)
    } else {
        dataTablesSearchClear(tableid, columnid);
    }
    if (table.page.info().recordsDisplay == 0) {
        table.columns(columnid).search('').draw();
    }
}
function chartEventMarkerClick(tableid, columnid, config, dataPointIndex, seriesIndex, escapeSpecialChars) {
    if (['line'].includes(config.chart.type)) {
        // line charts are supported in markerClick
        var highlightValue = config.series[seriesIndex].data[dataPointIndex];
        var columnValue = config.xaxis.categories[dataPointIndex];

        if (escapeSpecialChars) {
            columnValue = escapeRegExp(columnValue);
            highlightValue = escapeRegExp(highlightValue);
        }

        // if value is the same we clicked on before, we clear the search, if not we continue
        if (dataTablesChartsEvents[tableid] != undefined) {
            if (dataTablesChartsEvents[tableid].highlightValue == highlightValue) {
                dataTablesSearchClear(tableid, columnid);
                return true;
            }
        }
        var table = $('#' + tableid).DataTable();
        console.log('marker click, type:' + config.chart.type + ' columnValue:' + columnValue + ' highlight:' + highlightValue + ' columndid: ' + columnid);
        if (columnValue != '') {
            dataTablesFindMatch(table, tableid, columnid, columnValue, highlightValue)
        } else {
            dataTablesSearchClear(tableid, columnid);
        }
        if (table.page.info().recordsDisplay == 0) {
            table.columns(columnid).search('').draw();
        }
    }
}
function dataTablesFindMatch(table, tableid, columnid, columnValue, highlightValue) {
    $('#' + tableid + ' td').removeClass('highlight');
    if (highlightValue) {
        dataTablesChartsEvents[tableid] = { columnid: columnid, columnValue: columnValue, highlightValue: highlightValue };
    } else {
        dataTablesChartsEvents[tableid] = { columnid: columnid, columnValue: columnValue, highlightValue: undefined };
    }
    table.draw(); // Run the search plugin
}
function dataTablesSearchClear(tableid, columnid) {
    var table = $('#' + tableid).DataTable();
    dataTablesChartsEvents[tableid] = undefined;
    table.columns(columnid).search('').draw();
    $('#' + tableid + ' td').removeClass('highlight');
}
function dataTablesSearchExtension(tableid, settings, searchData, index, rowData, counter, limitRow) {
    if (settings.nTable.id !== tableid) {
        return true;
    }
    if (dataTablesChartsEvents[tableid] === undefined) {
        return true;
    }
    // Get Datatable API
    var table = new $.fn.dataTable.Api(settings);
    var columnid = dataTablesChartsEvents[tableid].columnid

    //console.log('search tableid:' + tableid + ' columnValue:' + dataTablesChartsEvents[tableid].columnValue + ' highlight:' + dataTablesChartsEvents[tableid].highlightValue);

    if (limitRow) {
        if (searchData[columnid] == dataTablesChartsEvents[tableid].columnValue && (searchData.includes(dataTablesChartsEvents[tableid].highlightValue) || searchData.includes(dataTablesChartsEvents[tableid].highlightValue.toString()))) {
            // Use this condition if column is found, and then highlight value is also possible
            // Get column index of matched value
            var colIndexHighlight = searchData.indexOf(dataTablesChartsEvents[tableid].highlightValue);
            if (colIndexHighlight == -1) {
                colIndexHighlight = searchData.indexOf(dataTablesChartsEvents[tableid].highlightValue.toString());
            }
            if (colIndexHighlight != -1) {
                // Get cell().node() for matched value
                var cell = table.cell(index, colIndexHighlight).node();
                // highlight the cell
                $(cell).addClass('highlight');
                //console.log('index: ' + index + ' colIndexHighlight: ' + colIndexHighlight);
            }
            return true;
        } else if (searchData[columnid] == dataTablesChartsEvents[tableid].columnValue) {
            // Use this condition if column is found, but highlight value wasn't (for example in rangeBar)

            // Get column index of matched value
            var colIndexHighlight = searchData.indexOf(dataTablesChartsEvents[tableid].highlightValue);
            // Get cell().node() for matched value
            var cell = table.cell(index, colIndexHighlight).node();
            return true;
        }
    } else {
        // Condition used only when highlighting without limiting to a single row
        //console.log("Data for table: " + settings.nTable.id + ' finding id ' + dataTablesChartsEvents['$DataTableID'].highlightValue + ' searching for ' + searchData);
        //console.log(count++ + ' ' + rowData + '  ' + index + ' ' + dataTablesChartsEvents[tableid].highlightValue);
        if (searchData[columnid].includes(dataTablesChartsEvents[tableid].highlightValue) || searchData[columnid].includes(dataTablesChartsEvents[tableid].highlightValue.toString())) {
            // Get column index of matched value
            var colIndex = searchData.indexOf(dataTablesChartsEvents[tableid].highlightValue);
            // Get cell().node() for matched value
            var cell = table.cell(index, colIndex).node();
            // highlight the cell
            $(cell).addClass('highlight');
            return true;
        }
    }
    return false;
}