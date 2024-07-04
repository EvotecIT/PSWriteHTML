function New-ChartDonut {
    <#
    .SYNOPSIS
    Creates a new donut chart object with specified name, value, and color.

    .DESCRIPTION
    This function creates a new donut chart object with the provided name, value, and color. The name is used as the identifier for the donut, the value represents the data to be displayed, and the color determines the color of the donut.

    .PARAMETER Name
    The name of the donut chart object.

    .PARAMETER Value
    The value or data to be displayed in the donut chart.

    .PARAMETER Color
    The color of the donut. If not specified, a default color will be used.

    .EXAMPLE
    New-ChartDonut -Name 'Sales' -Value 1000 -Color 'blue'

    Creates a new donut chart object named 'Sales' with a value of 1000 and a blue color.

    .EXAMPLE
    New-ChartDonut -Name 'Expenses' -Value 750 -Color 'red'

    Creates a new donut chart object named 'Expenses' with a value of 750 and a red color.
    #>
    [alias('ChartDonut')]
    [CmdletBinding()]
    param(
        [string] $Name,
        [object] $Value,
        [string] $Color
    )

    [PSCustomObject] @{
        ObjectType = 'Donut'
        Name       = $Name
        Value      = $Value
        Color      = if ($Color) { ConvertFrom-Color -Color $Color } else { $null }
    }
}
Register-ArgumentCompleter -CommandName New-ChartDonut -ParameterName Color -ScriptBlock $Script:ScriptBlockColors