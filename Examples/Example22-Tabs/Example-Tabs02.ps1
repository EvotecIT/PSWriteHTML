Import-Module .\PSWriteHTML.psd1 -Force

$Test = Get-Process | Select-Object -First 2 #-Property Name, Id, PriorityClass, HandleCount, WorkingSet
New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example-Tabs02.html -Show {
    New-HTMLTabStyle -SlimTabs -Transition -LinearGradient -SelectorColor Gold -SelectorColorTarget AliceBlue
    New-HTMLTab -Name 'First Level Tab - Test 1' -IconBrands acquisitions-incorporated {
        New-HTMLTab -Name '2nd Level Tab - Test 1' -IconRegular address-card {
            New-HTMLTab -Name 'Oops' -IconBrands old-republic {
                New-HTMLSection -HeaderText 'Pie Charts - Defaults' -CanCollapse {

                }
            }
        }
        New-HTMLTab -Name '2nd Level Tab - Test 2' -IconRegular address-card {
            New-HTMLSection -HeaderText 'Test' -Invisible {
                New-HTMLSection -HeaderText 'Pie Charts - Nope' -CanCollapse {
                    New-HTMLTable -DataTable $Test
                }
                New-HTMLSection -HeaderText 'Pie Charts - Nope' -CanCollapse {
                    New-HTMLTable -DataTable $Test
                }
            }
        }

        New-HTMLTab -Name '2nd Level Tab - Test 3' -IconBrands apple {
            New-HTMLSection -HeaderText 'Pie Charts - Nope 1' -CanCollapse {

            }
        }
    }
    New-HTMLTab -Name 'First Level Tab - Test 2' -IconRegular check-circle -IconColor LightSkyBlue {

    }
    New-HTMLTab -Name 'First Level Tab - Test 3' -IconSolid code-branch -IconColor LimeGreen {

    }
    New-HTMLTab -Name 'First Level Tab - Test 4' -IconSolid bezier-curve {
        New-HTMLTab -Name '2nd Level Tab - Test 4/1' -IconBrands app-store {
            New-HTMLSection -Invisible {
                New-HTMLSection -HeaderText 'Pie Charts - Defaults' -CanCollapse {
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
                New-HTMLSection -HeaderText 'Pie Charts - Defaults' -CanCollapse {
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
                New-HTMLTable -DataTable $Processes -HideFooter {
                    New-HTMLTableHeader -Names 'ID', 'HandleCount' -ResponsiveOperations none
                } -ImmediatelyShowHiddenDetails
            }
        }
        New-HTMLTab -Name '2nd Level Tab - Test 4/2' {
            New-HTMLTable -DataTable $Processes -HideFooter {
                New-HTMLTableHeader -Names 'ID', 'HandleCount' -ResponsiveOperations none
            } -ImmediatelyShowHiddenDetails
        }
    }
    New-HTMLTab -Name 'First Level Tab - Test 5' -IconSolid copy {

    }
    New-HTMLTab -Name 'First Level Tab - Test 6' -IconBrands asymmetrik {

    }
    New-HTMLTab -Name 'First Level Tab - Test 7' -IconRegular kiss-beam {

    }
}