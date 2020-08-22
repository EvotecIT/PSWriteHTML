Import-Module .\PSWriteHTML.psd1 -Force

$Test1 = Get-Process | Select-Object -First 5

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example-Tabs03.html -Show {
    New-HTMLTabStyle -SlimTabs -Transition -LinearGradient -SelectorColor Gold -SelectorColorTarget AliceBlue
    New-HTMLTab -Name 'First Level Tab - Test 1' -IconBrands acquisitions-incorporated {
        New-HTMLTab -Name '2nd Level Tab - Test 1/1' -IconRegular address-card {
            New-HTMLTab -Name '3rd level' {
                New-HTMLTab -Name '4th' {
                    New-HTMLTable -DataTable $Test1 -HideFooter
                }
            }
        }
        New-HTMLTab -Name '2nd Level Tab - Test 1/2' -IconRegular address-card {
            New-HTMLTable -DataTable $Test1 -HideFooter
        }
        New-HTMLTab -Name '2nd Level Tab - Test 1/3' -IconRegular address-card {
            New-HTMLTable -DataTable $Test1 -HideFooter
        }
        New-HTMLTab -Name '2nd Level Tab - Test 1/4' -IconRegular address-card {
            New-HTMLTable -DataTable $Test1 -HideFooter
        }
    }

    New-HTMLTab -Name 'First Level Tab - Test 4' -IconSolid bezier-curve {
        New-HTMLTab -Name '2nd Level Tab - Test 4/1' -IconBrands app-store {
            New-HTMLTable -DataTable $Test1 -HideFooter {
                New-HTMLTableHeader -Names 'ID', 'HandleCount' -ResponsiveOperations none
            }
        }
        New-HTMLTab -Name '2nd Level Tab - Test 4/2' {
            New-HTMLTable -DataTable $Test1 -HideFooter {
                New-HTMLTableHeader -Names 'ID', 'HandleCount' -ResponsiveOperations none
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