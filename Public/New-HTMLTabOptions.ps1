function New-HTMLTabOptions {
    [alias('TabOptions')]
    [CmdletBinding()]
    param(
        [string] $TextSize,
        [string] $TextColor,
        #[string] $TextSizeActive,
        #[string] $TextColorActive,
        [switch] $SlimTabs,
        [string] $BackgroundColor,
        [alias('SelectorColor')][string] $BackgroundColorActive,
        [alias('SelectorColorTarget')][string] $BackgroundColorActiveTarget,
        [switch] $Transition,
        [switch] $LinearGradient,
        [ValidateSet('0px', '10px', '15px', '25px')][string] $BorderRadius,
        [string] $BorderBackgroundColor,

        [ValidateSet('left', 'right', 'center', 'justify')][string] $Align,
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string] $TextTransformAllTab,
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string] $TextTransformActiveTab

    )
    if (-not $Script:HTMLSchema) {
        Write-Warning 'New-HTMLTabOptions - Creation of HTML aborted. Most likely New-HTML is missing.'
        Exit
    }
    if ($BackgroundColorActive -and $BackgroundColorActiveTarget -and (-not $LinearGradient)) {
        Write-Warning "New-HTMLTabOptions - Using BackgroundColorActiveTarget without LinearGradient switch doesn't apply any changes."
    }

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
    #$Script:HTMLSchema.TabOptions.SlimTabs = $SlimTabs.IsPresent

    if ($SlimTabs.IsPresent) {
        $AttributesSlimTabs = @{
            'display' = 'inline-block'
        }
        $SlimTabsCss = ConvertTo-LimitedCSS -ClassName 'tabsSlimmer' -Attributes $AttributesSlimTabs
        $Script:HTMLSchema.CustomHeaderCSS.Add($SlimTabsCss)
    }

    # This controls All tabs
    $AttributesAll = [ordered] @{
        'text-align'     = $Align
        'text-transform' = $TextTransformAllTab
        'font-size'      = ConvertFrom-FontSize -TextSize $TextSize
        'color'          = ConvertFrom-Color -Color $TextColor
    }
    $Tabbis = ConvertTo-LimitedCSS -ClassName 'tabsWrapper' -Attributes $AttributesAll
    $Script:HTMLSchema.CustomHeaderCSS.Add($Tabbis)

    # This controls Active tab
    $AttributesDefault = [ordered] @{
        'background'     = $BackGroundColorActiveSelector
        'color'          = '#fff'
        'border-radius'  = $BorderRadius
        'text-transform' = $TextTransformActiveTab
    }
    $Tabbis = ConvertTo-LimitedCSS -ClassName '[data-tabs] .active' -Attributes $AttributesDefault
    $Script:HTMLSchema.CustomHeaderCSS.Add($Tabbis)

    # This adds styling in new New-HTMLTabHead for all tabs
    <#
    $Script:BorderStyle = @{
        'border-radius' = "$BorderRadius";
        #'background-color' = ""
    }
    if ($BorderBackgroundColor) {
        $Script:BorderStyle.'background-color' = ConvertFrom-Color -Color $BorderBackgroundColor
    }
    #>


    $BorderStyle = @{
        'border-radius'    = "$BorderRadius";
        'background-color' = ConvertFrom-Color -Color $BorderBackgroundColor
    }
    $BorderStyleCss = ConvertTo-LimitedCSS -ClassName 'tabsBorderStyle' -Attributes $BorderStyle
    $Script:HTMLSchema.CustomHeaderCSS.Add($BorderStyleCss)


    $BorderStyleRadius = @{
        'border-radius' = "$BorderRadius";
    }
    $BorderStyleCss = ConvertTo-LimitedCSS -ClassName 'tabsBorderStyleRadius' -Attributes $BorderStyleRadius
    $Script:HTMLSchema.CustomHeaderCSS.Add($BorderStyleCss)

    # This adds Gradient
    if ($LinearGradient.IsPresent) {
        $AttributesGradient = [ordered] @{
            'background'   = "-moz-linear-gradient(45deg, $BackGroundColorActiveSelector 0%, $BackGroundColorActiveSelectorTarget 100%)"
            'background '  = "-webkit-linear-gradient(45deg, $BackGroundColorActiveSelector 0%, $BackGroundColorActiveSelectorTarget 100%)"
            'background  ' = "linear-gradient(45deg, $BackGroundColorActiveSelector 0%, $BackGroundColorActiveSelectorTarget 100%)"
            'filter'       = "progid:DXImageTransform.Microsoft.gradient(startColorstr='$BackGroundColorActiveSelector', endColorstr='$BackGroundColorActiveSelectorTarget', GradientType=1)"
        }
        $TabbisGradient = ConvertTo-LimitedCSS -ClassName '[data-tabs] .active' -Attributes $AttributesGradient
        $Script:HTMLSchema.CustomHeaderCSS.Add($TabbisGradient)
    }

    # This adds Transition
    if ($Transition.IsPresent) {
        $AttributesTransition = [ordered] @{
            'transition-duration'        = '0.6s'
            'transition-timing-function' = 'cubic-bezier(0.68, -0.55, 0.265, 1.55)'
        }
        $TabbisTransition = ConvertTo-LimitedCSS -ClassName '[data-tabs] .active' -Attributes $AttributesTransition
        $Script:HTMLSchema.CustomHeaderCSS.Add($TabbisTransition)
    }
}

Register-ArgumentCompleter -CommandName New-HTMLTabOptions -ParameterName SelectorColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabOptions -ParameterName SelectorColorTarget -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabOptions -ParameterName BorderBackgroundColor -ScriptBlock $Script:ScriptBlockColors
