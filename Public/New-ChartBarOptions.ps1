function New-ChartBarOptions {
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

Register-ArgumentCompleter -CommandName New-ChartBarOptions -ParameterName LineColor -ScriptBlock $Script:ScriptBlockColors