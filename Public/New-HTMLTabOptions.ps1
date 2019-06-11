function New-HTMLTabOptions {
    [alias('TabOptions')]
    [CmdletBinding()]
    param(
        [switch] $SlimTabs,
        [RGBColors] $SelectorColor = [RGBColors]::None,
        [RGBColors] $SelectorColorTarget = [RGBColors]::None,
        [switch] $Transition,
        [switch] $LinearGradient

    )
    if (-not $Script:HTMLSchema) {
        Write-Warning 'New-HTMLTabOptions - Creation of HTML aborted. Most likely New-HTML is missing.'
        Exit
    }
    #$Script:HTMLSchema.TabOptions = @{ }
    $Script:HTMLSchema.TabOptions.SlimTabs = $SlimTabs.IsPresent
    if ($SelectorColor -ne [RGBColors]::None) {
       # $Script:HTMLSchema.TabOptions.SelectorColor = ConvertFrom-Color -Color $SelectorColor
        $Script:Configuration.Features.Tabs.CustomActionsReplace.ColorSelector = ConvertFrom-Color -Color $SelectorColor
        $Script:Configuration.Features.TabsGradient.CustomActionsReplace.ColorSelector = ConvertFrom-Color -Color $SelectorColor
       # $Script:Configuration.Features.TabsTransition.CustomActionsReplace.ColorSelector = ConvertFrom-Color -Color $SelectorColor
    }
    if ($SelectorColorTarget -ne [RGBColors]::None) {
        $Script:Configuration.Features.Tabs.CustomActionsReplace.ColorTarget = ConvertFrom-Color -Color $SelectorColorTarget
        $Script:Configuration.Features.TabsGradient.CustomActionsReplace.ColorTarget = ConvertFrom-Color -Color $SelectorColorTarget
    }
    $Script:HTMLSchema.Features.TabsGradient = $LinearGradient.IsPresent
    $Script:HTMLSchema.Features.TabsTransition = $Transition.IsPresent

}