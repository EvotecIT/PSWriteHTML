function New-TablePercentageBarInternal {
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
        $JsonConditions = $ConditionalFormatting | ConvertTo-Json
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