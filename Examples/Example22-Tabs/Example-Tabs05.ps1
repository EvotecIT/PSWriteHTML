Import-Module $PSScriptRoot\..\..\PSWriteHTML.psd1 -Force
#Import-Module PSWriteHTML -Force

$Test1 = Get-Process | Select-Object -First 2

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example-Tabs05.html -Show {
    #New-HTMLTabOption -SlimTabs -LinearGradient -SelectorColor Blue -SelectorColorTarget AliceBlue -BorderRadius 25px -BorderBackgroundColor BurntOrange #-Align left
    #New-HTMLTabOption -SelectorColor Blue -SelectorColorTarget AliceBlue -BorderRadius 5px -BorderBackgroundColor BurntOrange #-Align left

    #New-HTMLTabOption -SlimTabs -Transition -LinearGradient -SelectorColor Blue -SelectorColorTarget AliceBlue
    #New-HTMLTabOption -SlimTabs -Transition -SelectorColor Gold
    #New-HTMLTabOption -SlimTabs -Transition -SelectorColor Gold -LinearGradient -TextTransform lowercase
    #New-HTMLTabOption -SlimTabs -Transition -SelectorColor Gold -LinearGradient -TextTransform lowercase -TextTransformActive uppercase
    #New-HTMLTabOption -SlimTabs -BackgroundColorActive Grey
    #New-HTMLTabOption -SlimTabs -BackgroundColorActive Grey -BackgroundColorActiveTarget White -LinearGradient -TextTransform capitalize -Align left
    #New-HTMLTabOption -SlimTabs -BackgroundColorActive Grey -BackgroundColorActiveTarget White -LinearGradient -TextTransform capitalize -Align left -TextSize 15 -TextColor Black
    #New-HTMLTabOption -SlimTabs -BackgroundColorActive Grey -TextTransform capitalize -Align left #-TextTransformActive lowercase
    #New-HTMLTabOption -SlimTabs -BackgroundColorActive Red -TextTransform capitalize -Align right
    #New-HTMLTabOption -SlimTabs -BackgroundColorActive Red -TextTransform capitalize -Align left -TextSize '10px'
    #New-HTMLTabOption -SlimTabs -BackgroundColorActive none -TextTransform capitalize -Align left -RemoveShadow -TextColorActive Black -FontWeightActive bold -FontStyleActive italic -BackgroundColorActive Green

    #New-HTMLTabOption -BackgroundColorActive Red -BorderRadius 10px
    #New-HTMLTabOption -BorderBottomWidth medium -BorderBottomColor Red -SlimTabs -BorderBottomStyle groove
    #New-HTMLTabOption -BorderBottomWidth medium -BorderBottomColor Red -SlimTabs `
    #    -BorderBottomStyle groove -BorderBottomStyleActive dotted -BorderBottomColorActive Blue -RemoveShadow -BackgroundColorActive none `
    #    -TextColorActive Blue
    #New-HTMLTabOption -SlimTabs `
    #    -BorderBottomStyleActive solid -BorderBottomColorActive CuriousBlue -BackgroundColorActive none `
    #    -TextColorActive Black -Align left -BorderRadius 0px -RemoveShadow -TextColor Grey

    #New-HTMLSectionOption -RemoveShadow -BorderRadius 0px -WritingMode vertical-lr -Direction row -AlignItems flex-end
    #New-HTMLSectionOption -RemoveShadow -BorderRadius 0px -WritingMode vertical-lr -Direction row -TextOrientation upright


    New-HTMLSectionOption # This can overwrite all settings for Sections that are not using any styles
    #$SectionStyle1 = New-HTMLSectionOption -RemoveShadow -BorderRadius 0px -Direction row -WritingMode vertical-lr -RequestConfiguration
    $SectionStyle1 = New-HTMLSectionOption -RemoveShadow -BorderRadius 0px -Direction row -WritingMode vertical-lr -Rotate 180deg -RequestConfiguration
    $SectionStyle2 = New-HTMLSectionOption -RemoveShadow -BorderRadius 0px -Direction row -WritingMode vertical-lr -TextOrientation upright -RequestConfiguration
    $SectionStyle3 = New-HTMLSectionOption -RemoveShadow -BorderRadius 0px -Direction row -WritingMode vertical-lr -HeaderBackGroundColor Grey -AlignContent center -RequestConfiguration
    $SectionStyle4 = New-HTMLSectionOption -RemoveShadow -BorderRadius 0px -Direction row -WritingMode vertical-lr -AlignItems flex-end -RequestConfiguration
    $SectionStyle5 = New-HTMLSectionOption -RemoveShadow -BorderRadius 0px -RequestConfiguration -HeaderBackGroundColor none -HeaderTextColor Grey
    $SectionStyle6 = New-HTMLSectionOption -RemoveShadow -BorderRadius 0px -Direction row-reverse -RequestConfiguration -JustifyContent center -AlignItems center -AlignContent stretch
    $SectionStyle7 = New-HTMLSectionOption -RemoveShadow -BorderRadius 0px -Direction row-reverse -WritingMode vertical-rl -RequestConfiguration -Rotate 180deg
    $SectionStyle8 = New-HTMLSectionOption -RemoveShadow -BorderRadius 0px -Direction column-reverse -RequestConfiguration
    #New-HTMLPanelOptions -BorderRadius 0px

    New-HTMLTabOption -SlimTabs `
        -BorderBottomStyleActive solid -BorderBottomColorActive LightSkyBlue -BackgroundColorActive none `
        -TextColorActive Black -Align left -BorderRadius 0px -RemoveShadow -TextColor Grey -TextTransform capitalize

    New-HTMLTab -Name 'First Level Tab - Test 1' -IconBrands acquisitions-incorporated {
        New-HTMLTab -Name '2nd Level Tab - Test 4/1' -IconBrands app-store {
            New-HTMLSection -HeaderText 'Default Section Style' {
                New-HTMLTable -DataTable $Test1 -HideFooter {
                    New-HTMLTableHeader -Names 'ID', 'HandleCount'
                }
            } -Collapsed -CanCollapse
            New-HTMLSection -Invisible {
                New-HTMLSection -Title 'Section Style 1' {
                    New-HTMLTable -DataTable $Test1 -HideFooter
                    New-HTMLTable -DataTable $Test1 -HideFooter
                    New-HTMLSection -Title 'Test' {
                        New-HTMLTable -DataTable $Test1 -HideFooter
                    }
                } -StyleSheetsConfiguration $SectionStyle1 -HeaderTextColor Black -Collapsed -CanCollapse
                New-HTMLSection -Title 'Section Style 2' {
                    New-HTMLTable -DataTable $Test1 -HideFooter
                } -StyleSheetsConfiguration $SectionStyle2
            }
            New-HTMLSection -Invisible {
                New-HTMLSection -Title 'Section Style 3' {
                    New-HTMLTable -DataTable $Test1 -HideFooter
                } -StyleSheetsConfiguration $SectionStyle3
                New-HTMLSection -Title 'Section Style 4' {
                    New-HTMLTable -DataTable $Test1 -HideFooter
                } -StyleSheetsConfiguration $SectionStyle4
            }
            New-HTMLSection -Invisible {
                New-HTMLSection -Title 'Section Style 5' {
                    New-HTMLTable -DataTable $Test1 -HideFooter
                } -StyleSheetsConfiguration $SectionStyle5
                New-HTMLSection -Title 'Section Style 6' {
                    New-HTMLTable -DataTable $Test1 -HideFooter
                } -StyleSheetsConfiguration $SectionStyle6
            }
            New-HTMLSection -Invisible {
                New-HTMLSection -Title 'Section Style 7' {
                    New-HTMLTable -DataTable $Test1 -HideFooter
                } -StyleSheetsConfiguration $SectionStyle7
                New-HTMLSection -Title 'Section Style 8' {
                    New-HTMLTable -DataTable $Test1 -HideFooter
                } -StyleSheetsConfiguration $SectionStyle8
            }
            # Show Panels
            New-HTMLSection -Invisible {
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Test1 -HideFooter
                }
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Test1 -HideFooter
                }
            }
            New-HTMLSection -Invisible {
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Test1 -HideFooter
                }
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Test1 -HideFooter
                }
            }
        }
    }
    New-HTMLTab -Name 'First Level Tab - Test 4' -IconSolid bezier-curve {
        New-HTMLTab -Name '2nd Level Tab - Test 4/1' -IconBrands app-store {
            New-HTMLTable -DataTable $Test1 -HideFooter {
                New-HTMLTableHeader -Names 'ID', 'HandleCount'
            }
        }
        New-HTMLTab -Name '2nd Level Tab - Test 4/2' {
            New-HTMLTable -DataTable $Test1 -HideFooter {
                New-HTMLTableHeader -Names 'ID', 'HandleCount' -Title 'Test'
            }
        }
    }
    New-HTMLTab -Name 'First Level Tab - Test 4' -IconSolid bezier-curve {
        New-HTMLSection -Invisible {
            New-HTMLTable -DataTable $Test1 -HideFooter {
                New-HTMLTableHeader -Names 'ID', 'HandleCount' -ResponsiveOperations none
            }

            New-HTMLTable -DataTable $Test1 -HideFooter {
                New-HTMLTableHeader -Names 'ID', 'HandleCount' -ResponsiveOperations none
            }
        }
    }
}