Import-Module .\PSWriteHTML.psd1 -Force

$DataTable1 = @(
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.42 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.72 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.22 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 2.73 }
)

New-HTML {
    New-HTMLNav -Logo 'https://evotec.xyz/wp-content/uploads/2021/04/Logo-evotec-bb.png' -LogoLinkHome { #-FixedMenu {
        New-NavItem -Type Grid -Text 'Item one' -InternalPageID 'Page1'
        New-NavItem -Type Grid -Text 'Item two' -InternalPageID 'Page2'
        New-NavItem -Type Grid -Text 'Item three'
        New-NavItem -Type Grid -IconSolid address-card -IconColor Green -Text 'test' -Href 'https://evotec.xyz'
        New-NavItem -Type Menu -IconSolid address-card -IconColor Green -Text 'test' -Href 'https://evotec.xyz'
        New-NavItem -Type Menu -IconSolid address-card -IconColor Green -Text 'test 1'
        New-NavItem -Type Menu -IconSolid address-card -IconColor Green -Text 'test 2 '
        New-NavItem -Type Menu -IconSolid address-card -IconColor Green -Text 'test 3'
        New-NavItem -Type Menu -IconMaterial star -IconColor Green -Text 'Star'
        New-NavItem -Type Menu -IconMaterial inbox -IconColor Green -Text 'Inbox'
        New-NavItem -Type Menu -IconMaterial delete -IconColor Green -Text 'Delete'
        New-NavItem -Type Menu -IconMaterial run -IconColor Green -Text 'Run'

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
        New-HTMLSectionOption -RemoveShadow -BorderRadius 0px
        New-HTMLSection -HeaderText 'This is just to show what you can do' -HeaderBackGroundColor Grey {
            New-HTMLTabPanel {
                New-HTMLTab -Name 'Standard Top Level Tabs 1' -IconBrands 500px {
                    New-HTMLTabPanel -Orientation vertical {
                        New-HTMLTab -Name 'Standard Nested Level Tabs 2.1' -IconBrands 500px {
                            New-HTMLSection -Invisible {
                                New-HTMLSection -HeaderText 'My Section with nested tabs in section' {
                                    New-HTMLTabPanel {
                                        New-HTMLTab -Name 'Test Tab with size 30' -IconBrands apple -IconSize 30 -TextSize 30 {
                                            New-HTMLTable -DataTable 'test'
                                        }
                                        New-HTMLTab -Name 'Test Tab with size 30 and chosen colors' -IconRegular address-book -IconColor Red -IconSize 30 -TextSize 30 -TextColor Blue {
                                            New-HTMLText -Color Red -FontSize 20 -Text "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
                                        }
                                    }
                                }
                                New-HTMLSection -HeaderText 'Another section' {
                                    New-HTMLTable -DataTable 'test 1'
                                }
                            }
                        }
                        New-HTMLTab -Name 'Standard Nested Level Tabs 2.2' -IconBrands 500px {
                            New-HTMLText -Text "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
                        }
                        New-HTMLTab -Name 'Standard Nested Level Tabs 2.3' -IconBrands 500px {
                            New-HTMLText -Color Red -FontSize 20 -Text "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
                        }
                        New-HTMLTab -Name 'Standard Nested Level Tabs 2.4' -IconBrands 500px {
                            New-HTMLText -Color Green -FontSize 10px -Text "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
                        }
                        New-HTMLTab -Name 'Standard Nested Level Tabs 2.5' -IconBrands 500px {
                            New-HTMLText -Color Green -FontSize 10pt -Text "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
                            New-HTMLTable -DataTable 'Test Content on 5th vertical tab'
                        }
                    }
                }
                New-HTMLTab -Name 'Standard Top Level Tabs 2' -IconRegular address-book {
                    New-HTMLTable -DataTable 'test 3'
                }
            }

        }
        New-HTMLSection -HeaderText 'Another section' -HeaderBackGroundColor Grey {
            New-HTMLTabPanel -Orientation vertical {
                New-HTMLTab -Name 'More tabs 1' {
                    New-HTMLSection -HeaderText 'OK 1' {
                        New-HTMLTable -DataTable 'Test 1'
                    }
                }
                New-HTMLTab -Name 'More tabs 2' {
                    New-HTMLSection -HeaderText 'OK 2' {
                        New-HTMLTable -DataTable 'Test 2'
                    }
                }
                New-HTMLTab -Name 'More tabs 3' {
                    New-HTMLSection -HeaderText 'OK 3' {
                        New-HTMLTable -DataTable 'Test 3'
                    }
                }
                New-HTMLTab -Name 'More tabs 4' {
                    New-HTMLSection -HeaderText 'OK 4' {
                        New-HTMLTable -DataTable 'Test 4'
                    }
                }
            }
        }
    }
    New-HTMLPage -Name 'Page2' {
        New-HTMLSection -HeaderText 'Test2' {
            New-HTMLTable -DataTable $DataTable1 -Title 'Test2' -PagingLength 2
        }
    }
} -ShowHTML -Online -FilePath $PSScriptRoot\Example41-Navigation02.html