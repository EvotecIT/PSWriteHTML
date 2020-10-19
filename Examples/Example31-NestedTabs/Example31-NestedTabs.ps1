Import-Module .\PSWriteHTML.psd1 -Force

$Forest = Get-ADForest
New-HTML -TitleText 'My Title' -FilePath $PSScriptRoot\Example30-NestedTabs.html -ShowHTML {
    New-HTMLTabStyle -SelectorColor Grey
    foreach ($Domain in $Forest.Domains) {
        $Computers = Get-ADComputer -Server $Domain -Filter * -Properties OperatingSystem, OperatingSystemVersion, PasswordLastSet | Select-Object -Property DNSHostName, Name, Enabled, OperatingSystem, OperatingSystemVersion, PasswordLastSet
        $Users = Get-ADUser -Server $Domain -Filter * -Properties SamAccountName, Name, Title, Surname, PasswordNeverExpires, WhenCreated, WhenChanged | Select-Object UserPrincipalName, SamAccountName, Name, Title, Surname, PasswordNeverExpires, WhenCreated, WhenChanged #-First 17
        $DataTableIDUsers = Get-Random -Minimum 100000 -Maximum 2000000
        $DataTableIDComputers = Get-Random -Minimum 100000 -Maximum 2000000

        New-HTMLTab -TabName "Domain $Domain" -IconSolid dice {
            New-HTMLTab -TabName 'Computers' {
                New-HTMLSection -HeaderText 'Active Directory Computers & Diagram' -HeaderBackGroundColor Grey {
                    New-HTMLPanel {
                        New-HTMLTable -DataTable $Computers -DataTableID $DataTableIDComputers
                    }
                    New-HTMLPanel {
                        New-HTMLDiagram {
                            New-DiagramNode -Label 'Domain' -To 'AD Computers', 'AD Users' -IconBrands delicious -IconColor Red
                            New-DiagramNode -Label 'AD Computers' -IconBrands apple -IconColor Black
                            New-DiagramNode -Label 'AD Users' -IconBrands instagram -IconColor Yellow
                            New-DiagramEvent -ID $DataTableIDUsers -ColumnID 1
                            New-DiagramEvent -ID $DataTableIDComputers -ColumnID 1
                            foreach ($_ in $Computers) {
                                if ($_.OperatingSystem -like '*Server*') {
                                    New-DiagramNode -Label $_.Name -IconSolid server -To 'AD Computers' -IconColor Green
                                } else {
                                    New-DiagramNode -Label $_.Name -IconSolid desktop -To 'AD Computers' -IconColor Gray
                                }
                            }
                            foreach ($_ in $Users) {
                                New-DiagramNode -Label $_.SamAccountName -To 'AD Users' -IconRegular user-circle
                            }
                        }
                    }
                }
            }
            New-HTMLTab -Name 'Users' {
                New-HTMLSection -HeaderText 'Active Directory Users' -HeaderBackGroundColor Grey {
                    New-HTMLPanel {
                        New-HTMLTable -DataTable $Users -DataTableID $DataTableIDUsers
                    }
                    New-HTMLPanel {
                        New-HTMLCalendar {
                            foreach ($_ in $Users) {
                                New-CalendarEvent -StartDate $_.WhenCreated -Title "User: $($_.SamAccountName)" -Description "User $($_.Name) created on $($_.WhenCreated)"
                                New-CalendarEvent -StartDate $_.WhenChanged -Title "User: $($_.SamAccountName)" -Description "User $($_.Name) modified on $($_.WhenChanged)"
                            }
                            foreach ($_ in $Computers) {
                                New-CalendarEvent -StartDate $_.PasswordLastSet -Title "Computer $($_.SamAccountName)" -Description "Computer $($_.DNSHostName) password last set $($_.PasswordLastSet)"
                            }
                        }
                    }
                }
            }
        }
    }
} -Online