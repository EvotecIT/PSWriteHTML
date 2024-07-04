function New-ChartInternalGrid {
    <#
    .SYNOPSIS
    Creates a new internal grid configuration for a chart with customizable options for grid lines and colors.

    .DESCRIPTION
    This function creates a new internal grid configuration for a chart with the provided options. It allows customization of grid lines, colors, and padding.

    .PARAMETER Options
    Specifies the options for configuring the internal grid. This should be a dictionary containing the necessary settings for the grid.

    .PARAMETER Show
    Specifies whether the grid should be displayed on the chart.

    .PARAMETER BorderColor
    Specifies the color of the grid border.

    .PARAMETER StrokeDash
    Specifies the stroke dash array for the grid lines.

    .PARAMETER Position
    Specifies the position of the grid. Valid values are 'front', 'back', or 'default'.

    .PARAMETER xAxisLinesShow
    Specifies whether the x-axis grid lines should be displayed.

    .PARAMETER yAxisLinesShow
    Specifies whether the y-axis grid lines should be displayed.

    .PARAMETER RowColors
    Specifies an array of colors for the row grid lines.

    .PARAMETER RowOpacity
    Specifies the opacity of the row grid lines. Valid range is 0 to 1.

    .PARAMETER ColumnColors
    Specifies an array of colors for the column grid lines.

    .PARAMETER ColumnOpacity
    Specifies the opacity of the column grid lines. Valid range is 0 to 1.

    .PARAMETER PaddingTop
    Specifies the top padding for the grid.

    .PARAMETER PaddingRight
    Specifies the right padding for the grid.

    .PARAMETER PaddingBottom
    Specifies the bottom padding for the grid.

    .PARAMETER PaddingLeft
    Specifies the left padding for the grid.
    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [bool] $Show,
        [string] $BorderColor,
        [int] $StrokeDash, #: 0,
        [ValidateSet('front', 'back', 'default')][string] $Position = 'default',
        [nullable[bool]] $xAxisLinesShow = $null,
        [nullable[bool]] $yAxisLinesShow = $null,
        [alias('GridColors')][string[]] $RowColors,
        [alias('GridOpacity')][double] $RowOpacity = 0.5, # valid range 0 - 1
        [string[]] $ColumnColors ,
        [double] $ColumnOpacity = 0.5, # valid range 0 - 1
        [int] $PaddingTop,
        [int] $PaddingRight,
        [int] $PaddingBottom,
        [int] $PaddingLeft
    )

    <# Build this https://apexcharts.com/docs/options/grid/
        grid: {
            show: true,
            borderColor: '#90A4AE',
            strokeDashArray: 0,
            position: 'back',
            xaxis: {
                lines: {,
                    show: false
                }
            },
            yaxis: {
                lines: {,
                    show: false
                }
            },
            row: {
                colors: undefined,
                opacity: 0.5
            },
            column: {
                colors: undefined,
                opacity: 0.5
            },
            padding: {
                top: 0,
                right: 0,
                bottom: 0,
                left: 0
            },
        }
    #>

    $Options.grid = [ordered] @{ }
    $Options.grid.Show = $Show
    if ($BorderColor) {
        $options.grid.borderColor = @(ConvertFrom-Color -Color $BorderColor)
    }
    if ($StrokeDash -gt 0) {
        $Options.grid.strokeDashArray = $StrokeDash
    }
    if ($Position -ne 'Default') {
        $Options.grid.position = $Position
    }

    if ($null -ne $xAxisLinesShow) {
        $Options.grid.xaxis = @{ }
        $Options.grid.xaxis.lines = @{ }

        $Options.grid.xaxis.lines.show = $xAxisLinesShow
    }
    if ($null -ne $yAxisLinesShow) {
        $Options.grid.yaxis = @{ }
        $Options.grid.yaxis.lines = @{ }
        $Options.grid.yaxis.lines.show = $yAxisLinesShow
    }

    if ($RowColors.Count -gt 0 -or $RowOpacity -ne 0) {
        $Options.grid.row = @{ }
        if ($RowColors.Count -gt 0) {
            $Options.grid.row.colors = @(ConvertFrom-Color -Color $RowColors)
        }
        if ($RowOpacity -ne 0) {
            $Options.grid.row.opacity = $RowOpacity
        }
    }
    if ($ColumnColors.Count -gt 0 -or $ColumnOpacity -ne 0) {
        $Options.grid.column = @{ }
        if ($ColumnColors.Count -gt 0) {
            $Options.grid.column.colors = @(ConvertFrom-Color -Color $ColumnColors)
        }
        if ($ColumnOpacity -ne 0) {
            $Options.grid.column.opacity = $ColumnOpacitys
        }
    }
    if ($PaddingTop -gt 0 -or $PaddingRight -gt 0 -or $PaddingBottom -gt 0 -or $PaddingLeft -gt 0) {
        # Padding options
        $Options.grid.padding = @{ }
        if ($PaddingTop -gt 0) {
            $Options.grid.padding.PaddingTop = $PaddingTop
        }
        if ($PaddingRight -gt 0) {
            $Options.grid.padding.PaddingRight = $PaddingRight
        }
        if ($PaddingBottom -gt 0) {
            $Options.grid.padding.PaddingBottom = $PaddingBottom
        }
        if ($PaddingLeft -gt 0) {
            $Options.grid.padding.PaddingLeft = $PaddingLeft
        }
    }
}
Register-ArgumentCompleter -CommandName New-ChartInternalGrid -ParameterName BorderColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-ChartInternalGrid -ParameterName RowColors -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-ChartInternalGrid -ParameterName ColumnColors -ScriptBlock $Script:ScriptBlockColors