function New-TablePercentageBarInternal {
    <#
    .SYNOPSIS
    Creates a new internal percentage bar for data visualization in a table column.

    .DESCRIPTION
    This function creates a new internal percentage bar for data visualization in a table column. It allows customization of the bar type, text color, border color, border style, bar color, background color, rounding value, and conditional formatting options.

    .PARAMETER ColumnID
    Specifies the ID of the column where the percentage bar will be displayed.

    .PARAMETER ColumnName
    Specifies the name of the column for reference.

    .PARAMETER Type
    Specifies the type of the percentage bar shape. Valid values are 'square' or 'round'.

    .PARAMETER TextColor
    Specifies the color of the text displayed on the percentage bar.

    .PARAMETER BorderColor
    Specifies the color of the border of the percentage bar.

    .PARAMETER BorderStyle
    Specifies the style of the border of the percentage bar. Valid values are 'solid', 'outset', 'groove', or 'ridge'.

    .PARAMETER BarColor
    Specifies the color of the percentage bar.

    .PARAMETER BackgroundColor
    Specifies the background color behind the percentage bar.

    .PARAMETER RoundValue
    Specifies the rounding value for the percentage bar.

    .PARAMETER ConditionalFormatting
    Specifies an array of conditional formatting rules for the percentage bar.

    .EXAMPLE
    New-TablePercentageBarInternal -ColumnID 1 -ColumnName 'Sales' -Type 'round' -TextColor 'white' -BorderColor 'black' -BorderStyle 'solid' -BarColor 'green' -BackgroundColor 'lightgray' -RoundValue 2 -ConditionalFormatting @($Condition1, $Condition2)
    Creates a new internal percentage bar in the 'Sales' column with a round shape, white text color, black border color, solid border style, green bar color, light gray background color, rounding to 2 decimal places, and conditional formatting rules.

    .EXAMPLE
    New-TablePercentageBarInternal -ColumnID 2 -ColumnName 'Profit' -Type 'square' -TextColor 'black' -BorderColor 'gray' -BorderStyle 'groove' -BarColor 'blue' -BackgroundColor 'white' -RoundValue 0 -ConditionalFormatting @($Condition3)
    Creates a new internal percentage bar in the 'Profit' column with a square shape, black text color, gray border color, groove border style, blue bar color, white background color, no rounding, and a single conditional formatting rule.
    #>
    [cmdletbinding()]
    param(
        [int] $ColumnID,
        [string] $ColumnName,
        [ValidateSet('square', 'round')][string] $Type,
        [string] $TextColor,
        [string] $BorderColor,
        [ValidateSet('solid', 'outset', 'groove', 'ridge')][string] $BorderStyle,
        [string] $BarColor,
        [string] $BackgroundColor,
        [int] $RoundValue,
        [Array] $ConditionalFormatting
    )

    if ($ConditionalFormatting) {
        $JsonConditions = $ConditionalFormatting | ConvertTo-Json -Compress
        [ordered]@{
            targets = $ColumnID
            render  = "`$.fn.dataTable.render.percentBar('$Type','$TextColor', '$BorderColor', '$BarColor', '$BackgroundColor', $RoundValue, '$BorderStyle', $JsonConditions)"
        }
    } else {
        [ordered]@{
            targets = $ColumnID
            render  = "`$.fn.dataTable.render.percentBar('$Type','$TextColor', '$BorderColor', '$BarColor', '$BackgroundColor', $RoundValue, '$BorderStyle')"
        }
    }
}
