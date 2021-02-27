function New-ChartEvent {
    [cmdletBinding()]
    param(
        [Parameter(Mandatory)][string] $DataTableID,
        [Parameter(Mandatory)][int] $ColumnID
    )
    $Script:HTMLSchema.Features.EscapeRegex = $true
    $Script:HTMLSchema.Features.ChartsEvents = $true
    if ($ColumnValueID) {
        #$Script:HTMLSchema.Features.DataTablesSelect = $true
        #$Selection = "table1.columns([$ColumnID, $ColumnValueID]).select();"
    }
    <#
    $Output = @"
        events: {
            dataPointSelection: function (event, chartContext, config) {
                if (['donut', 'pie', 'radialBar'].includes(config.w.config.chart.type)) {
                    //console.log(config.w.config.series[config.dataPointIndex]);
                    //console.log(config.w.config.labels[config.dataPointIndex]);
                    var findValue = escapeRegExp(config.w.config.labels[config.dataPointIndex])
                    var findValue1 = escapeRegExp(config.w.config.series[config.dataPointIndex])
                    //var findValue2 = escapeRegExp(config.w.config.labels[config.dataPointIndex])
                } else if (config.w.config.chart.type === 'rangeBar') {
                    console.log(config.w.config.series[0].data[config.dataPointIndex].x); // name
                    //console.log(config.w.config.series[0].data[config.dataPointIndex].y[0]); // date from
                    //console.log(config.w.config.series[0].data[config.dataPointIndex].y[1]); // date to
                    var findValue = escapeRegExp(config.w.config.series[0].data[config.dataPointIndex].x)
                    var findValue1 = escapeRegExp(config.w.config.series[0].data[config.dataPointIndex].y[0])
                    //var findValue2 = escapeRegExp(config.w.config.series[0].data[config.dataPointIndex].y[1])
                    //var findValue3 = escapeRegExp(config.w.config.series[0].data[config.dataPointIndex].x)
                } else {
                    //console.log(config.w.config.series[config.seriesIndex].data[config.dataPointIndex]); // Value
                    //console.log(config.w.config.series[config.seriesIndex].name);  // Name of ChartLegend
                    //console.log(config.w.config.xaxis.categories[config.dataPointIndex]); // Name of Object on X axis

                    var findValue = escapeRegExp(config.w.config.xaxis.categories[config.dataPointIndex]);
                    var findValue1 = escapeRegExp(config.w.config.series[config.seriesIndex].data[config.dataPointIndex]);
                    //var findValue2 = escapeRegExp(config.w.config.series[config.seriesIndex].name);
                }
                console.log('Values from charts ' + findValue + '    ' + findValue1);

                var table1 = `$('#$DataTableID').DataTable();
                if (findValue != '') {
                    table1.columns($ColumnID).search("^" + findValue + "`$", true, false, true).draw();

                    `$('#$DataTableID td').removeClass('highlight');
                    dataTablesChartsEvents['$DataTableID'] = undefined;
                    // Toggle chart value
                    if (dataTablesChartsEvents['$DataTableID'] === undefined) {
                        dataTablesChartsEvents['$DataTableID'] = findValue1;
                        console.log('chartData setting ' + dataTablesChartsEvents['$DataTableID']);
                    } else {
                        dataTablesChartsEvents['$DataTableID'] = undefined;
                    }
                    table1.draw(); // Run the search plugin
                } else {
                    table1.columns($ColumnID).search('').draw();
                }
                if (table1.page.info().recordsDisplay == 0) {
                    table1.columns($ColumnID).search('').draw();
                }
            },
            click: function(event, chartContext, config) {
                //if (config.globals.selectedDataPoints[0].length === 0) {
                //    //console.log(config.globals.selectedDataPoints[0]);
                //    var table1 = `$('#$DataTableID').DataTable();
                //    table1.columns(0).search('').draw();
               // }
            },
            //markerClick: function(event, chartContext, { seriesIndex, dataPointIndex, config}) {
            //}
        }
"@
#>

    $Output = @"
            events: {
                click: function (event, chartContext, config) {
                    chartEventClick('$DataTableID', $ColumnID, config.config, config.dataPointIndex, config.seriesIndex);
                },
                dataPointSelection: function (event, chartContext, config) {
                    chartEventDataPointClick('$DataTableID', $ColumnID, config.w.config, config.dataPointIndex);
                },
                markerClick: function (event, chartContext, { seriesIndex, dataPointIndex, config }) {
                    chartEventMarkerClick('$DataTableID', $ColumnID, chartContext.opts, dataPointIndex, seriesIndex);
                }
            }

"@

    $DataTablesOutput = @"
    `$.fn.dataTable.ext.search.push(
        function (settings, searchData, index, rowData, counter) {

            if (settings.nTable.id !== '$DataTableID') {
                return true;
            }
            if (dataTablesChartsEvents['$DataTableID'] === undefined) {
                return true;
            }
            //console.log("Data for table: " + settings.nTable.id + ' finding id ' + dataTablesChartsEvents['$DataTableID'] + ' searching for ' + searchData);
            `$('#' + '$DataTableID' + ' td').removeClass('highlight');
            console.log(count++ + ' ' + rowData + '  ' + index);
            if (searchData.includes(dataTablesChartsEvents['$DataTableID'])) {

                // Get column index of matched value
                var colIndex = searchData.indexOf(dataTablesChartsEvents['$DataTableID']);

                // Get Datatable API
                var table = new `$.fn.dataTable.Api(settings);

                // Get cell().node() for matched value
                var cell = table.cell(index, colIndex).node();

                // highlight the cell
                `$(cell).addClass('highlight')

                return true;
            }
            return false;
        }
    );
"@

    Add-HTMLScript -Placement Footer -Content $DataTablesOutput

    [PSCustomObject] @{
        ObjectType = 'ChartEvents'
        Event      = $Output
    }
}