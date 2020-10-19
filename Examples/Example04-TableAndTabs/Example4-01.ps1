Import-Module .\PSWriteHTML.psd1 -Force

$ReportTitle = 'Test'
#$EnterpriseAdminTable = Get-ADuser -Filter * | Select-Object Name, Surname, Enabled, DisplayName
$EnterpriseAdminTable = Get-Process | Select-Object -First 5

New-HTML -TitleText $ReportTitle -Online -FilePath "$PSScriptRoot\Example4-01.html" {
    New-HTMLTab -TabName 'Dashboard' {
        New-HTMLSection -HeaderText "Groups" {
            New-HTMLSection -HeaderText 'Domain Administrators' -CanCollapse {
                New-HTMLTable -DataTable $EnterpriseAdminTable {
                    New-TableHeader -Color Red -Title 'This shows standard table with header'
                }
            }
            New-HTMLSection -HeaderText 'Domain Administrators' -CanCollapse {
                New-HTMLTable -DataTable $EnterpriseAdminTable
            }
        }
        New-HTMLSection -HeaderText 'Test 2' {
            New-HTMLTable -DataTable $EnterpriseAdminTable
        }
    }
    New-HTMLTab -TabName 'Something' {
        New-HTMLTable -DataTable $EnterpriseAdminTable
    }
} -ShowHTML