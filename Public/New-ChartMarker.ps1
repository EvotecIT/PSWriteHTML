function New-ChartMarker {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER Size
    Size of the marker point.

    .PARAMETER Color
    Sets the fill color(s) of the marker point.

    .PARAMETER StrokeColors
    Stroke Color of the marker. Accepts a single color or an array of colors in a multi-series chart.

    .PARAMETER StrokeWidth
    Stroke Size of the marker.

    .PARAMETER StrokeOpacity
    Opacity of the border around marker.

    .PARAMETER StrokeDashArray
    Dashes in the border around marker. Higher number creates more space between dashes in the border.

    .PARAMETER FillOpacity
    Opacity of the marker fill color.

    .PARAMETER Shape
    Shape of the marker. Available Options for shape circle or square

    .PARAMETER Radius
    Radius of the marker (applies to square shape)

    .PARAMETER OffsetX
    Sets the left offset of the marker

    .PARAMETER OffsetY
    Sets the top offset of the marker

    .PARAMETER ShowNullDataPoints
    Whether to show markers for null values in a line/area chart. If disabled, any null values present in line/area charts will not be visible.

    .PARAMETER HoverSize
    Fixed size of the marker when it is active

    .PARAMETER HoverSizeOffset
    Unlike the fixed size, this option takes the original markers.size and increases/decreases the value based on it.
    So, if markers.size: 6, markers.hover.sizeOffset: 3 will make the marker’s size 9 when hovered.

    .EXAMPLE
    New-HTMLChart -Title 'Incidents Reported vs Solved' -TitleAlignment center {
        New-ChartMarker -Size 30 -Color red -Shape square -StrokeColors yellow
    }

    .NOTES
    Based on https://apexcharts.com/docs/options/markers/
    #>
    [cmdletBinding()]
    param(
        [nullable[int]] $Size,
        [string[]] $Color,
        [string[]] $StrokeColors,
        [int[]] $StrokeWidth,
        [int[]]$StrokeOpacity,
        [int[]]$StrokeDashArray,
        [int[]]$FillOpacity,
        [validateSet('circle', 'square')][string[]] $Shape,
        [int[]]$Radius,
        [int[]]$OffsetX,
        [int[]]$OffsetY,
        [switch] $ShowNullDataPoints,
        [int[]] $HoverSize,
        [int[]] $HoverSizeOffset
    )

    $Object = [PSCustomObject] @{
        ObjectType = 'Marker'
        markers    = [ordered]@{

        }
    }
    if ($Size) {
        $Object.markers.size = $Size
    }
    if ($Color) {
        $Object.markers.color = ConvertFrom-Color -Color $Color
    }
    if ($StrokeColors) {
        $Object.markers.strokeColors = ConvertFrom-Color -Color $StrokeColors
    }
    if ($null -ne $StrokeWidth) {
        $Object.markers.strokeWidth = $StrokeWidth
    }
    if ($null -ne $StrokeOpacity) {
        $Object.markers.strokeOpacity = $StrokeOpacity
    }
    if ($null -ne $StrokeDashArray) {
        $Object.markers.strokeDashArray = $StrokeDashArray
    }
    if ($null -ne $FillOpacity) {
        $Object.markers.fillOpacity = $FillOpacity
    }
    if ($Shape.Count -eq 1) {
        $Object.markers.shape = $Shape[0]
    } elseif ($Shape.Count -gt 1) {
        $Object.markers.shape = $Shape
    }
    if ($null -ne $Radius) {
        $Object.markers.radius = $Radius
    }
    if ($null -ne $OffsetX) {
        $Object.markers.offsetX = $OffsetX
    }
    if ($null -ne $OffsetY) {
        $Object.markers.offsetY = $OffsetY
    }
    if ($ShowNullDataPoints) {
        $Object.markers.showNullDataPoints = $ShowNullDataPoints.IsPresent
    }
    if ($null -ne $HoverSize -or $Null -ne $HoverSizeOffset) {
        $Object.markers.hover = [ordered]@{}
        if ($null -ne $HoverSize) {
            $Object.markers.hover.size = $HoverSize
        }
        if ($null -ne $HoverSizeOffset) {
            $Object.markers.hover.sizeOffset = $HoverSizeOffset
        }
    }
    Remove-EmptyValue -Hashtable $Object.markers -Recursive -Rerun 1
    $Object
}

<#
    size: 0,
    colors: undefined,
    strokeColors: '#fff',
    strokeWidth: 2,
    strokeOpacity: 0.9,
    strokeDashArray: 0,
    fillOpacity: 1,
    discrete: [],
    shape: "circle",
    radius: 2,
    offsetX: 0,
    offsetY: 0,
    onClick: undefined,
    onDblClick: undefined,
    showNullDataPoints: true,
    hover: {
      size: undefined,
      sizeOffset: 3
    }
#>