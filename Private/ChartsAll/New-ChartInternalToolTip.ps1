function New-ChartInternalToolTip {
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [nullable[bool]] $Enabled,
        [System.Collections.IDictionary] $y,
        [System.Collections.IDictionary] $x

    )

    if (-not $Options.tooltip) {
        $Options.tooltip = [ordered] @{}
    }
    $Options.tooltip.enabled = $Enabled
    $Options.tooltip.x = $x
    $Options.tooltip.y = $y
}