Import-Module .\PSWriteHTML.psd1 -Force

$ReportTitle = 'Test'

$DomainAdminTable = Get-ADForest | Select-Object ForestMode, Name, RootDomain, SchemaMaster
$EnterpriseAdminTable = Get-ADUser -Filter * | Select-Object Name, Surname, Enabled, DisplayName
$Allusers = Get-ADUser -Filter *

New-HTML -TitleText $ReportTitle -UseCssLinks -UseJavaScriptLinks -FilePath "$PSScriptRoot\Example2.html" {
    New-HTMLLogo
    New-HTMLTab -TabName 'Dashboard' {
        New-HTMLContent -HeaderText "Groups" {
            New-HTMLContent -HeaderText 'Domain Administrators' -CanCollapse {
                New-HTMLTable -DataTable $DomainAdminTable -HideFooter
            }
        }
        New-HTMLContent -HeaderText 'Test Group' -CanCollapse {
            New-HTMLPanel {
                New-HTMLContent -HeaderText 'Enterprise Administrators' {
                    New-HTMLTable -DataTable $EnterpriseAdminTable -HideFooter
                }
            }
            New-HTMLPanel {
                New-HTMLContent -HeaderText 'Enterprise Administrators' {
                    New-HTMLTable -DataTable $EnterpriseAdminTable -HideFooter
                }
            }
        }
        New-HTMLContent -HeaderText "Groups 1" {
            New-HTMLPanel {
                New-HTMLTable -DataTable $DomainAdminTable -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $DomainAdminTable -HideFooter
            }
        }
        New-HTMLContent -HeaderText "Groups 2" {
            New-HTMLPanel {
                New-HTMLTable -DataTable $Allusers
            }
        }
        New-HTMLContent -HeaderText "Groups 3" -CanCollapse {
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