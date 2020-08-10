Import-Module .\PSWriteHTML.psd1 -Force

$Test1 = Get-Process | Select-Object -First 5

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example-Tabs05.html -Show {
    #New-HTMLTabOptions -SlimTabs -Transition -LinearGradient -SelectorColor Blue -SelectorColorTarget AliceBlue -BorderRadius 25px -BorderBackgroundColor BurntOrange #-Align left
    #New-HTMLTabOptions -SlimTabs -Transition -LinearGradient -SelectorColor Blue -SelectorColorTarget AliceBlue
    #New-HTMLTabOptions -SlimTabs -Transition -SelectorColor Gold
    #New-HTMLTabOptions -SlimTabs -Transition -SelectorColor Gold -LinearGradient -TextTransformAllTab lowercase
    #New-HTMLTabOptions -SlimTabs -Transition -SelectorColor Gold -LinearGradient -TextTransformAllTab lowercase -TextTransformActiveTab uppercase
    #New-HTMLTabOptions -SlimTabs -BackgroundColorActive Grey
    #New-HTMLTabOptions -SlimTabs -BackgroundColorActive Grey -BackgroundColorActiveTarget White -LinearGradient -TextTransformAllTab capitalize -Align left
    #New-HTMLTabOptions -SlimTabs -BackgroundColorActive Grey -BackgroundColorActiveTarget White -LinearGradient -TextTransformAllTab capitalize -Align left -TextSize 15 -TextColor Black
    New-HTMLTabOptions -SlimTabs -BackgroundColorActive Grey -TextTransformAllTab capitalize
    New-HTMLTab -Name 'First Level Tab - Test 1' -IconBrands acquisitions-incorporated {

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