Import-Module .\PSWriteHTML.psd1 -Force

$Computers = Get-ADComputer -Filter * -Properties OperatingSystem, OperatingSystemVersion, PasswordLastSet | Select-Object -Property DNSHostName, Name, Enabled, OperatingSystem, OperatingSystemVersion, PasswordLastSet
$Users = Get-ADUser -Filter * -Properties SamAccountName, Name, Title, Surname, PasswordNeverExpires, WhenCreated, WhenChanged | Select-Object UserPrincipalName, SamAccountName, Name, Title, Surname, PasswordNeverExpires, WhenCreated, WhenChanged #-First 17

New-HTML -TitleText 'My Title' -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example30-LinkedTable.html -ShowHTML {
    #New-HTMLLogo
    New-HTMLTab -TabName 'Test' {
        New-HTMLContent -HeaderText '0 section' {
            New-HTMLPanel {
                New-HTMLTable -DataTable $Computers -DataTableID 'OtherTable'
            }
            New-HTMLPanel {
                New-HTMLDiagram -Height '500px' {
                    New-DiagramNode -Label 'Domain' -To 'AD Computers', 'AD Users' -IconBrands delicious
                    New-DiagramNode -Label 'AD Computers' -IconBrands apple
                    New-DiagramNode -Label 'AD Users' -IconBrands instagram
                    New-DiagramEvent -ID 'SpecialID123' #5-FadeSearch
                    New-DiagramEvent -ID 'OtherTable'
                    foreach ($_ in $Computers) {
                        if ($_.OperatingSystem -like '*Server*') {
                            New-DiagramNode -Label $_.Name -IconSolid server -To 'AD Computers'
                        } else {
                            New-DiagramNode -Label $_.Name -IconSolid desktop -To 'AD Computers'
                        }
                    }
                    foreach ($_ in $Users) {
                        New-DiagramNode -Label $_.SamAccountName -To 'AD Users' -IconRegular user-circle
                    }
                }
            }
        }
        New-HTMLSection {
            New-HTMLTable -DataTable $Users -DataTableID 'SpecialID123'  #-DisablePaging
        }
    }
}