function New-ChartInternalDataLabels {
    [cmdletBinding()]
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