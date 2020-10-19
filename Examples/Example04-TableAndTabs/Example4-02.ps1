Import-Module .\PSWriteHTML.psd1 -Force

$ReportTitle = 'Test'
#$EnterpriseAdminTable = Get-ADuser -Filter * | Select-Object Name, Surname, Enabled, DisplayName
$EnterpriseAdminTable = Get-Process | Select-Object -First 5

New-HTML -TitleText $ReportTitle -Online -FilePath "$PSScriptRoot\Example4-02.html" {
    New-HTMLTab -TabName 'Dashboard1' {
        New-HTMLTab -Name 'Test1' {
            New-HTMLSection -HeaderText "Groups" {
                New-HTMLTable -DataTable $EnterpriseAdminTable {
                    New-TableHeader -Color Red -Title 'This shows standard table with header'
                }
            }
            New-HTMLSection -HeaderText 'Test 2' {
                New-HTMLTable -DataTable $EnterpriseAdminTable {
                    New-TableHeader -Color Red -Title 'This shows standard table with header'
                }
            }
        }
        New-HTMLTab -Name 'Test2' {
            New-HTMLSection -HeaderText "Groups" {
                New-HTMLTable -DataTable $EnterpriseAdminTable {
                    New-TableHeader -Color Red -Title 'This shows standard table with header'
                }
            }
            New-HTMLSection -HeaderText 'Test 2' {
                New-HTMLTable -DataTable $EnterpriseAdminTable {
                    New-TableHeader -Color Red -Title 'This shows standard table with header'
                }
            }
        }
    }
    New-HTMLTab -TabName 'Something1' {

    }
} -ShowHTML