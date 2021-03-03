function chartEventClick(tableid, columnid, config, dataPointIndex, seriesIndex) {
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
            var columnValue = escapeRegExp(config.labels[dataPointIndex]);
            var highlightValue = escapeRegExp(config.series[dataPointIndex]);
        } else if (config.chart.type === 'rangeBar') {
            var columnValue = escapeRegExp(config.series[0].data[dataPointIndex].x) // name
            var highlightValue = escapeRegExp(config.series[0].data[dataPointIndex].y[0]) // date from
            //var columnValue2 = escapeRegExp(config.config.series[0].data[config.dataPointIndex].y[1]) // date to
        } else {
            //console.log(config.config.series[config.seriesIndex].data[config.dataPointIndex]); // Value
            //console.log(config.config.series[config.seriesIndex].name);  // Name of ChartLegend
            //console.log(config.config.xaxis.categories[config.dataPointIndex]); // Name of Object on X axis
            var columnValue = escapeRegExp(config.xaxis.categories[dataPointIndex]);
            var highlightValue = escapeRegExp(config.series[seriesIndex].data[dataPointIndex]);
            //var columnValue2 = escapeRegExp(config.config.series[config.seriesIndex].name);
        }
        //console.log('type ' + config.config.chart.type + ' columnValue ' + columnValue + ' highlightValue ' + highlightValue);

        if (columnValue != '') {
            if (config.chart.type === 'rangeBar') {
                // for timeline we don't provide second value for highlight as it's time based and there's no code for conversion from int
                dataTablesFindMatch(table, tableid, columnid, columnValue)
            } else {
                dataTablesFindMatch(table, tableid, columnid, columnValue, highlightValue)
            }
        } else {
            dataTablesSearchClear(tableid, columnid);
        }
        if (table.page.info().recordsDisplay == 0) {
            table.columns(columnid).search('').draw();
        }
    }
}
function chartEventDataPointClick(tableid, columnid, config, dataPointIndex, seriesIndex) {
    if (['line'].includes(config.chart.type)) {
        // line charts are supported in markerClick
        return true;
    }
    if (['donut', 'pie', 'radialBar'].includes(config.chart.type)) {
        var columnValue = escapeRegExp(config.labels[dataPointIndex])
        var highlightValue = escapeRegExp(config.series[dataPointIndex])

        // if value is the same we clicked on before, we clear the search, if not we continue
        if (dataTablesChartsEvents[tableid] === highlightValue) {
            dataTablesSearchClear(tableid, columnid);
            return true;
        }
    } else {
        // if it's not pie chart we need to quit, as we deal with other charts in click events until this bug in ApexCharts is fixed
        return true;
    }

    var table = $('#' + tableid).DataTable();
    if (columnValue != '') {
        dataTablesFindMatch(table, tableid, columnid, columnValue, highlightValue)
    } else {
        dataTablesSearchClear(tableid, columnid);
    }
    if (table.page.info().recordsDisplay == 0) {
        table.columns(columnid).search('').draw();
    }
}
function chartEventMarkerClick(tableid, columnid, config, dataPointIndex, seriesIndex) {
    if (['line'].includes(config.chart.type)) {
        // line charts are supported in markerClick
        var highlightValue = escapeRegExp(config.series[seriesIndex].data[dataPointIndex])
        var columnValue = escapeRegExp(config.xaxis.categories[dataPointIndex])

        // if value is the same we clicked on before, we clear the search, if not we continue
        if (dataTablesChartsEvents[tableid] === highlightValue) {
            dataTablesSearchClear(tableid, columnid);
            return true;
        }
        var table = $('#' + tableid).DataTable();
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
        dataTablesChartsEvents[tableid] = undefined;
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

    if (limitRow) {
        if (searchData[columnid] === dataTablesChartsEvents[tableid].columnValue && searchData.includes(dataTablesChartsEvents[tableid].highlightValue)) {
            // Get column index of matched value
            var colIndexHighlight = searchData.indexOf(dataTablesChartsEvents[tableid].highlightValue);
            // Get cell().node() for matched value
            var cell = table.cell(index, colIndexHighlight).node();
            // highlight the cell
            $(cell).addClass('highlight');
            return true;
        }
    } else {
        //console.log("Data for table: " + settings.nTable.id + ' finding id ' + dataTablesChartsEvents['$DataTableID'].highlightValue + ' searching for ' + searchData);
        //console.log(count++ + ' ' + rowData + '  ' + index + ' ' + dataTablesChartsEvents[tableid].highlightValue);
        if (searchData[columnid].includes(dataTablesChartsEvents[tableid].highlightValue)) {
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