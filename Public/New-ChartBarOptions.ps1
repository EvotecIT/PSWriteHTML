function New-ChartBarOptions {
    <#
    .SYNOPSIS
    Creates options for a bar chart with customizable parameters.

    .DESCRIPTION
    This function creates options for a bar chart with the provided parameters. It allows customization of the bar type, data labels, colors, patterns, gradients, and distribution.

    .PARAMETER Type
    The type of the bar chart. Accepted values are 'bar', 'barStacked', 'barStacked100Percent'. Default is 'bar'.

    .PARAMETER DataLabelsEnabled
    Indicates whether data labels are enabled. Default is $true.

    .PARAMETER DataLabelsOffsetX
    The horizontal offset of the data labels. Default is -6.

    .PARAMETER DataLabelsFontSize
    The font size of the data labels. Default is '12px'.

    .PARAMETER DataLabelsColor
    The color of the data labels.

    .PARAMETER Patterned
    Indicates whether patterned colors are used.

    .PARAMETER Gradient
    Indicates whether gradient colors are used.

    .PARAMETER Distributed
    Indicates whether the bars are distributed.

    .PARAMETER Vertical
    Indicates whether the bars are vertical.

    .EXAMPLE
    New-ChartBarOptions -Type 'barStacked' -DataLabelsEnabled $true -DataLabelsOffsetX -6 -DataLabelsFontSize '12px' -DataLabelsColor 'black' -Patterned -Distributed

    Creates options for a stacked bar chart with data labels enabled, offset of -6, font size '12px', black data labels, patterned colors, and distributed bars.

    .EXAMPLE
    New-ChartBarOptions -Type 'bar' -DataLabelsEnabled $false -Gradient -Vertical

    Creates options for a regular bar chart with data labels disabled, gradient colors, and vertical bars.
    #>
    [alias('ChartBarOptions')]
    [CmdletBinding()]
    param(
        [ValidateSet('bar', 'barStacked', 'barStacked100Percent')] $Type = 'bar',
        [bool] $DataLabelsEnabled = $true,
        [int] $DataLabelsOffsetX = -6,
        [string] $DataLabelsFontSize = '12px',
        [string] $DataLabelsColor,
        [alias('PatternedColors')][switch] $Patterned,
        [alias('GradientColors')][switch] $Gradient,
        [switch] $Distributed,
        [switch] $Vertical

    )

    if ($null -ne $PSBoundParameters.Patterned) {
        $PatternedColors = $Patterned.IsPresent
    } else {
        $PatternedColors = $null
    }
    if ($null -ne $PSBoundParameters.Gradient) {
        $GradientColors = $Gradient.IsPresent
    } else {
        $GradientColors = $null
    }

    [PSCustomObject] @{
        ObjectType         = 'BarOptions'
        Type               = $Type
        Horizontal         = -not $Vertical.IsPresent
        DataLabelsEnabled  = $DataLabelsEnabled
        DataLabelsOffsetX  = $DataLabelsOffsetX
        DataLabelsFontSize = $DataLabelsFontSize
        DataLabelsColor    = $DataLabelsColor
        PatternedColors    = $PatternedColors
        GradientColors     = $GradientColors
        Distributed        = $Distributed.IsPresent
    }
}

Register-ArgumentCompleter -CommandName New-ChartBarOptions -ParameterName DataLabelsColor -ScriptBlock $Script:ScriptBlockColors