function New-ChartEvent {
    <#
    .SYNOPSIS
    Creates a new chart event for a specified DataTable.

    .DESCRIPTION
    This function creates a new chart event for a specified DataTable. It allows for defining events like click, data point selection, and marker click for the chart.

    .PARAMETER DataTableID
    Specifies the ID of the DataTable for which the chart event is being created.

    .PARAMETER ColumnID
    Specifies the ID of the column in the DataTable for which the chart event is being created.

    .PARAMETER EscapeRegex
    Indicates whether to escape regular expressions in the chart event.

    .EXAMPLE
    New-ChartEvent -DataTableID "table1" -ColumnID 1 -EscapeRegex
    Creates a new chart event for DataTable with ID "table1" on column 1 with regular expression escaping enabled.

    .EXAMPLE
    New-ChartEvent -DataTableID "table2" -ColumnID 2
    Creates a new chart event for DataTable with ID "table2" on column 2 without regular expression escaping.

    #>
    [cmdletBinding()]
    param(
        [Parameter(Mandatory)][string] $DataTableID,
        [Parameter(Mandatory)][int] $ColumnID,
        [switch] $EscapeRegex
    )
    if ($EscapeRegex) {
        $Script:HTMLSchema.Features.EscapeRegex = $true
        $Escape = 'true'
    } else {
        $Escape = 'false'
    }
    $Script:HTMLSchema.Features.ChartsEvents = $true


    $Output = @"
            events: {
                click: function (event, chartContext, config) {
                    chartEventClick('$DataTableID', $ColumnID, config.config, config.dataPointIndex, config.seriesIndex, $Escape);
                },
                dataPointSelection: function (event, chartContext, config) {
                    chartEventDataPointClick('$DataTableID', $ColumnID, config.w.config, config.dataPointIndex, $Escape);
                },
                markerClick: function (event, chartContext, { seriesIndex, dataPointIndex, config }) {
                    chartEventMarkerClick('$DataTableID', $ColumnID, chartContext.opts, dataPointIndex, seriesIndex, $Escape);
                }
            }
"@
    $DataTablesOutput = @"
    `$.fn.dataTable.ext.search.push(
        function (settings, searchData, index, rowData, counter) {
            return dataTablesSearchExtension('$DataTableID', settings, searchData, index, rowData, counter, true);
        }
    );
"@

    Add-HTMLScript -Placement Footer -Content $DataTablesOutput

    [PSCustomObject] @{
        ObjectType = 'ChartEvents'
        Event      = $Output
    }
}