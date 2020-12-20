Import-Module .\PSWriteHTML.psd1 -Force

$Test = Get-Process | Select-Object -First 2 #-Property Name, Id,PriorityClass, HandleCount, WorkingSet

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example-Tabs01.html -Show {
    New-HTMLTabStyle -SlimTabs -Transition -LinearGradient -SelectorColor Gold -SelectorColorTarget AliceBlue #-FontSize 15
    New-HTMLTab -Name 'Test 1' -IconBrands acquisitions-incorporated -IconColor Coriander {
        New-HTMLTab -Name 'Nested Tab 1' -IconRegular address-card {
            New-HTMLSection -Invisible {
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Test -FixedFooter
                }
                New-HTMLPanel {
                    New-HTMLChart -Gradient {
                        New-ChartPie -Name 'Test' -Value 20
                        New-ChartPie -Name 'Test1' -Value 30
                        New-ChartPie -Name 'Test2' -Value 40
                        New-ChartPie -Name 'Test1' -Value 30
                        New-ChartPie -Name 'Test2' -Value 40
                    }
                }
            }
        }
        New-HTMLTab -Name 'Nested Tab 2' -IconSolid atlas {
            New-HTMLSection -HeaderText 'Test' -HeaderBackGroundColor BrightRed {
                New-HTMLTable -DataTable $Test
            }
        }
    }
    New-HTMLTab -Name 'Test 2' -IconRegular check-circle -IconColor LightSkyBlue {
        New-HTMLTable -DataTable $Test -DisablePaging
    }

    New-HTMLTab -Name 'Test 3' -IconSolid code-branch -IconColor LimeGreen {
        New-HTMLTable -DataTable $Test
        New-HTMLSection -HeaderText 'Test' -HeaderBackGroundColor CottonCandy {

        }
    }
    New-HTMLTab -Name 'Test 4' -IconSolid bezier-curve {
        New-HTMLTable -DataTable $Test -DisablePaging
    }
    New-HTMLTab -Name 'Test 5' -IconSolid copy -IconColor BrinkPink {
        New-HTMLTable -DataTable $Test
    }
    New-HTMLTab -Name 'Test' -IconBrands asymmetrik {
        New-HTMLTable -DataTable $Test
    }
    New-HTMLTab -Name 'Test' -IconRegular kiss-beam -TextColor BritishRacingGreen {
        New-HTMLTable -DataTable $Test -DisablePaging
    }
}