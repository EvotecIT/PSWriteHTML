Import-Module .\PSWriteHTML.psd1 -Force

$ReportTitle = 'Test'
#$EnterpriseAdminTable = Get-ADuser -Filter * | Select-Object Name, Surname, Enabled, DisplayName
$EnterpriseAdminTable = Get-Process | Select-Object -First 5

New-HTML -TitleText $ReportTitle -Online -FilePath "$PSScriptRoot\Example4.html" {
    New-HTMLTab -TabName 'Dashboard' {
        New-HTMLContent -HeaderText "Groups" {
            New-HTMLContent -HeaderText 'Domain Administrators' -CanCollapse {
                New-HTMLTable -DataTable $EnterpriseAdminTable -Verbose
            }
            New-HTMLContent -HeaderText 'Domain Administrators' -CanCollapse {
                New-HTMLTable -DataTable $EnterpriseAdminTable -Verbose
            }
        }
        New-HTMLContent -HeaderText 'Test 2' {

        }
    }
    New-HTMLTab -TabName 'Something' {

    }
} -ShowHTML