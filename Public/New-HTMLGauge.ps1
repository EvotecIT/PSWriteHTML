function New-HTMLGauge {
    <#
    .SYNOPSIS
    Displays a value on a rounded semicircular gauge.

    .DESCRIPTION
    Generates a responsive SVG gauge without JavaScript. The arc represents the
    value within the stated range and stops at the endpoints; the label still
    shows the actual value, including values outside the range.

    .PARAMETER Value
    The current value.

    .PARAMETER Label
    The visible label and accessible name for the measurement.

    .PARAMETER MinValue
    The lower end of the scale. Defaults to 0.

    .PARAMETER MaxValue
    The upper end of the scale. Defaults to 100 and must exceed MinValue.

    .PARAMETER Unit
    Text appended to the current value, such as '%' or ' ms'.

    .PARAMETER Color
    The color of the filled arc.

    .PARAMETER TrackColor
    The color of the unfilled arc.

    .PARAMETER Width
    The maximum width of the gauge in pixels. It shrinks in narrower containers.

    .EXAMPLE
    New-HTMLGauge -Label 'Queue utilization' -Value 67 -Unit '%' -Color '#0078d4'
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][decimal] $Value,
        [Parameter(Mandatory)][ValidateNotNullOrEmpty()][string] $Label,
        [decimal] $MinValue = 0,
        [decimal] $MaxValue = 100,
        [string] $Unit,
        [string] $Color = '#0078d4',
        [string] $TrackColor = '#d8e1eb',
        [ValidateRange(120, 1200)][int] $Width = 280
    )

    if ($MaxValue -le $MinValue) {
        throw 'New-HTMLGauge: MaxValue must be greater than MinValue.'
    }

    $BoundedValue = [Math]::Min($MaxValue, [Math]::Max($MinValue, $Value))
    try {
        $Span = $MaxValue - $MinValue
        $Offset = $BoundedValue - $MinValue
        $Percent = 100 * ([double]$Offset / [double]$Span)
    } catch [System.OverflowException] {
        # Opposite-sign extremes can exceed Decimal.MaxValue when subtracted.
        $Percent = 100 * (([double]$BoundedValue - [double]$MinValue) / ([double]$MaxValue - [double]$MinValue))
    }
    $Culture = [Globalization.CultureInfo]::InvariantCulture
    $Dash = $Percent.ToString('0.###', $Culture)
    $DisplayValue = $Value.ToString($Culture) + $Unit
    $ValueAttributes = @{ x = 120; y = 108; 'text-anchor' = 'middle'; fill = 'currentColor'; 'font-size' = 27; 'font-weight' = 700 }
    if ($DisplayValue.Length -gt 11) {
        $ValueAttributes.textLength = 156
        $ValueAttributes.lengthAdjust = 'spacingAndGlyphs'
    }
    $Lower = $MinValue.ToString($Culture)
    $Upper = $MaxValue.ToString($Culture)
    $Arc = 'M 26 113 A 94 94 0 0 1 214 113'
    $ArcColor = [Net.WebUtility]::HtmlEncode((ConvertFrom-Color -Color $Color))
    $ArcTrackColor = [Net.WebUtility]::HtmlEncode((ConvertFrom-Color -Color $TrackColor))

    New-HTMLTag -Tag 'div' -Attributes @{
        style = @{ width = "${Width}px"; 'max-width' = '100%'; 'text-align' = 'center'; 'font-family' = 'system-ui, sans-serif' }
    } {
        New-HTMLTag -Tag 'svg' -Attributes @{
            viewBox = '0 0 240 128'
            width   = $Width
            role    = 'img'
            'aria-label' = [Net.WebUtility]::HtmlEncode("${Label}: $DisplayValue (range $Lower to $Upper)")
            style   = @{ display = 'block'; 'max-width' = '100%'; height = 'auto' }
        } {
            New-HTMLTag -Tag 'path' -Attributes @{
                d = $Arc; fill = 'none'; stroke = $ArcTrackColor
                'stroke-width' = 14; 'stroke-linecap' = 'round'
            }
            if ($Percent -gt 0) {
                New-HTMLTag -Tag 'path' -Attributes @{
                    d = $Arc; fill = 'none'; stroke = $ArcColor
                    'stroke-width' = 14; 'stroke-linecap' = 'round'
                    pathLength = 100; 'stroke-dasharray' = "$Dash 100"
                }
            }
            New-HTMLTag -Tag 'text' -Attributes $ValueAttributes { [Net.WebUtility]::HtmlEncode($DisplayValue) }
        }
        New-HTMLTag -Tag 'div' -Attributes @{
            'aria-hidden' = 'true'
            style = @{ display = 'flex'; 'justify-content' = 'space-between'; 'padding-inline' = '8px'; gap = '8px'; 'font-size' = '0.8rem' }
        } {
            New-HTMLTag -Tag 'span' -Attributes @{ style = @{ 'overflow-wrap' = 'anywhere'; 'text-align' = 'left' } } { $Lower }
            New-HTMLTag -Tag 'span' -Attributes @{ style = @{ 'overflow-wrap' = 'anywhere'; 'text-align' = 'right' } } { $Upper }
        }
        New-HTMLTag -Tag 'div' -Attributes @{ 'aria-hidden' = 'true'; style = @{ 'overflow-wrap' = 'anywhere'; 'padding-inline' = '8px'; 'font-size' = '0.95rem' } } {
            [Net.WebUtility]::HtmlEncode($Label)
        }
    }
}

Register-ArgumentCompleter -CommandName New-HTMLGauge -ParameterName Color -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLGauge -ParameterName TrackColor -ScriptBlock $Script:ScriptBlockColors
