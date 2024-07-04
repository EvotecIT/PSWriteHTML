function New-ApexChart {
    <#
    .SYNOPSIS
    Creates a new ApexChart with the specified options and events.

    .DESCRIPTION
    This function creates a new ApexChart with the provided options and events. It allows customization of the chart appearance and behavior.

    .PARAMETER Options
    Specifies the options for configuring the ApexChart. This should be a dictionary containing the necessary settings for the chart.

    .PARAMETER Events
    Specifies the events to be associated with the ApexChart. These events can trigger actions on specific interactions with the chart.

    .EXAMPLE
    $chartOptions = @{
        chart = @{
            type = 'line'
            height = 350
        }
        series = @(
            @{
                name = 'Series 1'
                data = [100, 200, 300, 400, 500]
            }
        )
    }
    $chartEvents = @{
        dataPointSelection = {
            Write-Host "Data point selected: $_"
        }
    }
    New-ApexChart -Options $chartOptions -Events $chartEvents

    Creates a new ApexChart of type 'line' with a height of 350 pixels and a single series named 'Series 1' with data points [100, 200, 300, 400, 500]. It also specifies an event to display a message when a data point is selected.

    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [Object] $Events
    )

    if ($Events) {
        $Options.chart.events = 'EventsReplaceMe'
    }

    $Script:HTMLSchema.Features.ChartsApex = $true
    #[string] $ID = "ChartID-" + (Get-RandomStringName -Size 8)

    $Div = New-HTMLTag -Tag 'div' -Attributes @{ class = 'flexElement'; id = $Options.chart.id; }
    $Script = New-HTMLTag -Tag 'script' -Value {
        # Convert Dictionary to JSON and return chart within SCRIPT tag
        # Make sure to return with additional empty string
        Remove-EmptyValue -Hashtable $Options -Recursive -Rerun 2
        $JSON = $Options | ConvertTo-JsonLiteral -Depth 5 -AdvancedReplace @{ '.' = '\.'; '$' = '\$' }
        # replaces stuff for TImeLineCharts
        $JSON = $JSON.Replace('"new Date(', 'new Date(').Replace(').getTime()"', ').getTime()')

        # We replace Events on JSON because there's no other way that I can think of
        if ($Options.chart.events) {
            $JSON = $JSON -replace ('"events":"EventsReplaceMe"', $Events)
        }

        $JSON = $JSON | ForEach-Object { [System.Text.RegularExpressions.Regex]::Unescape($_) }

        "var options = $JSON"
        "var chart = new ApexCharts(document.querySelector('#$ID'),
            options
        );"
        "chart.render();"
    } -NewLine
    $Div
    # we need to move it to the end of the code therefore using additional vesel
    $Script:HTMLSchema.Charts.Add($Script)
}