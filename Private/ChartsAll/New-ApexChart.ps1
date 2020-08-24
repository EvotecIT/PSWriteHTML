function New-ApexChart {
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options
    )
    $Script:HTMLSchema.Features.ChartsApex = $true
    [string] $ID = "ChartID-" + (Get-RandomStringName -Size 8)
    $Div = New-HTMLTag -Tag 'div' -Attributes @{ id = $ID; }
    $Script = New-HTMLTag -Tag 'script' -Value {
        # Convert Dictionary to JSON and return chart within SCRIPT tag
        # Make sure to return with additional empty string
        Remove-EmptyValue -Hashtable $Options -Recursive -Rerun 2
        $JSON = $Options | ConvertTo-Json -Depth 5
        # replaces stuff for TImeLineCharts
        $JSON = $JSON.Replace('"new Date(', 'new Date(').Replace(').getTime()"', ').getTime()')
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