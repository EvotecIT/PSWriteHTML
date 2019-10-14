function New-ChartGrid {
    [alias('ChartGrid')]
    [CmdletBinding()]
    param(
        [switch] $Show,
        [string] $BorderColor = "",
        [int] $StrokeDash, #: 0,
        [ValidateSet('front', 'back', 'default')][string] $Position = 'default',
        [switch] $xAxisLinesShow,
        [switch] $yAxisLinesShow,
        [RGBColors[]] $RowColors,
        [double] $RowOpacity = 0.5, # valid range 0 - 1
        [RGBColors[]] $ColumnColors,
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