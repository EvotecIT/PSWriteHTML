function New-ChartInternalColors {
    <#
    .SYNOPSIS
    Creates a new internal color configuration for a chart with the specified color palette.

    .DESCRIPTION
    This function creates a new internal color configuration for a chart with the provided color palette. It allows customization of the colors used in the chart.

    .PARAMETER Options
    Specifies the options for configuring the color palette. This should be a dictionary containing the necessary settings for the colors.

    .PARAMETER Colors
    Specifies an array of colors to be used in the chart.

    .EXAMPLE
    $colorOptions = @{
        colors = @('#FF5733', '#33FF57', '#3357FF')
    }
    $colorPalette = @('#FF5733', '#33FF57', '#3357FF')
    New-ChartInternalColors -Options $colorOptions -Colors $colorPalette

    Creates a new internal color configuration with a color palette containing colors '#FF5733', '#33FF57', and '#3357FF' to be used in the chart.
    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [string[]]$Colors
    )

    if ($Colors.Count -gt 0) {
        #$RGBColor = ConvertFrom-Color -Color $Colors
        $Options.colors = @($Colors)
    }
}
Register-ArgumentCompleter -CommandName New-ChartInternalColors -ParameterName Colors -ScriptBlock $Script:ScriptBlockColors