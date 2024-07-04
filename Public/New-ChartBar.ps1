function New-ChartBar {
    <#
    .SYNOPSIS
    Creates a new bar chart object with specified name, value, and color.

    .DESCRIPTION
    This function creates a new bar chart object with the provided name, value, and color. The name is used as the identifier for the bar, the value represents the data to be displayed, and the color determines the color of the bar.

    .PARAMETER Name
    The name of the bar chart object.

    .PARAMETER Value
    The value or data to be displayed in the bar chart.

    .PARAMETER Color
    The color of the bar. If not specified, a default color will be used.

    .EXAMPLE
    New-ChartBar -Name 'Sales' -Value 1000 -Color 'blue'

    Creates a new bar chart object named 'Sales' with a value of 1000 and a blue color.

    .EXAMPLE
    New-ChartBar -Name 'Expenses' -Value 750 -Color 'red'

    Creates a new bar chart object named 'Expenses' with a value of 750 and a red color.
    #>
    [alias('ChartBar')]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][string] $Name,
        [Parameter(Mandatory)][object] $Value,
        [string[]] $Color
    )
    $Object = [ordered] @{
        ObjectType = 'Bar'
        Name       = $Name
        Value      = $Value
        series     = [ordered]@{
            name = $Name
            type = 'column'
            data = $Value
        }
        Color      = if ($Color) { ConvertFrom-Color -Color $Color } else { $null }
    }
    Remove-EmptyValue -Hashtable $Object -Recursive
    $Object
}

Register-ArgumentCompleter -CommandName New-ChartBar -ParameterName Color -ScriptBlock $Script:ScriptBlockColors