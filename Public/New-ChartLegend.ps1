function New-ChartLegend {
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
        [switch] $DisableOnItemHoverHighlightDataSeries
    )
    $Object = [PSCustomObject] @{
        ObjectType = 'Legend'
        Names      = $Names
        Color      = $Color

        legend     = [ordered] @{
            show            = -not $HideLegend.IsPresent
            position        = $LegendPosition
            horizontalAlign = $HorizontalAlign
        }
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

    if ($LabelFontSize) {
        $Object.legend.fontSize = ConvertFrom-Size -Size $FontSize
    }
    if ($LabelFontFamily) {
        $Object.legend.fontFamily = $FontFamily
    }
    if ($LabelFontWeight) {
        $Object.legend.fontWeight = $FontWeight
    }

    Remove-EmptyValue -Hashtable $Object.legend -Recursive -Rerun 2
    $Object
}
Register-ArgumentCompleter -CommandName New-ChartLegend -ParameterName Color -ScriptBlock $Script:ScriptBlockColors