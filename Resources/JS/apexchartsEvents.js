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
        clearTableSearch(tableid, columnid);
    } else {
        if (['donut', 'pie', 'radialBar'].includes(config.chart.type)) {
            // not used
            var findValue = escapeRegExp(config.labels[dataPointIndex]);
            var findValue1 = escapeRegExp(config.series[dataPointIndex]);
        } else if (config.chart.type === 'rangeBar') {
            var findValue = escapeRegExp(config.series[0].data[dataPointIndex].x) // name
            var findValue1 = escapeRegExp(config.series[0].data[dataPointIndex].y[0]) // date from
            //var findValue2 = escapeRegExp(config.config.series[0].data[config.dataPointIndex].y[1]) // date to
        } else {
            //console.log(config.config.series[config.seriesIndex].data[config.dataPointIndex]); // Value
            //console.log(config.config.series[config.seriesIndex].name);  // Name of ChartLegend
            //console.log(config.config.xaxis.categories[config.dataPointIndex]); // Name of Object on X axis
            var findValue = escapeRegExp(config.xaxis.categories[dataPointIndex]);
            var findValue1 = escapeRegExp(config.series[seriesIndex].data[dataPointIndex]);
            //var findValue2 = escapeRegExp(config.config.series[config.seriesIndex].name);
        }
        //console.log('type ' + config.config.chart.type + ' findValue ' + findValue + ' findValue1 ' + findValue1);

        if (findValue != '') {
            if (config.chart.type === 'rangeBar') {
                // for timeline we don't provide second value for highlight as it's time based and there's no code for conversion from int
                findValueTable(table, tableid, columnid, findValue)
            } else {
                findValueTable(table, tableid, columnid, findValue, findValue1)
            }
        } else {
            clearTableSearch(tableid, columnid);
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
        var findValue = escapeRegExp(config.labels[dataPointIndex])
        var findValue1 = escapeRegExp(config.series[dataPointIndex])

        // if value is the same we clicked on before, we clear the search, if not we continue
        if (dataTablesChartsEvents[tableid] === findValue1) {
            clearTableSearch(tableid, columnid);
            return true;
        }
    } else {
        // if it's not pie chart we need to quit, as we deal with other charts in click events until this bug in ApexCharts is fixed
        return true;
    }

    var table = $('#' + tableid).DataTable();
    if (findValue != '') {
        //table.columns(columnid).search("^" + findValue + "$", true, false, true).draw();
        //$('#' + tableid + ' td').removeClass('highlight');
        //dataTablesChartsEvents[tableid] = findValue1;
        //table.draw(); // Run the search plugin

        findValueTable(table, tableid, columnid, findValue, findValue1)
    } else {
        clearTableSearch(tableid, columnid);
    }
    if (table.page.info().recordsDisplay == 0) {
        table.columns(columnid).search('').draw();
    }
}
function chartEventMarkerClick(tableid, columnid, config, dataPointIndex, seriesIndex) {
    if (['line'].includes(config.chart.type)) {
        // line charts are supported in markerClick
        var findValue1 = escapeRegExp(config.series[seriesIndex].data[dataPointIndex])
        var findValue = escapeRegExp(config.xaxis.categories[dataPointIndex])

        // if value is the same we clicked on before, we clear the search, if not we continue
        if (dataTablesChartsEvents[tableid] === findValue1) {
            clearTableSearch(tableid, columnid);
            return true;
        }
        var table = $('#' + tableid).DataTable();
        if (findValue != '') {
            findValueTable(table, tableid, columnid, findValue, findValue1)
        } else {
            clearTableSearch(tableid, columnid);
        }
        if (table.page.info().recordsDisplay == 0) {
            table.columns(columnid).search('').draw();
        }
    }
}
function findValueTable(table, tableid, columnid, findValue, findValue1) {
    console.log('findValue:' + findValue + ' findValue1:' + findValue1 + ' tableid:' + tableid + ' currentValue:' + dataTablesChartsEvents[tableid]);
    var table = $('#' + tableid).DataTable();
    table.column(columnid).search("^" + findValue + "$", true, false, true).draw();
    $('#' + tableid + ' td').removeClass('highlight');
    table.draw(); // Run the search plugin
    if (findValue1) {
        dataTablesChartsEvents[tableid] = findValue1;
    } else {
        dataTablesChartsEvents[tableid] = undefined;
    }
    table.draw(); // Run the search plugin
}
function clearTableSearch(tableid, columnid) {
    var table = $('#' + tableid).DataTable();
    table.columns(columnid).search('').draw();
    dataTablesChartsEvents[tableid] = undefined;
    table.draw();
    $('#' + tableid + ' td').removeClass('highlight');
    table.draw();
}
