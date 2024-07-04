function New-ChartInternalDataLabels {
    <#
    .SYNOPSIS
    Creates a new internal data labels configuration for a chart with the specified settings.

    .DESCRIPTION
    This function creates a new internal data labels configuration for a chart with the provided options. It allows customization of the data labels appearance and behavior.

    .PARAMETER Options
    Specifies the options for configuring the internal data labels. This should be a dictionary containing the necessary settings for the data labels.

    .PARAMETER DataLabelsEnabled
    Specifies whether data labels should be enabled on the chart.

    .PARAMETER DataLabelsOffsetX
    Specifies the horizontal offset for the data labels.

    .PARAMETER DataLabelsFontSize
    Specifies the font size for the data labels.

    .PARAMETER DataLabelsColor
    Specifies the color for the data labels.

    .EXAMPLE
    $dataLabelsOptions = @{
        dataLabelsEnabled = $true
        dataLabelsOffsetX = -6
        dataLabelsFontSize = '12px'
        dataLabelsColor = @('#FF5733', '#33FF57', '#3357FF')
    }
    New-ChartInternalDataLabels -Options $dataLabelsOptions

    Creates a new internal data labels configuration with data labels enabled, a horizontal offset of -6, a font size of '12px', and color palette containing colors '#FF5733', '#33FF57', and '#3357FF'.
    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [bool] $DataLabelsEnabled,
        [int] $DataLabelsOffsetX,
        [string] $DataLabelsFontSize,
        [string[]] $DataLabelsColor
    )

    $Options.dataLabels = [ordered] @{
        enabled = $DataLabelsEnabled
        offsetX = $DataLabelsOffsetX
        style   = @{
            fontSize = $DataLabelsFontSize
        }
    }
    if ($DataLabelsColor.Count -gt 0) {
        $Options.dataLabels.style.colors = @(ConvertFrom-Color -Color $DataLabelsColor)
    }
}
Register-ArgumentCompleter -CommandName New-ChartInternalDataLabels -ParameterName DataLabelsColors -ScriptBlock $Script:ScriptBlockColors