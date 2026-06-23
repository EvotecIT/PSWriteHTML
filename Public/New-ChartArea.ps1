function New-ChartArea {
    <#
    .SYNOPSIS
    Adds an area series to a chart.

    .DESCRIPTION
    Adds an ApexCharts area series. Use New-ChartAxisX to provide categories,
    datetime values, or numeric axis settings when needed.

    .PARAMETER Name
    Name of the area series.

    .PARAMETER Value
    Values to display in the area series.

    .PARAMETER Color
    Series color.

    .PARAMETER Curve
    Stroke curve style.

    .PARAMETER Width
    Stroke width.

    .PARAMETER Cap
    Stroke cap style.

    .PARAMETER Dash
    Stroke dash spacing.

    .EXAMPLE
    New-ChartArea -Name 'Revenue' -Value 10, 20, 18 -Color Blue -Curve smooth
    #>
    [alias('ChartArea')]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][string] $Name,
        [Parameter(Mandatory)][object] $Value,
        [string] $Color,
        [ValidateSet('straight', 'smooth', 'stepline')] $Curve,
        [System.Nullable[int]] $Width,
        [ValidateSet('butt', 'square', 'round')][string] $Cap,
        [System.Nullable[int]] $Dash
    )

    $Object = [PSCustomObject] @{
        ObjectType = 'Area'
        Name       = $Name
        Value      = $Value
        Color      = ConvertFrom-Color -Color $Color
        series     = [ordered] @{
            name = $Name
            type = 'area'
            data = @($Value)
        }
        stroke     = [ordered] @{
            curve     = $Curve
            lineCap   = $Cap
            width     = $Width
            dashArray = $Dash
        }
    }
    Remove-EmptyValue -Hashtable $Object.Series
    Remove-EmptyValue -Hashtable $Object.Stroke
    $Object
}

Register-ArgumentCompleter -CommandName New-ChartArea -ParameterName Color -ScriptBlock $Script:ScriptBlockColors
