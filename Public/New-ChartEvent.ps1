function New-ChartEvent {
    [cmdletBinding()]
    param(
        [Parameter(Mandatory)][string] $DataTableID,
        [Parameter(Mandatory)][int] $ColumnID
    )
    $Script:HTMLSchema.Features.EscapeRegex = $true

    $Output = @"
        events: {
            dataPointSelection: function (event, chartContext, config) {
                //console.log('Data point index: ' + config.dataPointIndex + ' Series Index: ' + config.seriesIndex);
                if (['donut', 'pie', 'radialBar'].includes(config.w.config.chart.type)) {
                    console.log(config.w.config.series[config.dataPointIndex]);
                    console.log(config.w.config.labels[config.dataPointIndex]);
                    var findValue1 = escapeRegExp(config.w.config.series[config.dataPointIndex])
                    var findValue2 = escapeRegExp(config.w.config.labels[config.dataPointIndex])
                    //var findValue3 = escapeRegExp(config.w.config.series[0].data[config.dataPointIndex].x)
                } else if (config.w.config.chart.type === 'rangeBar') {
                    console.log(config.w.config.series[0].data[config.dataPointIndex].x); // name
                    console.log(config.w.config.series[0].data[config.dataPointIndex].y[0]); // date from
                    console.log(config.w.config.series[0].data[config.dataPointIndex].y[1]); // date to

                    var findValue1 = escapeRegExp(config.w.config.series[0].data[config.dataPointIndex].y[0])
                    var findValue2 = escapeRegExp(config.w.config.series[0].data[config.dataPointIndex].y[1])
                    var findValue3 = escapeRegExp(config.w.config.series[0].data[config.dataPointIndex].x)
                } else {
                    console.log(config.w.config.series[config.seriesIndex].data[config.dataPointIndex]); // Value
                    console.log(config.w.config.series[config.seriesIndex].name);  // Name of ChartLegend
                    console.log(config.w.config.xaxis.categories[config.dataPointIndex]); // Name of Object on X axis

                    var findValue1 = escapeRegExp(config.w.config.series[config.seriesIndex].data[config.dataPointIndex]);
                    var findValue2 = escapeRegExp(config.w.config.series[config.seriesIndex].name);
                    var findValue3 = escapeRegExp(config.w.config.xaxis.categories[config.dataPointIndex]);
                }

                var table1 = `$('#$DataTableID').DataTable();
                if (findValue3 != '') {
                    table1.columns($ColumnID).search("^" + findValue3 + "`$", true, false, true).draw();
                } else {
                    table1.columns($ColumnID).search('').draw();
                }
                if (table1.page.info().recordsDisplay == 0) {
                    table1.columns($ColumnID).search('').draw();
                }
            }
        }
"@
    [PSCustomObject] @{
        ObjectType = 'ChartEvents'
        Event      = $Output
    }
}