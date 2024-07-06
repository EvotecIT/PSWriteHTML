function New-ChartGrid {
    <#
    .SYNOPSIS
    Creates a new chart grid with customizable options.

    .DESCRIPTION
    This function creates a new chart grid with the provided parameters. It allows customization of the grid visibility, colors, opacity, padding, and other styling options.

    .PARAMETER Show
    Indicates whether the grid is visible.

    .PARAMETER BorderColor
    The color of the grid border.

    .PARAMETER StrokeDash
    The style of the grid border. Default is 0.

    .PARAMETER Position
    The position of the grid. Accepted values are 'front', 'back', 'default'. Default is 'default'.

    .PARAMETER xAxisLinesShow
    Indicates whether the x-axis lines are visible.

    .PARAMETER yAxisLinesShow
    Indicates whether the y-axis lines are visible.

    .PARAMETER RowColors
    An array of colors for the rows in the grid.

    .PARAMETER RowOpacity
    The opacity of the row colors. Valid range is 0 to 1. Default is 0.5.

    .PARAMETER ColumnColors
    An array of colors for the columns in the grid.

    .PARAMETER ColumnOpacity
    The opacity of the column colors. Valid range is 0 to 1. Default is 0.5.

    .PARAMETER PaddingTop
    The top padding of the grid.

    .PARAMETER PaddingRight
    The right padding of the grid.

    .PARAMETER PaddingBottom
    The bottom padding of the grid.

    .PARAMETER PaddingLeft
    The left padding of the grid.

    .EXAMPLE
    New-ChartGrid -Show -BorderColor 'black' -StrokeDash 2 -Position 'front' -xAxisLinesShow -yAxisLinesShow -RowColors @('red', 'blue') -RowOpacity 0.7 -ColumnColors @('green', 'yellow') -ColumnOpacity 0.8 -PaddingTop 10 -PaddingRight 5 -PaddingBottom 15 -PaddingLeft 5

    Creates a new chart grid with specified options including visible grid, black border color, dashed border style, front position, visible x-axis and y-axis lines, red and blue row colors with 0.7 opacity, green and yellow column colors with 0.8 opacity, and padding values.

    .EXAMPLE
    New-ChartGrid -Show -BorderColor 'gray' -RowColors @('orange', 'purple') -ColumnColors @('pink', 'cyan') -PaddingTop 5 -PaddingRight 5 -PaddingBottom 5 -PaddingLeft 5

    Creates a new chart grid with visible grid, gray border color, orange and purple row colors, pink and cyan column colors, and equal padding values.

    #>
    [alias('ChartGrid')]
    [CmdletBinding()]
    param(
        [switch] $Show,
        [string] $BorderColor,
        [int] $StrokeDash, #: 0,
        [ValidateSet('front', 'back', 'default')][string] $Position = 'default',
        [switch] $xAxisLinesShow,
        [switch] $yAxisLinesShow,
        [string[]] $RowColors,
        [double] $RowOpacity = 0.5, # valid range 0 - 1
        [string[]] $ColumnColors,
        [double] $ColumnOpacity = 0.5, # valid range 0 - 1
        [int] $PaddingTop,
        [int] $PaddingRight,
        [int] $PaddingBottom,
        [int] $PaddingLeft
    )
    [PSCustomObject] @{
        ObjectType = 'ChartGrid'
        Grid       = @{
            Show           = $Show.IsPresent
            BorderColor    = $BorderColor
            StrokeDash     = $StrokeDash
            Position       = $Position
            xAxisLinesShow = $xAxisLinesShow.IsPresent
            yAxisLinesShow = $yAxisLinesShow.IsPresent
            RowColors      = $RowColors
            RowOpacity     = $RowOpacity
            ColumnColors   = $ColumnColors
            ColumnOpacity  = $ColumnOpacity
            PaddingTop     = $PaddingTop
            PaddingRight   = $PaddingRight
            PaddingBottom  = $PaddingBottom
            PaddingLeft    = $PaddingLeft
        }
    }
    # https://apexcharts.com/docs/options/xaxis/
}
Register-ArgumentCompleter -CommandName New-ChartGrid -ParameterName BorderColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-ChartGrid -ParameterName RowColors -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-ChartGrid -ParameterName ColumnColors -ScriptBlock $Script:ScriptBlockColors