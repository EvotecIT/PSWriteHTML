Import-Module PSWriteHTML -Force

$Time = Start-TimeLog

$ReportTitle = 'Test'

$DomainAdminTable = Get-ADForest | Select-Object ForestMode, Name, RootDomain, SchemaMaster
$EnterpriseAdminTable = Get-ADuser -Filter * | Select-Object Name, Surname, Enabled, DisplayName
$Allusers = Get-AdUser -Filter *


New-HTML -TitleText $ReportTitle -UseCssLinks -UseJavaScriptLinks -FilePath "$PSScriptRoot\Example2.html" {
    New-HTMLLogo
    New-HTMLTab -TabName 'Dashboard' {
        New-HTMLContent -HeaderText "Groups" {
            New-HTMLContent -HeaderText 'Domain Administrators' -CanCollapse {
                New-HTMLTable $DomainAdminTable -HideFooter
            }
        }
        New-HTMLContent -HeaderText 'Test Group' -CanCollapse {
            New-HTMLPanel {
                New-HTMLContent -HeaderText 'Enterprise Administrators' {
                    New-HTMLTable $EnterpriseAdminTable -HideFooter
                }
            }
            New-HTMLPanel {
                New-HTMLContent -HeaderText 'Enterprise Administrators' {
                    New-HTMLTable $EnterpriseAdminTable -HideFooter
                }
            }
        }
        New-HTMLContent -HeaderText "Groups 1" {
            New-HTMLPanel {
                New-HTMLTable $DomainAdminTable -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable $DomainAdminTable -HideFooter
            }
        }
        New-HTMLContent -HeaderText "Groups 2" {
            New-HTMLPanel {
                New-HTMLTable $Allusers
            }
        }
        New-HTMLContent -HeaderText "Groups 3" -CanCollapse {
            New-HTMLPanel {
                New-HTMLTable $Allusers -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable $Allusers -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable $Allusers -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable $Allusers -HideFooter
            }
        }
    }
    New-HTMLTab -TabName 'Something' {

    }
}
Save-HTML -HTML $Report -FilePath $ReportPath -ShowHTML

Stop-TimeLog -Time $Time -Option OneLiner