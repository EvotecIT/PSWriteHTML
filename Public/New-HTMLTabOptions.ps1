function New-HTMLTabOptions {
    [alias('TabOptions')]
    [CmdletBinding()]
    param(
        [switch] $SlimTabs,
        [string] $SelectorColor = "",
        [string] $SelectorColorTarget = "",
        [switch] $Transition,
        [switch] $LinearGradient

    )
    if (-not $Script:HTMLSchema) {
        Write-Warning 'New-HTMLTabOptions - Creation of HTML aborted. Most likely New-HTML is missing.'
        Exit
    }
    #$Script:HTMLSchema.TabOptions = @{ }
    $Script:HTMLSchema.TabOptions.SlimTabs = $SlimTabs.IsPresent
    if ($SelectorColor -ne "") {
       # $Script:HTMLSchema.TabOptions.SelectorColor = ConvertFrom-Color -Color $SelectorColor
        $Script:Configuration.Features.Tabbis.CustomActionsReplace.ColorSelector = ConvertFrom-Color -Color $SelectorColor
        $Script:Configuration.Features.TabbisGradient.CustomActionsReplace.ColorSelector = ConvertFrom-Color -Color $SelectorColor
       # $Script:Configuration.Features.TabsTransition.CustomActionsReplace.ColorSelector = ConvertFrom-Color -Color $SelectorColor
    }
    if ($SelectorColorTarget -ne "") {
        $Script:Configuration.Features.Tabbis.CustomActionsReplace.ColorTarget = ConvertFrom-Color -Color $SelectorColorTarget
        $Script:Configuration.Features.TabbisGradient.CustomActionsReplace.ColorTarget = ConvertFrom-Color -Color $SelectorColorTarget
    }
    $Script:HTMLSchema.Features.TabbisGradient = $LinearGradient.IsPresent
    $Script:HTMLSchema.Features.TabbisTransition = $Transition.IsPresent

}