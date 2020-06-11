function New-ChartGrid {
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