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
        [int] $RoundValue
    )

    [ordered]@{
        targets = $ColumnID
        render  = "`$.fn.dataTable.render.percentBar('$Type','$TextColor', '$BorderColor', '$BarColor', '$BackgroundColor', $RoundValue, '$BorderStyle')"
    }
}