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
                            New-HTMLDiagram {
                                New-DiagramOptionsLayout -HierarchicalEnabled $true #-HierarchicalDirection FromLeftToRight #-HierarchicalSortMethod directed
                                New-DiagramOptionsPhysics -Enabled $true -HierarchicalRepulsionAvoidOverlap 1 -HierarchicalRepulsionNodeDistance 200

                                New-DiagramNode -Label '1 test' -To '3', '6', '7' -ColorBackground Bisque
                                New-DiagramNode -Label '2' -To 'Przemyslaw Klys', '1 test'
                                New-DiagramNode -Label '3' -To 'Przemyslaw Klys', '1 test'
                                New-DiagramNode -Label '4' -To 'Przemyslaw Klys', '1 test'
                                New-DiagramNode -Label '5' -To 'Przemyslaw Klys', '1 test'
                                New-DiagramNode -Label '6' -To 'Przemyslaw Klys', '1 test'
                                New-DiagramNode -Label '7' -To 'Przemyslaw Klys', '1 test'
                                New-DiagramNode -Label '8' -To 'Przemyslaw Klys', '1 test'
                                New-DiagramNode -Label '9' -To 'Przemyslaw Klys', '1 test'
                            }
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
                            New-HTMLCalendar {
                                New-CalendarEvent -Title '213Active Directory Meeting' -Description 'We will talk about stuff' -StartDate (Get-Date)
                                New-CalendarEvent -Title '213Lunch' -StartDate (Get-Date).AddDays(2).AddHours(-3) -EndDate (Get-Date).AddDays(3) -Description 'Very long lunch'
                            }
                            New-HTMLCalendar {
                                New-CalendarEvent -Title 'Diff 123 meeting' -Description 'We will talk about stuff' -StartDate (Get-Date)
                                New-CalendarEvent -Title 'Ooops 123 i did it again' -StartDate (Get-Date).AddDays(2).AddHours(-3) -EndDate (Get-Date).AddDays(3) -Description 'Very long lunch'
                            } -InitialView timeGridDay
                        }
                    }
                }
                New-HTMLPanel {
                    New-HTMLTabPanel {
                        New-HTMLTab -Name 'Test 3' {
                            New-HTMLTable -DataTable 'test2'
                        }
                        New-HTMLTab -Name 'Test 4' {
                            New-HTMLTable -DataTable (Get-Process | Select-Object -First 3)
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