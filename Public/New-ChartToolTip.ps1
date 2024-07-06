function New-ChartToolTip {
    <#
    .SYNOPSIS
    Creates a new chart tooltip object with customizable options.

    .DESCRIPTION
    This function defines a chart tooltip object with various options such as names, title text, type, min and max values, X and Y axis format patterns. It allows customization of the tooltip appearance and behavior.

    .PARAMETER Names
    Specifies an array of names for the chart tooltip.

    .PARAMETER TitleText
    Specifies the title text for the chart tooltip.

    .PARAMETER Type
    Specifies the type of the chart tooltip. Valid values are 'datetime', 'category', or 'numeric'.

    .PARAMETER MinValue
    Specifies the minimum value for the chart tooltip.

    .PARAMETER MaxValue
    Specifies the maximum value for the chart tooltip.

    .PARAMETER XAxisFormatPattern
    Specifies the format pattern for the X-axis in the chart tooltip.

    .PARAMETER YAxisFormatPattern
    Specifies the format pattern for the Y-axis in the chart tooltip. Default is "function (seriesName) { return ''; }".

    .EXAMPLE
    New-ChartToolTip -Names @("Name1", "Name2") -TitleText "Tooltip Title" -Type 'datetime' -MinValue 0 -MaxValue 100 -XAxisFormatPattern "HH:mm:ss" -YAxisFormatPattern "function (seriesName) { return seriesName + ': ' + value; }"
    Creates a new chart tooltip object with names "Name1" and "Name2", title "Tooltip Title", datetime type, min value of 0, max value of 100, X-axis format pattern "HH:mm:ss", and custom Y-axis format pattern.

    .EXAMPLE
    New-ChartToolTip -Names @("Data1", "Data2", "Data3") -TitleText "Data Tooltip" -Type 'numeric' -MinValue 50 -MaxValue 200 -XAxisFormatPattern "MM/dd/yyyy" -YAxisFormatPattern "function (seriesName) { return seriesName + ': ' + value; }"
    Creates a new chart tooltip object with names "Data1", "Data2", and "Data3", title "Data Tooltip", numeric type, min value of 50, max value of 200, X-axis format pattern "MM/dd/yyyy", and custom Y-axis format pattern.
    #>
    [CmdletBinding()]
    param(
        [alias('Name')][Array] $Names,
        [alias('Title')][string] $TitleText,
        [ValidateSet('datetime', 'category', 'numeric')][string] $Type = 'category',
        [object] $MinValue,
        [object] $MaxValue,
        [string] $XAxisFormatPattern, #"HH:mm:ss"
        [string] $YAxisFormatPattern = "function (seriesName) { return ''; }"

        #[ValidateSet('top', 'topRight', 'left', 'right', 'bottom', '')][string] $LegendPosition = '',
        # [string[]] $Color
    )

    [PSCustomObject] @{
        ObjectType   = 'ChartToolTip'
        ChartToolTip = @{
            enabled = $true
            y       = @{ title = @{ formatter = "$YAxisFormatPattern" } }
            x       = @{ format = "$XAxisFormatPattern" }
        }
    }
}