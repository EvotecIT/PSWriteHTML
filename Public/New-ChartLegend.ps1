function New-ChartLegend {
    <#
    .SYNOPSIS
    Creates a new chart legend with customizable options.

    .DESCRIPTION
    The New-ChartLegend function creates a new chart legend with various customization options such as position, alignment, font settings, and more.

    .PARAMETER Names
    Specifies an array of names for the legend items.

    .PARAMETER Color
    Specifies an array of colors for the legend items.

    .PARAMETER HideLegend
    Indicates whether to hide the legend.

    .PARAMETER LegendPosition
    Specifies the position of the legend (top, left, right, bottom).

    .PARAMETER HorizontalAlign
    Specifies the horizontal alignment of the legend labels (left, center, right).

    .PARAMETER Floating
    Indicates whether the legend should float.

    .PARAMETER InverseOrder
    Indicates whether to display legend items in reverse order.

    .PARAMETER OffsetX
    Specifies the horizontal offset of the legend.

    .PARAMETER OffsetY
    Specifies the vertical offset of the legend.

    .PARAMETER ItemMarginHorizontal
    Specifies the horizontal margin between legend items.

    .PARAMETER ItemMarginVertical
    Specifies the vertical margin between legend items.

    .PARAMETER FontSize
    Specifies the font size of the legend labels.

    .PARAMETER FontFamily
    Specifies the font family of the legend labels.

    .PARAMETER FontWeight
    Specifies the font weight of the legend labels.

    .PARAMETER DisableOnItemClickToggleDataSeries
    Indicates whether to disable toggling data series on legend item click.

    .PARAMETER DisableOnItemHoverHighlightDataSeries
    Indicates whether to disable highlighting data series on legend item hover.

    .PARAMETER UseSeriesColors
    Indicates whether to use series colors for legend items.

    .EXAMPLE
    New-ChartLegend -Names @('A', 'B', 'C') -Color @('red', 'blue', 'green') -LegendPosition 'top' -HorizontalAlign 'center' -FontSize 12

    Creates a new chart legend with three items ('A', 'B', 'C') in red, blue, and green colors positioned at the top with center alignment and font size of 12.

    #>
    [alias('ChartLegend')]
    [CmdletBinding()]
    param(
        [Array] $Names,
        [string[]] $Color,

        # real legend
        [switch] $HideLegend,
        [ValidateSet('top', 'left', 'right', 'bottom')][string] $LegendPosition,
        [ValidateSet('left', 'center', 'right')][string] $HorizontalAlign,
        [switch] $Floating,
        [switch] $InverseOrder,
        [nullable[int]] $OffsetX,
        [nullable[int]] $OffsetY,
        [nullable[int]] $ItemMarginHorizontal,
        [nullable[int]] $ItemMarginVertical,
        [object] $FontSize,
        [string] $FontFamily,
        [ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string] $FontWeight,
        [switch] $DisableOnItemClickToggleDataSeries,
        [switch] $DisableOnItemHoverHighlightDataSeries,
        [switch] $UseSeriesColors
    )
    $Object = [PSCustomObject] @{
        ObjectType = 'Legend'
        Names      = $Names
        Color      = if ($Color) { ConvertFrom-Color -Color $Color } else { $null }

        legend     = [ordered] @{
            show            = -not $HideLegend.IsPresent
            position        = if ($LegendPosition) { $LegendPosition.ToLower() } else { $null }
            horizontalAlign = if ($HorizontalAlign) { $HorizontalAlign.ToLower() } else { $null }
            labels          = @{}
        }
    }
    if ($UseSeriesColors) {
        $Object.legend.labels.useSeriesColors = $true
    }
    if ($Floating) {
        $Object.legend.floating = $true
    }
    if ($InverseOrder) {
        $Object.legend.inverseOrder = $true
    }
    if ($OffsetX -ne $null) {
        $Object.legend.offsetX = $OffsetX
    }
    if ($OffsetY -ne $null) {
        $Object.legend.offsetY = $OffsetY
    }
    if ($ItemMarginHorizontal -ne $null -or $ItemMarginHorizontal -ne $null) {
        $Object.legend.itemMargin = @{}
        if ($ItemMarginHorizontal -ne $null) {
            $Object.legend.itemMargin.horizontal = $ItemMarginHorizontal
        }
        if ($ItemMarginVertical -ne $null) {
            $Object.legend.itemMargin.vertical = $ItemMarginVertical
        }
    }
    if ($DisableOnItemClickToggleDataSeries) {
        $Object.legend.onItemClick = @{
            toggleDataSeries = $false
        }
    }
    if ($DisableOnItemHoverHighlightDataSeries) {
        $Object.legend.onItemHover = @{
            highlightDataSeries = $false
        }
    }

    if ($FontSize) {
        $Object.legend.fontSize = ConvertFrom-Size -Size $FontSize
    }
    if ($FontFamily) {
        $Object.legend.fontFamily = $FontFamily
    }
    if ($FontWeight) {
        $Object.legend.fontWeight = $FontWeight
    }

    Remove-EmptyValue -Hashtable $Object.legend -Recursive -Rerun 2
    $Object
}
Register-ArgumentCompleter -CommandName New-ChartLegend -ParameterName Color -ScriptBlock $Script:ScriptBlockColors