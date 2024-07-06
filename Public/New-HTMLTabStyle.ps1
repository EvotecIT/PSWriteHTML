function New-HTMLTabStyle {
    <#
    .SYNOPSIS
    Creates a new HTML tab style with customizable options.

    .DESCRIPTION
    This function allows you to define various styling options for HTML tabs, such as font size, color, weight, style, background color, border properties, and more.

    .PARAMETER FontSize
    Specifies the font size for the tabs.

    .PARAMETER FontSizeActive
    Specifies the font size for the active tab.

    .PARAMETER TextColor
    Specifies the text color for the tabs.

    .PARAMETER TextColorActive
    Specifies the text color for the active tab.

    .PARAMETER FontWeight
    Specifies the font weight for the tabs.

    .PARAMETER FontWeightActive
    Specifies the font weight for the active tab.

    .PARAMETER FontStyle
    Specifies the font style for the tabs.

    .PARAMETER FontStyleActive
    Specifies the font style for the active tab.

    .PARAMETER FontVariant
    Specifies the font variant for the tabs.

    .PARAMETER FontVariantActive
    Specifies the font variant for the active tab.

    .PARAMETER FontFamily
    Specifies the font family for the tabs.

    .PARAMETER FontFamilyActive
    Specifies the font family for the active tab.

    .PARAMETER TextDecoration
    Specifies the text decoration for the tabs.

    .PARAMETER TextDecorationActive
    Specifies the text decoration for the active tab.

    .PARAMETER BackgroundColor
    Specifies the background color for the tabs.

    .PARAMETER BackgroundColorActive
    Specifies the background color for the active tab.

    .PARAMETER BackgroundColorActiveTarget
    Specifies the background color for the active tab target.

    .PARAMETER BorderRadius
    Specifies the border radius for the tabs.

    .PARAMETER TextTransform
    Specifies the text transformation for the tabs.

    .PARAMETER TextTransformActive
    Specifies the text transformation for the active tab.

    .PARAMETER SlimTabs
    Indicates whether to use slim tabs.

    .PARAMETER Transition
    Indicates whether to apply transitions.

    .PARAMETER LinearGradient
    Indicates whether to use linear gradients.

    .PARAMETER RemoveShadow
    Indicates whether to remove shadows.

    .PARAMETER BorderStyle
    Specifies the border style for the tabs.

    .PARAMETER BorderColor
    Specifies the border color for the tabs.

    .PARAMETER BorderBottomWidth
    Specifies the bottom border width for the tabs.

    .PARAMETER BorderBottomStyle
    Specifies the bottom border style for the tabs.

    .PARAMETER BorderBottomColor
    Specifies the bottom border color for the tabs.

    .PARAMETER BorderBottomWidthActive
    Specifies the bottom border width for the active tab.

    .PARAMETER BorderBottomStyleActive
    Specifies the bottom border style for the active tab.

    .PARAMETER BorderBottomColorActive
    Specifies the bottom border color for the active tab.

    .PARAMETER Style
    Specifies a custom style for the tabs.

    .PARAMETER Align
    Specifies the alignment of the tabs.

    .PARAMETER Wrap
    Specifies the wrapping behavior of the tabs.

    .PARAMETER Direction
    Specifies the direction of the tabs.

    .EXAMPLE
    New-HTMLTabStyle -FontSize "14px" -FontSizeActive "16px" -TextColor "black" -TextColorActive "blue" -FontWeight "normal" -FontWeightActive "bold" -FontStyle "normal" -FontStyleActive "italic" -FontVariant "normal" -FontVariantActive "small-caps" -FontFamily "Arial" -FontFamilyActive "Verdana" -TextDecoration "none" -TextDecorationActive "underline" -BackgroundColor "#f0f0f0" -BackgroundColorActive "#e0e0e0" -BackgroundColorActiveTarget "#d0d0d0" -BorderRadius "5px" -TextTransform "uppercase" -TextTransformActive "lowercase" -SlimTabs -Transition -LinearGradient -RemoveShadow -BorderStyle "solid" -BorderColor "gray" -BorderBottomWidth "1px" -BorderBottomStyle "solid" -BorderBottomColor "gray" -BorderBottomWidthActive "2px" -BorderBottomStyleActive "dashed" -BorderBottomColorActive "blue" -Style "custom" -Align "center" -Wrap "wrap" -Direction "row"
    Creates a new HTML tab style with specified options.

    .EXAMPLE
    New-HTMLTabStyle -FontSize "12px" -FontSizeActive "14px" -TextColor "gray" -TextColorActive "black" -FontWeight "bold" -FontWeightActive "bolder" -FontStyle "italic" -FontStyleActive "oblique" -FontVariant "small-caps" -FontVariantActive "normal" -FontFamily "Verdana" -FontFamilyActive "Arial" -TextDecoration "underline" -TextDecorationActive "none" -BackgroundColor "#e0e0e0" -BackgroundColorActive "#f0f0f0" -BackgroundColorActiveTarget "#d0d0d0" -BorderRadius "10px" -TextTransform "capitalize" -TextTransformActive "uppercase" -SlimTabs -Transition -LinearGradient -RemoveShadow -BorderStyle "dotted" -BorderColor "black" -BorderBottomWidth "2px" -BorderBottomStyle "dashed" -BorderBottomColor "blue" -BorderBottomWidthActive "1px" -BorderBottomStyleActive "solid" -BorderBottomColorActive "gray" -Style "default" -Align "left" -Wrap "nowrap" -Direction "column"
    Creates another HTML tab style with different options.
    #>
    [alias('TabOptions', 'New-TabOption', 'New-HTMLTabOptions', 'TabOption', 'New-HTMLTabOption', 'TabStyle')]
    [CmdletBinding(DefaultParameterSetName = 'Manual')]
    param(
        [Parameter(ParameterSetName = 'Manual')][alias('TextSize')][string] $FontSize,
        [Parameter(ParameterSetName = 'Manual')][alias('TextSizeActive')][string] $FontSizeActive,
        [Parameter(ParameterSetName = 'Manual')][string] $TextColor,
        [Parameter(ParameterSetName = 'Manual')][string] $TextColorActive,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string] $FontWeight,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string] $FontWeightActive,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('normal', 'italic', 'oblique')][string] $FontStyle,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('normal', 'italic', 'oblique')][string] $FontStyleActive,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('normal', 'small-caps')][string] $FontVariant,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('normal', 'small-caps')][string] $FontVariantActive,
        [Parameter(ParameterSetName = 'Manual')][string] $FontFamily,
        [Parameter(ParameterSetName = 'Manual')][string] $FontFamilyActive,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('none', 'line-through', 'overline', 'underline')][string] $TextDecoration,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('none', 'line-through', 'overline', 'underline')][string] $TextDecorationActive,
        [Parameter(ParameterSetName = 'Manual')][string] $BackgroundColor,
        [Parameter(ParameterSetName = 'Manual')][alias('SelectorColor')][string] $BackgroundColorActive,
        [Parameter(ParameterSetName = 'Manual')][alias('SelectorColorTarget')][string] $BackgroundColorActiveTarget,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('0px', '5px', '10px', '15px', '20px', '25px')][string] $BorderRadius,

        [Parameter(ParameterSetName = 'Manual')][ValidateSet('uppercase', 'lowercase', 'capitalize')][string] $TextTransform,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('uppercase', 'lowercase', 'capitalize')][string] $TextTransformActive,

        [Parameter(ParameterSetName = 'Manual')][switch] $SlimTabs,
        [Parameter(ParameterSetName = 'Manual')][switch] $Transition,
        [Parameter(ParameterSetName = 'Manual')][switch] $LinearGradient,
        [Parameter(ParameterSetName = 'Manual')][switch] $RemoveShadow,

        [Parameter(ParameterSetName = 'Manual')][ValidateSet('none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset')][string] $BorderStyle,
        [Parameter(ParameterSetName = 'Manual')][string] $BorderColor,

        [Parameter(ParameterSetName = 'Manual')][ValidateSet('medium', 'thin', 'thick')][string] $BorderBottomWidth,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset')][string] $BorderBottomStyle,
        [Parameter(ParameterSetName = 'Manual')][string] $BorderBottomColor,

        [Parameter(ParameterSetName = 'Manual')][ValidateSet('medium', 'thin', 'thick')][string] $BorderBottomWidthActive,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset')][string] $BorderBottomStyleActive,
        [Parameter(ParameterSetName = 'Manual')][string] $BorderBottomColorActive,

        [Parameter(ParameterSetName = 'Styled')][string] $Style,

        [Parameter(ParameterSetName = 'Styled')]
        [Parameter(ParameterSetName = 'Manual')]
        [alias('AlignTabs')][ValidateSet('left', 'right', 'center', 'justify')][string] $Align,

        [string][ValidateSet('wrap', 'nowrap', 'wrap-reverse')] $Wrap,
        [string][ValidateSet('row', 'row-reverse', 'column', 'column-reverse')] $Direction,
        [string][ValidateSet('flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch')] $AlignContent,
        [string][ValidateSet('stretch', 'flex-start', 'flex-end', 'center', 'baseline')] $AlignItems,
        [string][ValidateSet('flex-start', 'flex-end', 'center')] $JustifyContent,
        [int] $RowElements

    )
    if (-not $Script:HTMLSchema) {
        Write-Warning 'New-HTMLTabStyle - Creation of HTML aborted. Most likely New-HTML is missing.'
        Exit
    }
    if ($BackgroundColorActive -and $BackgroundColorActiveTarget -and (-not $LinearGradient)) {
        Write-Warning "New-HTMLTabStyle - Using BackgroundColorActiveTarget without LinearGradient switch doesn't apply any changes."
    }

    # $Script:CurrentConfiguration.Features.Tabbis.HeaderAlways.CssInline
    # lets get original CSS configuration
    $TabbisCss = Get-ConfigurationCss -Feature 'Tabbis' -Type 'HeaderAlways'

    # We need to set defaults if it's not set
    if (-not $BackgroundColorActive) {
        $BackgroundColorActive = "DodgerBlue"
    }
    if (-not $BackgroundColorActiveTarget) {
        $BackgroundColorActiveTarget = "MediumSlateBlue"
    }

    # Converting colors to their HEX equivalent
    $BackGroundColorActiveSelector = ConvertFrom-Color -Color $BackgroundColorActive
    $BackGroundColorActiveSelectorTarget = ConvertFrom-Color -Color $BackgroundColorActiveTarget

    # This enables slimTabs
    if ($SlimTabs.IsPresent) {
        $CssSlimTabs = @{
            'display' = 'inline-block'
        }
        # Lets inject additional configuration into CSS
        Add-ConfigurationCSS -CSS $TabbisCss -Name '.tabsSlimmer' -Inject $CssSlimTabs
    }

    # This controls All Tabs
    $CssTabsWrapper = [ordered] @{
        'text-align'      = $Align
        'text-transform'  = $TextTransform
        'font-size'       = ConvertFrom-Size -TextSize $FontSize
        'color'           = ConvertFrom-Color -Color $TextColor
        #'background-color' = ConvertFrom-Color -Color $BackgroundColor
        'font-weight'     = $FontWeight
        'font-style'      = $FontStyle
        'font-variant'    = $FontVariant
        'font-family'     = $FontFamily
        'text-decoration' = $TextDecoration
    }

    # this will add configuration for tabsWrapper as it already exists
    # any new elements will be added, any existing elements will be overwritten
    # any existing elements that are not defined will not be touched
    Add-ConfigurationCSS -CSS $TabbisCss -Name '.tabsWrapper' -Inject $CssTabsWrapper

    # This controls All Tabs in [Data-Tabs] class
    $CssTabsData = @{
        'border-radius'    = $BorderRadius
        'border-style'     = $BorderStyle
        'border-color'     = ConvertFrom-Color -Color $BorderColor
        'background-color' = ConvertFrom-Color -Color $BackgroundColor
        'justify-content'  = $JustifyContent
        'flex-wrap'        = $Wrap
        'flex-direction'   = $Direction
        'align-content'    = $AlignContent
        'align-items'      = $AlignItems
    }
    Add-ConfigurationCSS -CSS $TabbisCss -Name '[data-tabs]' -Inject $CssTabsData


    # This controls Active tab
    $CssTabsActive = [ordered] @{
        'background'     = $BackGroundColorActiveSelector
        'color'          = '#fff'
        'border-radius'  = $BorderRadius
        'text-transform' = $TextTransformActive
    }

    Add-ConfigurationCSS -CSS $TabbisCss -Name '[data-tabs] .active' -Inject $CssTabsActive

    <#
    $CssTabsBorderStyle = @{
        'border-radius'    = "$BorderRadius";
        'background-color' = ConvertFrom-Color -Color $BorderBackgroundColor
    }
    Add-ConfigurationCSS -CSS $TabbisCss -Name 'tabsBorderStyle' -Inject $CssTabsBorderStyle
    #>

    #$CssBorderStyleRadius = @{
    #    'border-radius' = "$BorderRadius";
    #}
    #Add-ConfigurationCSS -CSS $TabbisCss -Name 'tabsBorderStyleRadius' -Inject $CssBorderStyleRadius

    # This adds Gradient
    if ($LinearGradient.IsPresent) {
        $CssTabbisGradient = [ordered] @{
            'background'   = "-moz-linear-gradient(45deg, $BackGroundColorActiveSelector 0%, $BackGroundColorActiveSelectorTarget 100%)"
            'background '  = "-webkit-linear-gradient(45deg, $BackGroundColorActiveSelector 0%, $BackGroundColorActiveSelectorTarget 100%)"
            'background  ' = "linear-gradient(45deg, $BackGroundColorActiveSelector 0%, $BackGroundColorActiveSelectorTarget 100%)"
            'filter'       = "progid:DXImageTransform.Microsoft.gradient(startColorstr='$BackGroundColorActiveSelector', endColorstr='$BackGroundColorActiveSelectorTarget', GradientType=1)"
        }
        Add-ConfigurationCSS -CSS $TabbisCss -Name '[data-tabs] .active' -Inject $CssTabbisGradient
    }

    # This adds Transition
    if ($Transition.IsPresent) {
        $CssTabbisTransition = [ordered] @{
            'transition-duration'        = '0.6s'
            'transition-timing-function' = 'cubic-bezier(0.68, -0.55, 0.265, 1.55)'
        }
        Add-ConfigurationCSS -CSS $TabbisCss -Name '[data-tabs] .active' -Inject $CssTabbisTransition
    }

    if ($BackgroundColorActive -eq 'none') {
        Remove-ConfigurationCSS -CSS $TabbisCss -Name '[data-tabs] .active' -Property 'background'
    }
    if ($RemoveShadow.IsPresent) {
        Remove-ConfigurationCSS -CSS $TabbisCss -Name '[data-tabs]' -Property 'box-shadow'
    }
    if ($PSBoundParameters.ContainsKey('TextSizeActive')) {
        Add-ConfigurationCSS -CSS $TabbisCss -Name '[data-tabs] .active' -Inject @{ 'font-size' = ConvertFrom-Size -TextSize $FontSizeActive }
    }
    if ($PSBoundParameters.ContainsKey('TextColorActive')) {
        Add-ConfigurationCSS -CSS $TabbisCss -Name '[data-tabs] .active' -Inject @{ 'color' = ConvertFrom-Color -Color $TextColorActive }
    }



    #Add-ConfigurationCSS -CSS $TabbisCss -Name '.tabsWrapper' -Inject @{ 'font-weight' = $FontWeight }
    #Add-ConfigurationCSS -CSS $TabbisCss -Name '.tabsWrapper' -Inject @{ 'font-style' = $FontStyle }
    #Add-ConfigurationCSS -CSS $TabbisCss -Name '.tabsWrapper' -Inject @{ 'font-variant' = $FontVariant }
    #Add-ConfigurationCSS -CSS $TabbisCss -Name '.tabsWrapper' -Inject @{ 'font-family' = $FontFamily }
    #Add-ConfigurationCSS -CSS $TabbisCss -Name '.tabsWrapper' -Inject @{ 'text-decoration' = $TextDecoration }

    Add-ConfigurationCSS -CSS $TabbisCss -Name '[data-tabs] .active' -Inject @{ 'font-weight' = $FontWeightActive }
    Add-ConfigurationCSS -CSS $TabbisCss -Name '[data-tabs] .active' -Inject @{ 'font-style' = $FontStyleActive }
    Add-ConfigurationCSS -CSS $TabbisCss -Name '[data-tabs] .active' -Inject @{ 'font-variant' = $FontVariantActive }
    Add-ConfigurationCSS -CSS $TabbisCss -Name '[data-tabs] .active' -Inject @{ 'font-family' = $FontFamilyActive }
    Add-ConfigurationCSS -CSS $TabbisCss -Name '[data-tabs] .active' -Inject @{ 'text-decoration' = $TextDecorationActive }

    Add-ConfigurationCSS -CSS $TabbisCss -Name '[data-tabs] .active' -Inject @{ 'border-bottom-style' = $BorderBottomStyleActive }
    Add-ConfigurationCSS -CSS $TabbisCss -Name '[data-tabs] .active' -Inject @{ 'border-bottom-width' = $BorderBottomWidthActive }
    Add-ConfigurationCSS -CSS $TabbisCss -Name '[data-tabs] .active' -Inject @{ 'border-bottom-color' = ConvertFrom-Color -Color $BorderBottomColorActive }

    if ($BorderBottomStyle) {
        Add-ConfigurationCSS -CSS $TabbisCss -Name '[data-tabs]>*' -Inject @{ 'border-bottom-style' = $BorderBottomStyle }
        Add-ConfigurationCSS -CSS $TabbisCss -Name '[data-tabs]>*' -Inject @{ 'border-bottom-width' = $BorderBottomWidth }
        Add-ConfigurationCSS -CSS $TabbisCss -Name '[data-tabs]>*' -Inject @{ 'border-bottom-color' = ConvertFrom-Color -Color $BorderBottomColor }
    } elseif ($BorderBottomColor -or $BorderBottomWidth) {
        Write-Warning "New-HTMLTabStyle - You can't use BorderBottomColor or BorderBottomWidth without BorderBottomStyle."
    }

    if ($RowElements) {
        Add-ConfigurationCSS -CSS $TabbisCss -Name '[data-tabs]>*' -Inject @{ 'flex-basis' = "calc(80%/$RowElements)" }
    }
}

Register-ArgumentCompleter -CommandName New-HTMLTabStyle -ParameterName TextColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabStyle -ParameterName TextColorActive -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabStyle -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabStyle -ParameterName BackgroundColorActive -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabStyle -ParameterName BackgroundColorActiveTarget -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabStyle -ParameterName BorderColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabStyle -ParameterName BorderBottomColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabStyle -ParameterName BorderBottomColorActive -ScriptBlock $Script:ScriptBlockColors