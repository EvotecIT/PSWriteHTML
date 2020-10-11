Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {
    New-HTMLTab -Name 'Standard Top Level Tabs 1' -IconBrands 500px {
        New-HTMLTab -Name 'Nested Top Level Tabs 1' {
            New-HTMLSection -Invisible {
                New-HTMLSection -HeaderText 'My Section with nested tabs in section' {
                    New-HTMLTabPanel {
                        New-HTMLTab -Name 'Test 5' -IconBrands apple -IconColor Red -IconSize 15 -TextSize 15 -TextColor Blue {
                            New-HTMLTable -DataTable 'test'
                        }
                        New-HTMLTab -Name 'Test 6' -IconRegular address-book -IconColor Red -IconSize 15 -TextSize 15 -TextColor Blue {

                        }
                    }
                }
                New-HTMLSection -HeaderText 'Another section' {
                    New-HTMLTable -DataTable 'test'
                }
            }
        }
        New-HTMLTab -Name 'Nested Top Level Tabs 2' {
            New-HTMLSection {
                New-HTMLPanel {
                    New-HTMLTabPanel {
                        New-HTMLTab -Name 'Test 1' {
                            New-HTMLTable -DataTable 'test1'
                        }
                        New-HTMLTab -Name 'Test 2' {

                        }
                    }
                }
                New-HTMLPanel {
                    New-HTMLTabPanel {
                        New-HTMLTab -Name 'Test 3' {
                            New-HTMLTable -DataTable 'test2'
                        }
                        New-HTMLTab -Name 'Test 4' {

                        }
                    }
                }
            }
        }

    }
    New-HTMLTab -Name 'Standard Top Level Tabs 2' -IconRegular address-book {
        New-HTMLTab -Name 'Nested Top Level Tabs 2.2' {
            New-HTMLTable -DataTable 'SomeData'
        }
    }
} -Online -ShowHTML -FilePath $PSScriptRoot\Example-TabsInLine02.html