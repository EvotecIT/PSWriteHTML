function New-ChartDataLabel {
    [cmdletBinding()]
    param(
        [switch] $Enabled,
        [int] $DataLabelsOffsetX,
        [string] $DataLabelsFontSize,
        [string[]] $DataLabelsColor
    )

    $Object = [PSCustomObject] @{
        ObjectType = 'DataLabel'
        DataLabel  = [ordered] @{
            enabled = $Enabled.IsPresent
        }
    }
    if ($DataLabelsOffsetX) {
        $Object['DataLabel']['offsetX'] = $DataLabelsOffsetX
    }
    $Object.DataLabel.style = [ordered]@{}
    if ($DataLabelsFontSize) {
        $Object.DataLabel.style['fontSize'] = $DataLabelsFontSize
    }
    if ($DataLabelsColor.Count -gt 0) {
        $Object.DataLabel.style['colors'] = @(ConvertFrom-Color -Color $DataLabelsColor)
    }
    Remove-EmptyValue -Hashtable $Object.DataLabel -Recursive
    $Object
}

Register-ArgumentCompleter -CommandName New-ChartDataLabel -ParameterName DataLabelsColor -ScriptBlock $Script:ScriptBlockColors