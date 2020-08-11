function New-HTMLSectionOptions {
    [cmdletBinding()]
    param(
        [string] $ClassName,

        [Parameter(ParameterSetName = 'Manual')][ValidateSet('0px', '5px', '10px', '15px', '20px', '25px')][string] $BorderRadius,
        [Parameter(ParameterSetName = 'Manual')][switch] $RemoveShadow,
        [Parameter(ParameterSetName = 'Manual')][alias('TextColor')][string]$HeaderTextColor,
        [Parameter(ParameterSetName = 'Manual')][alias('TextAlignment')][string][ValidateSet('center', 'left', 'right', 'justify')] $HeaderTextAlignment,
        [Parameter(ParameterSetName = 'Manual')][alias('TextBackGroundColor')][string]$HeaderBackGroundColor,

        [Parameter(ParameterSetName = 'Manual')][alias('BackgroundShade')][string]$BackgroundColor,


        [Parameter(ParameterSetName = 'Manual')][string][ValidateSet('wrap', 'nowrap', 'wrap-reverse')] $Wrap,
        [Parameter(ParameterSetName = 'Manual')][string][ValidateSet('row', 'row-reverse', 'column', 'column-reverse')] $Direction,
        [Parameter(ParameterSetName = 'Manual')][string][ValidateSet('flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch')] $AlignContent,
        [Parameter(ParameterSetName = 'Manual')][string][ValidateSet('stretch', 'flex-start', 'flex-end', 'center', 'baseline')] $AlignItems,
        [Parameter(ParameterSetName = 'Manual')][string][ValidateSet('flex-start', 'flex-end', 'center')] $JustifyContent,

        [ValidateSet('vertical-rl', 'vertical-lr', 'horizontal-tb')][string] $WritingMode,
        [ValidateSet('mixed', 'upright')][string] $TextOrientation
    )
    # lets get original CSS configuration
    $CssConfiguration = Get-ConfigurationCss -Feature 'Default' -Type 'HeaderAlways'
    if ($RemoveShadow) {
        Remove-ConfigurationCSS -CSS $CssConfiguration -Name 'defaultSection' -Property 'box-shadow'
    }
    Add-ConfigurationCSS -CSS $CssConfiguration -Name 'defaultSection' -Inject @{ 'border-radius' = $BorderRadius }

    $DivHeaderStyle = @{
        "text-align"       = $HeaderTextAlignment
        "background-color" = ConvertFrom-Color -Color $HeaderBackGroundColor
    }

    Add-ConfigurationCSS -CSS $CssConfiguration -Name 'defaultSection' -Inject $DivHeaderStyle

    $DivContentStyle = @{
        "background-color" = ConvertFrom-Color -Color $BackgroundColor
    }

    Add-ConfigurationCSS -CSS $CssConfiguration -Name 'defaultSection' -Inject $DivContentStyle

    # This allows to control how the text looks like

    if ($Wrap -or $Direction -or $AlignContent -or $AlignItems) {
        Add-ConfigurationCSS -CSS $CssConfiguration -Name 'defaultSection' -Inject @{ display = 'flex' }
    }

    Add-ConfigurationCSS -CSS $CssConfiguration -Name 'defaultSectionText' -Inject @{ 'writing-mode' = $WritingMode }
    Add-ConfigurationCSS -CSS $CssConfiguration -Name 'defaultSectionText' -Inject @{ 'text-orientation' = $TextOrientation }

    $DivLocationStyle = @{
        'flex-wrap'      = if ($Wrap) { $Wrap } else { }
        'flex-direction' = if ($Direction) { $Direction } else { }
        'align-content'  = if ($AlignContent) { $AlignContent } else { }
        'align-items'    = if ($AlignItems) { $AlignItems } else { }
    }
    Add-ConfigurationCSS -CSS $CssConfiguration -Name 'defaultSection' -Inject $DivLocationStyle
}