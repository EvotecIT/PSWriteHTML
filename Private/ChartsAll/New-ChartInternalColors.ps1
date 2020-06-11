function New-ChartInternalColors {
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [string[]]$Colors
    )

    if ($Colors.Count -gt 0) {
        $RGBColor = ConvertFrom-Color -Color $Colors
        $Options.colors = @($RGBColor)
    }
}
Register-ArgumentCompleter -CommandName New-ChartInternalColors -ParameterName Colors -ScriptBlock $Script:ScriptBlockColors