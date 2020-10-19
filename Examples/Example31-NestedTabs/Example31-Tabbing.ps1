Import-Module .\PSWriteHTML.psd1 -Force

$Forest = Get-ADForest
New-HTML -TitleText 'My Title' -FilePath $PSScriptRoot\Example31-Tabbing.html -ShowHTML {
    New-HTMLTabStyle -SelectorColor Grey
    foreach ($Domain in $Forest.Domains) {

        $Objects = @(
            Get-ADComputer -Server $Domain -Filter * -Properties OperatingSystem, OperatingSystemVersion, PasswordLastSet | Select-Object -Property DNSHostName, Name, Enabled, OperatingSystem, OperatingSystemVersion, PasswordLastSet
            Get-ADUser -Server $Domain -Filter * -Properties SamAccountName, Name, Title, Surname, PasswordNeverExpires, WhenCreated, WhenChanged | Select-Object UserPrincipalName, SamAccountName, Name, Title, Surname, PasswordNeverExpires, WhenCreated, WhenChanged #-First 17
        )
        $DataTableIDUsers = Get-Random -Minimum 100000 -Maximum 2000000
        $DataTableIDComputers = Get-Random -Minimum 100000 -Maximum 2000000

        New-HTMLTab -TabName "Domain $Domain" -IconSolid dice {
            New-HTMLSection -HeaderText 'Active Directory Computers & Diagram' -HeaderBackGroundColor Grey {
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Objects -DataTableID $DataTableIDComputers
                }
                New-HTMLPanel {
                    New-HTMLDiagram {
                        New-DiagramNode -Label 'Domain' -To 'AD Computers', 'AD Users' -IconBrands delicious -IconColor Red
                        New-DiagramNode -Label 'AD Computers' -IconBrands apple -IconColor Black
                        New-DiagramNode -Label 'AD Users' -IconBrands instagram -IconColor Yellow
                        New-DiagramEvent -ID $DataTableIDUsers -ColumnID 1
                        New-DiagramEvent -ID $DataTableIDComputers -ColumnID 1
                        foreach ($_ in $Objects) {
                            New-DiagramNode -Label $_.Name -IconSolid server -To 'AD Computers' -IconColor Green
                        }
                    }
                }
            }
        }
    }
} -Online