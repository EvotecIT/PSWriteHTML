function New-ChartInternalToolTip {
    <#
    .SYNOPSIS
    Creates a new internal tooltip for a chart.

    .DESCRIPTION
    This function creates a new internal tooltip for a chart with the specified options.

    .PARAMETER Options
    Specifies the options for the tooltip.

    .PARAMETER Enabled
    Indicates whether the tooltip is enabled.

    .PARAMETER y
    Specifies the y-coordinate for the tooltip.

    .PARAMETER x
    Specifies the x-coordinate for the tooltip.

    .EXAMPLE
    $tooltipOptions = @{
        tooltip = @{
            enabled = $true
            x = 10
            y = 20
        }
    }
    New-ChartInternalToolTip -Options $tooltipOptions -Enabled $true -x 10 -y 20
    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [bool] $Enabled,
        [System.Collections.IDictionary] $y,
        [System.Collections.IDictionary] $x

    )

    if (-not $Options.tooltip) {
        $Options.tooltip = @{}
    }
    $Options.tooltip.enabled = $Enabled
    $Options.tooltip.x = $x
    $Options.tooltip.y = $y

}