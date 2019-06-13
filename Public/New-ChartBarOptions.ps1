function New-ChartBarOptions {
    [alias('ChartBarOptions')]
    [CmdletBinding()]
    param(
        [ValidateSet('bar', 'barStacked', 'barStacked100Percent')] $Type = 'bar',
        [bool] $Horizontal = $true,
        [bool] $DataLabelsEnabled = $true,
        [int] $DataLabelsOffsetX = -6,
        [string] $DataLabelsFontSize = '12px',
        [nullable[RGBColors]] $DataLabelsColor,
        [switch] $PatternedColors,
        [switch] $Distributed

    )
    [PSCustomObject] @{
        ObjectType         = 'BarOptions'
        Type               = $Type
        Title              = $Title
        TitleAlignment     = $TitleAlignment
        Horizontal         = $Horizontal
        DataLabelsEnabled  = $DataLabelsEnabled
        DataLabelsOffsetX  = $DataLabelsOffsetX
        DataLabelsFontSize = $DataLabelsFontSize
        DataLabelsColor    = $DataLabelsColor
        PatternedColors    = $PatternedColors.IsPresent
        Distributed        = $Distributed.IsPresent
    }
}