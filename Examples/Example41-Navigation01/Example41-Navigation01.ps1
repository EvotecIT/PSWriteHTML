Import-Module .\PSWriteHTML.psd1 -Force

$DataTable1 = @(
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.42 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.72 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.22 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 2.73 }
)

New-HTML {
    New-HTMLNav -Logo 'https://evotec.xyz/wp-content/uploads/2021/04/Logo-evotec-bb.png' -TopBarBackGroundColor Black -LeftMenuBackgroundColor Black -LogoLinkHome { #-FixedMenu {
        New-NavItem -Type Grid -Text 'Page One' -InternalPageID 'Page1'
        New-NavItem -Type Grid -Text 'Page Two' -InternalPageID 'Page2'
        New-NavItem -Type Grid -Text 'Page Three' -InternalPageID 'Page3'
        New-NavItem -Type Grid -Text 'Place Holder'
        New-NavItem -Type Grid -IconBrands codepen -IconColor Blue -InternalPageID 'Page1'
        New-NavItem -Type Menu -IconSolid address-card -IconColor Green -Text 'Link to Page 1' -InternalPageID 'Page1'
        New-NavItem -Type Menu -IconSolid atlas -IconColor Green -Text '2nd page' -InternalPageID 'Page2'
        New-NavItem -Type Menu -IconSolid atlas -IconColor Green -Text 'GPOZaurr' -InternalPageID 'Page3'
        New-NavItem -Type Menu -IconMaterial star -IconColor Green -Text 'Star'
        New-NavItem -Type Menu -IconBrands edge -IconColor Green -Text 'Visit Evotec!' -Href 'https://evotec.xyz'

        New-NavLink -IconMaterial airplane -Href 'https://evotec.xyz' -Name 'This is link Icon Material'
        New-NavLink -IconBrands acquisitions-incorporated -Name 'This is link with FA' {
            New-NavLink -Name 'This is link with 1'
            New-NavLink -IconBrands acquisitions-incorporated -Name 'This is link with 2' {
                New-NavLink -IconBrands acquisitions-incorporated -Name 'This is link with 3.1'
                New-NavLink -IconBrands acquisitions-incorporated -Name 'This is link with 3.2'
                New-NavLink -IconBrands acquisitions-incorporated -Name 'This is link with 3.3'
                New-NavLink -IconBrands acquisitions-incorporated -Name 'This is link with 3.4' -Href 'https://evotec.xyz'
            }
            New-NavLink -IconBrands acquisitions-incorporated -Name 'This is link with 3'
            New-NavLink -IconBrands acquisitions-incorporated -Name 'This is link with 4'
        }
        New-NavLink -IconBrands app-store -Name 'One Level' -IconColor Blue {
            New-NavLink -Name 'One Level 1' -Href '#1'
            New-NavLink -Name 'One Level 2' -Href '#2'
        }
    } -StartMenuOpen -ResizeContent
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
    # This adds more pages with different content
    New-HTMLPage -Name 'Page2' {
        New-HTMLSection -Invisible {
            New-HTMLFrame -SourcePath "C:\Support\GitHub\PSWriteHTML\Examples\Example-Maps\Example-Maps.html"
        } -Height 93vh
    }
    New-HTMLPage -Name 'Page3' {
        New-HTMLSection {
            New-HTMLFrame -SourcePath "C:\Support\GitHub\PSWriteHTML\Examples\Example-InlineOtherHTMLFile.ps1\GroupMembership-CriticalGroups_2021-05-20_002030.html"
        } -HeaderText 'Test' -Height 100vh
    }
} -ShowHTML -Online -FilePath $PSScriptRoot\Example41-Navigation01.html