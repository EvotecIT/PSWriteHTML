function New-ChartEvent {
    [cmdletBinding()]
    param(
        [Parameter(Mandatory)][string] $DataTableID,
        [Parameter(Mandatory)][int] $ColumnID,
        [int] $ColumnValueID
    )
    $Script:HTMLSchema.Features.EscapeRegex = $true

    if ($ColumnValueID) {
        $Script:HTMLSchema.Features.DataTablesSelect = $true
        $Selection = "table1.columns([$ColumnID, $ColumnValueID]).select();"
    }

    $Output = @"
        events: {
            dataPointSelection: function (event, chartContext, config) {
                if (['donut', 'pie', 'radialBar'].includes(config.w.config.chart.type)) {
                    //console.log(config.w.config.series[config.dataPointIndex]);
                    //console.log(config.w.config.labels[config.dataPointIndex]);
                    var findValue = escapeRegExp(config.w.config.labels[config.dataPointIndex])
                    //var findValue1 = escapeRegExp(config.w.config.series[config.dataPointIndex])
                    //var findValue2 = escapeRegExp(config.w.config.labels[config.dataPointIndex])
                } else if (config.w.config.chart.type === 'rangeBar') {
                    console.log(config.w.config.series[0].data[config.dataPointIndex].x); // name
                    //console.log(config.w.config.series[0].data[config.dataPointIndex].y[0]); // date from
                    //console.log(config.w.config.series[0].data[config.dataPointIndex].y[1]); // date to
                    var findValue = escapeRegExp(config.w.config.series[0].data[config.dataPointIndex].x)
                    //var findValue = escapeRegExp(config.w.config.series[0].data[config.dataPointIndex].y[0])
                    //var findValue2 = escapeRegExp(config.w.config.series[0].data[config.dataPointIndex].y[1])
                    //var findValue3 = escapeRegExp(config.w.config.series[0].data[config.dataPointIndex].x)
                } else {
                    //console.log(config.w.config.series[config.seriesIndex].data[config.dataPointIndex]); // Value
                    //console.log(config.w.config.series[config.seriesIndex].name);  // Name of ChartLegend
                    //console.log(config.w.config.xaxis.categories[config.dataPointIndex]); // Name of Object on X axis

                    var findValue = escapeRegExp(config.w.config.xaxis.categories[config.dataPointIndex]);
                    //var findValue1 = escapeRegExp(config.w.config.series[config.seriesIndex].data[config.dataPointIndex]);
                    //var findValue2 = escapeRegExp(config.w.config.series[config.seriesIndex].name);
                }

                var table1 = `$('#$DataTableID').DataTable();
                if (findValue != '') {
                    table1.columns($ColumnID).search("^" + findValue + "`$", true, false, true).draw();
                    $Selection
                } else {
                    table1.columns($ColumnID).search('').draw();
                }
                if (table1.page.info().recordsDisplay == 0) {
                    table1.columns($ColumnID).search('').draw();
                }
            },
            click: function(event, chartContext, config) {
                if (config.globals.selectedDataPoints[0].length === 0) {
                    //console.log(config.globals.selectedDataPoints[0]);
                    var table1 = `$('#$DataTableID').DataTable();
                    table1.columns(0).search('').draw();
                }
            },
            //markerClick: function(event, chartContext, { seriesIndex, dataPointIndex, config}) {
            //}
        }
"@
    [PSCustomObject] @{
        ObjectType = 'ChartEvents'
        Event      = $Output
    }
}