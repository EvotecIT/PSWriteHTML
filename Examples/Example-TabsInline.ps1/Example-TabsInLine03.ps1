Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {
    New-HTMLTabPanel {
        New-HTMLTab -Name 'Standard Top Level Tabs 1' -IconBrands 500px {
            New-HTMLTabPanel {
                New-HTMLTab -Name 'Standard Nested Level Tabs 2.1' -IconBrands 500px {
                    New-HTMLSection -Invisible {
                        New-HTMLSection -HeaderText 'My Section with nested tabs in section' {
                            New-HTMLTabPanel {
                                New-HTMLTab -Name 'Test 5' -IconBrands apple {
                                    New-HTMLTable -DataTable 'test'
                                }
                                New-HTMLTab -Name 'Test 6' -IconRegular address-book -IconColor Red -TextColor Blue {

                                }
                            }
                        }
                        New-HTMLSection -HeaderText 'Another section' {
                            New-HTMLTable -DataTable 'test'
                        }
                    }
                }
                New-HTMLTab -Name 'Standard Nested Level Tabs 2.2' -IconBrands 500px {

                }
            }
        }
        New-HTMLTab -Name 'Standard Top Level Tabs 2' -IconRegular address-book {

        }
    }
} -Online -ShowHTML -FilePath $PSScriptRoot\Example-TabsInLine03.html