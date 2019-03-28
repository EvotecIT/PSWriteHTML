function New-ApexChart {
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [ValidateSet('', 'central')][string] $Positioning
    )
    $Script:HTMLSchema.Features.ChartsApex = $true
    [string] $ID = "ChartID-" + (Get-RandomStringName -Size 8)
    $Div = New-HTMLTag -Tag 'div' -Attributes @{ id = $ID; class = $Positioning }
    $Script = New-HTMLTag -Tag 'script' -Value {
        # Convert Dictionary to JSON and return chart within SCRIPT tag
        # Make sure to return with additional empty string
        $JSON = $Options | ConvertTo-Json -Depth 5
        "var options = $JSON"
        ""
        "var chart = new ApexCharts(document.querySelector('#$ID'),
            options
        );"
        "chart.render();"
    }
    $Div
    # we need to move it to the end of the code therefore using additional vesel
    $Script:HTMLSchema.Charts.Add($Script)
}