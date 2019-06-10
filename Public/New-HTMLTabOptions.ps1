function New-HTMLTabOptions {
    [alias('TabOptions')]
    [CmdletBinding()]
    param(
        [switch] $SlimTabs,
        [RGBColors] $SelectorColor = [RGBColors]::None,
        [switch] $Transition,
        [switch] $LinearGradient

    )
    if (-not $Script:HTMLSchema) {
        Write-Warning 'New-HTMLTabOptions - Creation of HTML aborted. Most likely New-HTML is missing.'
        Exit
    }
    $Script:HTMLSchema.TabOptions = @{ }
    $Script:HTMLSchema.TabOptions.SlimTabs = $SlimTabs.IsPresent
    $Script:HTMLSchema.TabOptions.SelectorColor = $SelectorColor

    $Script:HTMLSchema.Features.TabsGradient = $LinearGradient.IsPresent
    $Script:HTMLSchema.Features.TabsTransition = $Transition.IsPresent
}