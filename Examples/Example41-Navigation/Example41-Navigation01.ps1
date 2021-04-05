Import-Module .\PSWriteHTML.psd1 -Force

$DataTable1 = @(
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.42 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.72 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.22 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 2.73 }
)

New-HTML {
    New-HTMLNav -Logo 'https://evotec.xyz/wp-content/uploads/2021/04/Logo-evotec-bb.png' -LogoLinkHome { #-FixedMenu {
        New-HTMLNavItem -Type Grid -Text 'Item one' -InternalPageID 'Page1'
        New-HTMLNavItem -Type Grid -Text 'Item two' -InternalPageID 'Page2'
        New-HTMLNavItem -Type Grid -Text 'Item three'
        New-HTMLNavItem -Type Grid -IconSolid address-card -IconColor Green -Text 'test' -Href 'https://evotec.xyz'

        New-HTMLNavItem -Type Menu -IconSolid address-card -IconColor Green -Text 'test' -Href 'https://evotec.xyz'
        New-HTMLNavItem -Type Menu -IconSolid address-card -IconColor Green -Text 'test 1'
        New-HTMLNavItem -Type Menu -IconSolid address-card -IconColor Green -Text 'test 2 '
        New-HTMLNavItem -Type Menu -IconSolid address-card -IconColor Green -Text 'test 3'
        New-HTMLNavItem -Type Menu -IconMaterial star -IconColor Green -Text 'Star'
        New-HTMLNavItem -Type Menu -IconMaterial inbox -IconColor Green -Text 'Inbox'
        New-HTMLNavItem -Type Menu -IconMaterial delete -IconColor Green -Text 'Delete'
        New-HTMLNavItem -Type Menu -IconMaterial run -IconColor Green -Text 'Run'

        New-HTMLNavLink -IconMaterial airplane -Href 'https://evotec.xyz' -Name 'This is link Icon Material'
        New-HTMLNavLink -IconBrands acquisitions-incorporated -Name 'This is link with FA' {
            New-HTMLNavLink -Name 'This is link with 1'
            New-HTMLNavLink -IconBrands acquisitions-incorporated -Name 'This is link with 2' {
                New-HTMLNavLink -IconBrands acquisitions-incorporated -Name 'This is link with 3.1'
                New-HTMLNavLink -IconBrands acquisitions-incorporated -Name 'This is link with 3.2'
                New-HTMLNavLink -IconBrands acquisitions-incorporated -Name 'This is link with 3.3'
                New-HTMLNavLink -IconBrands acquisitions-incorporated -Name 'This is link with 3.4' -Href 'https://evotec.xyz'
            }
            New-HTMLNavLink -IconBrands acquisitions-incorporated -Name 'This is link with 3'
            New-HTMLNavLink -IconBrands acquisitions-incorporated -Name 'This is link with 4'
        }
        New-HTMLNavLink -IconBrands app-store -Name 'One Level' -IconColor Blue {
            New-HTMLNavLink -Name 'One Level 1' -Href '#1'
            New-HTMLNavLink -Name 'One Level 2' -Href '#2'
        }
    }
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


    New-HTMLPage -Name 'Page1' {
        New-HTMLSection -HeaderText 'Test 0' {
            New-HTMLTable -DataTable $DataTable1 -Title 'Test2' -PagingLength 2
        }
        New-HTMLSection -HeaderText 'Test 1' {
            New-HTMLTable -DataTable $DataTable1 -Title 'Test2' -PagingLength 2
        }
    }
    New-HTMLPage -Name 'Page2' {
        New-HTMLSection -HeaderText 'Test2' {
            New-HTMLTable -DataTable $DataTable1 -Title 'Test2' -PagingLength 2
        }
    }
} -ShowHTML -Online -FilePath $PSScriptRoot\Example41-Navigation01.html