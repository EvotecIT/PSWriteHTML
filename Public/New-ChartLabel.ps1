function New-ChartLabel {
    <#
    .SYNOPSIS
    Overrides chart labels for charts that support top-level ApexCharts labels.

    .DESCRIPTION
    Provides a friendly way to set labels, especially for pie and donut charts
    when labels should be supplied separately from the value commands.

    .EXAMPLE
    New-ChartLabel -Name 'Passed', 'Failed', 'Skipped'
    #>
    [alias('ChartLabel')]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [alias('Name')]
        [string[]] $Names
    )

    [PSCustomObject] @{
        ObjectType = 'ChartLabel'
        Names      = $Names
    }
}
