Import-Module .\PSWriteHTML.psd1 -Force

$Test = Get-Process | Select-Object -First 2 -Property Name, Id, PriorityClass, HandleCount, WorkingSet
$Test1 = Get-Process | Select-Object -First 2 #-Property Name, Id, PriorityClass, HandleCount, WorkingSet

New-HTML -TitleText 'My title' -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example-Tabs03.html -Show {
    #New-HTMLTabOptions -SlimTabs -Transition -LinearGradient -SelectorColor Gold -SelectorColorTarget AliceBlue
    New-HTMLTab -Name 'First Level Tab - Test 1' -IconBrands acquisitions-incorporated {
        New-HTMLTab -Name '2nd Level Tab - Test 1/1' -IconRegular address-card {
            New-HTMLTable -ArrayOfObjects $Test1 -HideFooter
        }
        New-HTMLTab -Name '2nd Level Tab - Test 1/2' -IconRegular address-card {
            New-HTMLTable -ArrayOfObjects $Test1 -HideFooter
        }
        New-HTMLTab -Name '2nd Level Tab - Test 1/3' -IconRegular address-card {
            New-HTMLTable -ArrayOfObjects $Test1 -HideFooter
        }
        New-HTMLTab -Name '2nd Level Tab - Test 1/4' -IconRegular address-card {
            New-HTMLTable -ArrayOfObjects $Test1 -HideFooter
        }
    }

    New-HTMLTab -Name 'First Level Tab - Test 4' -IconSolid bezier-curve {
        New-HTMLTab -Name '2nd Level Tab - Test 4/1' -IconBrands app-store {
            New-HTMLTable -ArrayOfObjects $Test1 -HideFooter {
                New-HTMLTableHeader -Names 'ID', 'HandleCount' -ResponsiveOperations none
            }
        }
        New-HTMLTab -Name '2nd Level Tab - Test 4/2' {
            New-HTMLTable -ArrayOfObjects $Test1 -HideFooter {
                New-HTMLTableHeader -Names 'ID', 'HandleCount' -ResponsiveOperations none
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