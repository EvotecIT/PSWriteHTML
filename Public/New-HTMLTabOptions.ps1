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
        [string] $BorderBackgroundColor

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

    #$Script:HTMLSchema.TabOptions = @{ }
    $Script:HTMLSchema.TabOptions.SlimTabs = $SlimTabs.IsPresent
    if ($SelectorColor) {

        $Tabbis = @"
[data-tabs] .active {
    background: ColorSelector;
    color: #fff;
    border-radius: 4px;
}
"@
        $Tabbis = $Tabbis.Replace('ColorSelector', (ConvertFrom-Color -Color $SelectorColor))
        $Script:HTMLSchema.CustomHeaderCSS.Add($Tabbis)
    }
    # This adds styling in new New-HTMLTabHead for all tabs
    $Script:BorderStyle = @{
        'border-radius'    = "$BorderRadius";
        'background-color' = ""
    }

    if ($BorderBackgroundColor) {
        $Script:BorderStyle.'background-color' = ConvertFrom-Color -Color $BorderBackgroundColor
    }

    # This adds Gradient
    if ($LinearGradient.IsPresent) {
        $TabbisGradient = @"
[data-tabs] .active {
    background: -moz-linear-gradient(45deg, ColorSelector 0%, ColorTarget 100%);
    background: -webkit-linear-gradient(45deg, ColorSelector 0%, ColorTarget 100%);
    background: linear-gradient(45deg, ColorSelector 0%, ColorTarget 100%);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='ColorSelector', endColorstr='ColorTarget', GradientType=1);
}
"@
        $TabbisGradient = $TabbisGradient.Replace('ColorSelector', (ConvertFrom-Color -Color $SelectorColor))
        $TabbisGradient = $TabbisGradient.Replace('ColorTarget', (ConvertFrom-Color -Color $SelectorColorTarget))
        $Script:HTMLSchema.CustomHeaderCSS.Add($TabbisGradient)
    }

    # This adds Transition
    if ($Transition.IsPresent) {
        $TabbisTransition = @"
[data-tabs] .active {
    transition-duration: 0.6s;
    transition-timing-function: cubic-bezier(0.68, -0.55, 0.265, 1.55);
}
"@
        $Script:HTMLSchema.CustomHeaderCSS.Add($TabbisTransition)
    }

    <#
    [string] $ClassName = "flexPanel$(Get-RandomStringName -Size 8 -LettersOnly)"
    $Attributes = @{
        'flex-basis' = if ($Width) { $Width } else { '100%' }
        'margin'     = if ($Margin) { $Margin }
    }
    $Css = ConvertTo-CSS -ClassName $ClassName -Attributes $Attributes

    $Script:HTMLSchema.CustomHeaderCSS.Add($Css)
    #>


}

Register-ArgumentCompleter -CommandName New-HTMLTabOptions -ParameterName SelectorColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabOptions -ParameterName SelectorColorTarget -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabOptions -ParameterName BorderBackgroundColor -ScriptBlock $Script:ScriptBlockColors
