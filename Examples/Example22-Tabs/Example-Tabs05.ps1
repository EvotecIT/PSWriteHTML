#Import-Module $PSScriptRoot\..\..\PSWriteHTML.psd1 -Force
#Import-Module PSWriteHTML -Force

$Test1 = Get-Process | Select-Object -First 5

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example-Tabs05.html -Show {
    #New-HTMLTabOptions -SlimTabs -LinearGradient -SelectorColor Blue -SelectorColorTarget AliceBlue -BorderRadius 25px -BorderBackgroundColor BurntOrange #-Align left
    #New-HTMLTabOptions -SelectorColor Blue -SelectorColorTarget AliceBlue -BorderRadius 5px -BorderBackgroundColor BurntOrange #-Align left

    #New-HTMLTabOptions -SlimTabs -Transition -LinearGradient -SelectorColor Blue -SelectorColorTarget AliceBlue
    #New-HTMLTabOptions -SlimTabs -Transition -SelectorColor Gold
    #New-HTMLTabOptions -SlimTabs -Transition -SelectorColor Gold -LinearGradient -TextTransform lowercase
    #New-HTMLTabOptions -SlimTabs -Transition -SelectorColor Gold -LinearGradient -TextTransform lowercase -TextTransformActive uppercase
    #New-HTMLTabOptions -SlimTabs -BackgroundColorActive Grey
    #New-HTMLTabOptions -SlimTabs -BackgroundColorActive Grey -BackgroundColorActiveTarget White -LinearGradient -TextTransform capitalize -Align left
    #New-HTMLTabOptions -SlimTabs -BackgroundColorActive Grey -BackgroundColorActiveTarget White -LinearGradient -TextTransform capitalize -Align left -TextSize 15 -TextColor Black
    #New-HTMLTabOptions -SlimTabs -BackgroundColorActive Grey -TextTransform capitalize -Align left #-TextTransformActive lowercase
    #New-HTMLTabOptions -SlimTabs -BackgroundColorActive Red -TextTransform capitalize -Align right
    #New-HTMLTabOptions -SlimTabs -BackgroundColorActive Red -TextTransform capitalize -Align left -TextSize '10px'
    #New-HTMLTabOptions -SlimTabs -BackgroundColorActive none -TextTransform capitalize -Align left -RemoveShadow -TextColorActive Black -FontWeightActive bold -FontStyleActive italic -BackgroundColorActive Green

    #New-HTMLTabOptions -BackgroundColorActive Red -BorderRadius 10px
    #New-HTMLTabOptions -BorderBottomWidth medium -BorderBottomColor Red -SlimTabs -BorderBottomStyle groove
    #New-HTMLTabOptions -BorderBottomWidth medium -BorderBottomColor Red -SlimTabs `
    #    -BorderBottomStyle groove -BorderBottomStyleActive dotted -BorderBottomColorActive Blue -RemoveShadow -BackgroundColorActive none `
    #    -TextColorActive Blue
    #New-HTMLTabOptions -SlimTabs `
    #    -BorderBottomStyleActive solid -BorderBottomColorActive CuriousBlue -BackgroundColorActive none `
    #    -TextColorActive Black -Align left -BorderRadius 0px -RemoveShadow -TextColor Grey

    New-HTMLTabOptions -SlimTabs `
        -BorderBottomStyleActive solid -BorderBottomColorActive LightSkyBlue -BackgroundColorActive none `
        -TextColorActive Black -Align left -BorderRadius 0px -RemoveShadow -TextColor Grey -TextTransform capitalize

    New-HTMLTab -Name 'First Level Tab - Test 1' -IconBrands acquisitions-incorporated {
        New-HTMLTab -Name '2nd Level Tab - Test 4/1' -IconBrands app-store {
            New-HTMLTable -ArrayOfObjects $Test1 -HideFooter {
                New-HTMLTableHeader -Names 'ID', 'HandleCount'
            }
        }
    }
    New-HTMLTab -Name 'First Level Tab - Test 4' -IconSolid bezier-curve {
        New-HTMLTab -Name '2nd Level Tab - Test 4/1' -IconBrands app-store {
            New-HTMLTable -ArrayOfObjects $Test1 -HideFooter {
                New-HTMLTableHeader -Names 'ID', 'HandleCount'
            }
        }
        New-HTMLTab -Name '2nd Level Tab - Test 4/2' {
            New-HTMLTable -ArrayOfObjects $Test1 -HideFooter {
                New-HTMLTableHeader -Names 'ID', 'HandleCount' -Title 'Test'
            }
        }
    }
    New-HTMLTab -Name 'First Level Tab - Test 4' -IconSolid bezier-curve {
        New-HTMLSection -Invisible {
            New-HTMLTable -ArrayOfObjects $Test1 -HideFooter {
                New-HTMLTableHeader -Names 'ID', 'HandleCount' -ResponsiveOperations none
            }

            New-HTMLTable -ArrayOfObjects $Test1 -HideFooter {
                New-HTMLTableHeader -Names 'ID', 'HandleCount' -ResponsiveOperations none
            }
        }
    }
}