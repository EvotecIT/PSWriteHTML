function New-ChartDataLabel {
    <#
    .SYNOPSIS
    Configures DataLabels for Charts

    .DESCRIPTION
    Configures DataLabels for Charts

    .PARAMETER Enabled
    To determine whether to show dataLabels or not

    .PARAMETER TextAnchor
    The alignment of text relative to dataLabel’s drawing position. Accepted values: start, middle, end

    .PARAMETER Distributed
    Similar to plotOptions.bar.distributed, this option makes each data-label discrete. So, when you provide an array of colors in datalabels.style.colors, the index in the colors array correlates with individual data-label index of all series.

    .PARAMETER OffsetX
    Sets the left offset for dataLabels

    .PARAMETER OffsetY
    Sets the top offset for dataLabels

    .PARAMETER FontSize
    FontSize for the label

    .PARAMETER FontFamily
    FontFamily for the label

    .PARAMETER FontColor
    FontColors for the dataLabels. Accepts an array of string colors. Each index in the array corresponds to the series

    .EXAMPLE
    An example

    .NOTES
    General notes
    #>
    [cmdletBinding()]
    param(
        [switch] $Enabled,
        [ValidateSet('start', 'middle', 'end')][string] $TextAnchor,
        [switch] $Distributed,
        [alias('DataLabelsOffsetX')][nullable[int]] $OffsetX,
        [nullable[int]] $OffsetY,
        [alias('DataLabelsFontSize')][object] $FontSize,
        [string] $FontFamily,
        [alias('DataLabelsColor')][string[]] $FontColor

    )

    $Object = [PSCustomObject] @{
        ObjectType = 'DataLabel'
        DataLabel  = [ordered] @{
            enabled = $Enabled.IsPresent
        }
    }
    if ($TextAnchor) {
        $Object.DataLabel.textAnchor = $TextAnchor
    }
    if ($Distributed) {
        $Object.DataLabel.distributed = $Distributed.IsPresent
    }

    if ($null -ne $OffsetX) {
        $Object['DataLabel']['offsetX'] = $OffsetX
    }
    if ($null -ne $OffsetX) {
        $Object['DataLabel']['offsetX'] = $OffsetY
    }
    $Object.DataLabel.style = [ordered]@{}
    if ($FontSize) {
        $Object.DataLabel.style['fontSize'] = ConvertFrom-Size -Size $FontSize
    }
    if ($FontFamily) {
        $Object.DataLabel.style['fontFamily'] = $FontFamily
    }
    if ($DataLabelsColor.Count -gt 0) {
        $Object.DataLabel.style['colors'] = @(ConvertFrom-Color -Color $FontColor)
    }
    Remove-EmptyValue -Hashtable $Object.DataLabel -Recursive
    $Object
}

Register-ArgumentCompleter -CommandName New-ChartDataLabel -ParameterName DataLabelsColor -ScriptBlock $Script:ScriptBlockColors