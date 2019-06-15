function New-ChartBarOptions {
    [alias('ChartBarOptions')]
    [CmdletBinding()]
    param(
        [ValidateSet('bar', 'barStacked', 'barStacked100Percent')] $Type = 'bar',
        [bool] $DataLabelsEnabled = $true,
        [int] $DataLabelsOffsetX = -6,
        [string] $DataLabelsFontSize = '12px',
        [nullable[RGBColors]] $DataLabelsColor,
        [alias('PatternedColors')][switch] $Patterned,
        [switch] $Distributed,
        [switch] $Vertical

    )
    [PSCustomObject] @{
        ObjectType         = 'BarOptions'
        Type               = $Type
        Title              = $Title
        TitleAlignment     = $TitleAlignment
        Horizontal         = -not $Vertical.IsPresent
        DataLabelsEnabled  = $DataLabelsEnabled
        DataLabelsOffsetX  = $DataLabelsOffsetX
        DataLabelsFontSize = $DataLabelsFontSize
        DataLabelsColor    = $DataLabelsColor
        PatternedColors    = $Patterned.IsPresent
        Distributed        = $Distributed.IsPresent
    }
}