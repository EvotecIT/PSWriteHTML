function New-HTMLTabOptions {
    [alias('TabOptions')]
    [CmdletBinding(DefaultParameterSetName = 'Manual')]
    param(
        [Parameter(ParameterSetName = 'Manual')][string] $TextSize,
        [Parameter(ParameterSetName = 'Manual')][string] $TextSizeActive,
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
        [Parameter(ParameterSetName = 'Manual')][string] $BorderBackgroundColor,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('uppercase', 'lowercase', 'capitalize')][string] $TextTransform,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('uppercase', 'lowercase', 'capitalize')][string] $TextTransformActive,

        [Parameter(ParameterSetName = 'Manual')][switch] $SlimTabs,
        [Parameter(ParameterSetName = 'Manual')][switch] $Transition,
        [Parameter(ParameterSetName = 'Manual')][switch] $LinearGradient,
        [Parameter(ParameterSetName = 'Manual')][switch] $RemoveShadow,

        [Parameter(ParameterSetName = 'Manual')][ValidateSet('medium', 'thin', 'thick')][string] $BorderBottomWidth,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset')][string] $BorderBottomStyle,
        [Parameter(ParameterSetName = 'Manual')][string] $BorderBottomColor,

        [Parameter(ParameterSetName = 'Manual')][ValidateSet('medium', 'thin', 'thick')][string] $BorderBottomWidthActive,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('none', 'hidden', 'dotted', 'dashed', 'solid', 'double', 'groove', 'ridge', 'inset', 'outset')][string] $BorderBottomStyleActive,
        [Parameter(ParameterSetName = 'Manual')][string] $BorderBottomColorActive,

        [Parameter(ParameterSetName = 'Styled')][string] $Style,

        [Parameter(ParameterSetName = 'Styled')]
        [Parameter(ParameterSetName = 'Manual')]
        [alias('AlignTabs')][ValidateSet('left', 'right', 'center', 'justify')][string] $Align

    )
    if (-not $Script:HTMLSchema) {
        Write-Warning 'New-HTMLTabOptions - Creation of HTML aborted. Most likely New-HTML is missing.'
        Exit
    }
    if ($BackgroundColorActive -and $BackgroundColorActiveTarget -and (-not $LinearGradient)) {
        Write-Warning "New-HTMLTabOptions - Using BackgroundColorActiveTarget without LinearGradient switch doesn't apply any changes."
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
        Add-ConfigurationCSS -CSS $TabbisCss -Name 'tabsSlimmer' -Inject $CssSlimTabs
    }

    # This controls All tabs
    $CssTabsWrapper = [ordered] @{
        'text-align'     = $Align
        'text-transform' = $TextTransform
        'font-size'      = ConvertFrom-FontSize -TextSize $TextSize
        'color'          = ConvertFrom-Color -Color $TextColor
    }

    # this will add configuration for tabsWrapper as it already exists
    # any new elements will be added, any existing elements will be overwritten
    # any existing elements that are not defined will not be touched
    Add-ConfigurationCSS -CSS $TabbisCss -Name 'tabsWrapper' -Inject $CssTabsWrapper

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

    $CssTabsBorderStyle = @{
        'border-radius'    = $BorderRadius
        'background-color' = ConvertFrom-Color -Color $BorderBackgroundColor
    }
    Add-ConfigurationCSS -CSS $TabbisCss -Name '[data-tabs]' -Inject $CssTabsBorderStyle

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
        Add-ConfigurationCSS -CSS $TabbisCss -Name '[data-tabs] .active' -Inject @{ 'font-size' = ConvertFrom-FontSize -TextSize $TextSizeActive }
    }
    if ($PSBoundParameters.ContainsKey('TextColorActive')) {
        Add-ConfigurationCSS -CSS $TabbisCss -Name '[data-tabs] .active' -Inject @{ 'color' = ConvertFrom-Color -Color $TextColorActive }
    }


    Add-ConfigurationCSS -CSS $TabbisCss -Name '.tabsWrapper' -Inject @{ 'font-weight' = $FontWeight }
    Add-ConfigurationCSS -CSS $TabbisCss -Name '.tabsWrapper' -Inject @{ 'font-style' = $FontStyle }
    Add-ConfigurationCSS -CSS $TabbisCss -Name '.tabsWrapper' -Inject @{ 'font-variant' = $FontVariant }
    Add-ConfigurationCSS -CSS $TabbisCss -Name '.tabsWrapper' -Inject @{ 'font-family' = $FontFamily }
    Add-ConfigurationCSS -CSS $TabbisCss -Name '.tabsWrapper' -Inject @{ 'text-decoration' = $TextDecoration }

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
        Write-Warning "New-HTMLTabOptions - You can't use BorderBottomColor or BorderBottomWidth without BorderBottomStyle."
    }
}

Register-ArgumentCompleter -CommandName New-HTMLTabOptions -ParameterName TextColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabOptions -ParameterName TextColorActive -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabOptions -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabOptions -ParameterName BackgroundColorActive -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabOptions -ParameterName BackgroundColorActiveTarget -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabOptions -ParameterName BorderBackgroundColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabOptions -ParameterName BorderBottomColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabOptions -ParameterName BorderBottomColorActive -ScriptBlock $Script:ScriptBlockColors