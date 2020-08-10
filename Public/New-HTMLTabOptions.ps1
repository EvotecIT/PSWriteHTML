function New-HTMLTabOptions {
    [alias('TabOptions')]
    [CmdletBinding()]
    param(
        [switch] $SlimTabs,
        [string] $SelectorColor,
        [string] $SelectorColorTarget,
        [switch] $Transition,
        [switch] $LinearGradient,
        [ValidateSet('0px', '10px', '15px', '25px')][string] $BorderRadius = '0px',
        [string] $BorderBackgroundColor,

        [ValidateSet('left', 'right', 'center', 'justify')][string] $TextAlign,
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string] $TextTransformAllTab,
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string] $TextTransformActiveTab

    )
    if (-not $Script:HTMLSchema) {
        Write-Warning 'New-HTMLTabOptions - Creation of HTML aborted. Most likely New-HTML is missing.'
        Exit
    }
    # We need to set defaults if it's not set
    if (-not $SelectorColor) {
        $SelectorColor = "DodgerBlue"
    }
    if (-not $SelectorColorTarget) {
        $SelectorColorTarget = "MediumSlateBlue"
    }
    # Converting colors to their HEX equivalent
    $ColorSelector = ConvertFrom-Color -Color $SelectorColor
    $ColorTarget = ConvertFrom-Color -Color $SelectorColorTarget

    # This enables slimTabs
    $Script:HTMLSchema.TabOptions.SlimTabs = $SlimTabs.IsPresent
    <#
    if ($SlimTabs.IsPresent) {
        $AttributesSlimTabs = @{
            'display' = 'inline-block'
        }
        $SlimTabsCss = ConvertTo-CSS -ClassName 'tabsSlimmer' -Attributes $AttributesSlimTabs
        $Script:HTMLSchema.CustomHeaderCSS.Add($SlimTabsCss)
    }
    #>

    # This controls All tabs
    $AttributesAll = [ordered] @{
        'text-align'     = $TextAlign
        'text-transform' = $TextTransformAllTab
    }
    Remove-EmptyValue -Hashtable $AttributesAll
    $Tabbis = ConvertTo-CSS -ClassName 'tabsWrapper' -Attributes $AttributesAll
    $Script:HTMLSchema.CustomHeaderCSS.Add($Tabbis)

    # This controls Active tab
    $AttributesDefault = [ordered] @{
        'background'     = $ColorSelector
        'color'          = '#fff'
        'border-radius'  = '4px'
        'text-transform' = $TextTransformActiveTab
    }
    Remove-EmptyValue -Hashtable $AttributesDefault
    $Tabbis = ConvertTo-CSS -ClassName '[data-tabs] .active' -Attributes $AttributesDefault
    $Script:HTMLSchema.CustomHeaderCSS.Add($Tabbis)

    # This adds styling in new New-HTMLTabHead for all tabs

    $Script:BorderStyle = @{
        'border-radius' = "$BorderRadius";
        #'background-color' = ""
    }
    if ($BorderBackgroundColor) {
        $Script:BorderStyle.'background-color' = ConvertFrom-Color -Color $BorderBackgroundColor
    }

    <#
    $BorderStyle = @{
        'border-radius'    = "$BorderRadius";
        'background-color' = ConvertFrom-Color -Color $BorderBackgroundColor
    }
    $BorderStyleCss = ConvertTo-CSS -ClassName 'tabsBorderStyle' -Attributes $BorderStyle
    $Script:HTMLSchema.CustomHeaderCSS.Add($BorderStyleCss)


    $BorderStyleRadius = @{
        'border-radius'    = "$BorderRadius";
    }
    $BorderStyleCss = ConvertTo-CSS -ClassName 'tabsBorderStyleRadius' -Attributes $BorderStyleRadius
    $Script:HTMLSchema.CustomHeaderCSS.Add($BorderStyleCss)
    #>
    # This adds Gradient
    if ($LinearGradient.IsPresent) {
        $AttributesGradient = [ordered] @{
            'background'   = "-moz-linear-gradient(45deg, $ColorSelector 0%, $ColorTarget 100%)"
            'background '  = "-webkit-linear-gradient(45deg, $ColorSelector 0%, $ColorTarget 100%)"
            'background  ' = "linear-gradient(45deg, $ColorSelector 0%, $ColorTarget 100%)"
            'filter'       = "progid:DXImageTransform.Microsoft.gradient(startColorstr='$ColorSelector', endColorstr='$ColorTarget', GradientType=1)"
        }
        $TabbisGradient = ConvertTo-CSS -ClassName '[data-tabs] .active' -Attributes $AttributesGradient
        $Script:HTMLSchema.CustomHeaderCSS.Add($TabbisGradient)
    }

    # This adds Transition
    if ($Transition.IsPresent) {
        $AttributesTransition = [ordered] @{
            'transition-duration'        = '0.6s'
            'transition-timing-function' = 'cubic-bezier(0.68, -0.55, 0.265, 1.55)'
        }
        $TabbisTransition = ConvertTo-CSS -ClassName '[data-tabs] .active' -Attributes $AttributesTransition
        $Script:HTMLSchema.CustomHeaderCSS.Add($TabbisTransition)
    }
}

Register-ArgumentCompleter -CommandName New-HTMLTabOptions -ParameterName SelectorColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabOptions -ParameterName SelectorColorTarget -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabOptions -ParameterName BorderBackgroundColor -ScriptBlock $Script:ScriptBlockColors
