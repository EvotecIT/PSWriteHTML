function New-HTMLTabOptions {
    [alias('TabOptions')]
    [CmdletBinding()]
    param(
        [switch] $SlimTabs,
        [string] $SelectorColor,
        [string] $SelectorColorTarget,
        [switch] $Transition,
        [switch] $LinearGradient,
        [ValidateSet('0px','10px','15px','25px')][string] $BorderRadius = '0px',
        [string] $BorderBackgroundColor

    )
    if (-not $Script:HTMLSchema) {
        Write-Warning 'New-HTMLTabOptions - Creation of HTML aborted. Most likely New-HTML is missing.'
        Exit
    }
    #$Script:HTMLSchema.TabOptions = @{ }
    $Script:HTMLSchema.TabOptions.SlimTabs = $SlimTabs.IsPresent
    if ($SelectorColor) {
        # $Script:HTMLSchema.TabOptions.SelectorColor = ConvertFrom-Color -Color $SelectorColor
        $Script:Configuration.Features.Tabbis.CustomActionsReplace.ColorSelector = ConvertFrom-Color -Color $SelectorColor
        $Script:Configuration.Features.TabbisGradient.CustomActionsReplace.ColorSelector = ConvertFrom-Color -Color $SelectorColor
        # $Script:Configuration.Features.TabsTransition.CustomActionsReplace.ColorSelector = ConvertFrom-Color -Color $SelectorColor
    }
    if ($SelectorColorTarget) {
        $Script:Configuration.Features.Tabbis.CustomActionsReplace.ColorTarget = ConvertFrom-Color -Color $SelectorColorTarget
        $Script:Configuration.Features.TabbisGradient.CustomActionsReplace.ColorTarget = ConvertFrom-Color -Color $SelectorColorTarget
    }
    $Script:HTMLSchema.Features.TabbisGradient = $LinearGradient.IsPresent
    $Script:HTMLSchema.Features.TabbisTransition = $Transition.IsPresent

    $Script:BorderStyle = @{
        'border-radius' = "$BorderRadius";
        'background-color' = ""
    }

    if($BorderBackgroundColor){
        $Script:BorderStyle.'background-color' = ConvertFrom-Color -Color $BorderBackgroundColor
    }
}

Register-ArgumentCompleter -CommandName New-HTMLTabOptions -ParameterName SelectorColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabOptions -ParameterName SelectorColorTarget -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTabOptions -ParameterName BorderBackgroundColor -ScriptBlock $Script:ScriptBlockColors
