Import-Module .\PSWriteHTML.psd1 -Force

$ReportTitle = 'Test'

$DomainAdminTable = Get-ADForest | Select-Object ForestMode, Name, RootDomain, SchemaMaster
$EnterpriseAdminTable = Get-ADUser -Filter * | Select-Object Name, Surname, Enabled, DisplayName
$Allusers = Get-ADUser -Filter *

New-HTML -TitleText $ReportTitle -Online -FilePath "$PSScriptRoot\Example2.html" {
    New-HTMLLogo
    New-HTMLTab -TabName 'Dashboard' {
        New-HTMLSection -HeaderText "Groups" {
            New-HTMLSection -HeaderText 'Domain Administrators' -CanCollapse {
                New-HTMLTable -DataTable $DomainAdminTable -HideFooter
            }
        }
        New-HTMLSection -HeaderText 'Test Group' -CanCollapse {
            New-HTMLPanel {
                New-HTMLSection -HeaderText 'Enterprise Administrators' {
                    New-HTMLTable -DataTable $EnterpriseAdminTable -HideFooter
                }
            }
            New-HTMLPanel {
                New-HTMLSection -HeaderText 'Enterprise Administrators' {
                    New-HTMLTable -DataTable $EnterpriseAdminTable -HideFooter
                }
            }
        }
        New-HTMLSection -HeaderText "Groups 1" {
            New-HTMLPanel {
                New-HTMLTable -DataTable $DomainAdminTable -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $DomainAdminTable -HideFooter
            }
        }
        New-HTMLSection -HeaderText "Groups 2" {
            New-HTMLPanel {
                New-HTMLTable -DataTable $Allusers
            }
        }
        New-HTMLSection -HeaderText "Groups 3" -CanCollapse {
            New-HTMLPanel {
                New-HTMLTable  -DataTable $Allusers -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Allusers -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Allusers -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Allusers -HideFooter
            }
        }
    }
    New-HTMLTab -TabName 'Something' {

    }
} -ShowHTML