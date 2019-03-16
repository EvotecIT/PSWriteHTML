Import-Module PSWriteHTML -Force

$Time = Start-TimeLog

$ReportTitle = 'Test'
$ReportPath = "$PSScriptRoot\Example2.html"

$DomainAdminTable = Get-ADForest | Select-Object ForestMode, Name, RootDomain, SchemaMaster
$EnterpriseAdminTable = Get-ADuser -Filter * | Select-Object Name, Surname, Enabled, DisplayName
$Allusers = Get-AdUser -Filter *


$Report = New-HTML -TitleText $ReportTitle -UseCssLinks -UseJavaScriptLinks {
    New-HTMLLogo
    New-HTMLTab -TabName 'Dashboard' {
        New-HTMLContent -HeaderText "Groups" {
            New-HTMLContent -HeaderText 'Domain Administrators' -CanCollapse {
                New-HTMLTable $DomainAdminTable -HideFooter
            }
        }
        New-HTMLContent -HeaderText 'Test Group' -CanCollapse {
            New-HTMLPanel -Count 2 {
                New-HTMLContent -HeaderText 'Enterprise Administrators' {
                    New-HTMLTable $EnterpriseAdminTable -HideFooter
                }
            }
            New-HTMLPanel -Count 2 {
                New-HTMLContent -HeaderText 'Enterprise Administrators' {
                    New-HTMLTable $EnterpriseAdminTable -HideFooter
                }
            }
        }
        New-HTMLContent -HeaderText "Groups 1" {
            New-HTMLPanel -Count 1 {
                New-HTMLTable $DomainAdminTable -HideFooter
            }
            New-HTMLPanel -Count 1 {
                New-HTMLTable $DomainAdminTable -HideFooter
            }
        }
        New-HTMLContent -HeaderText "Groups 2" {
            New-HTMLPanel -Count 1 {
                New-HTMLTable $Allusers
            }
        }
        New-HTMLContent -HeaderText "Groups 3" -CanCollapse {
            New-HTMLPanel -Count 4 {
                New-HTMLTable $Allusers -HideFooter
            }
            New-HTMLPanel -Count 4 {
                New-HTMLTable $Allusers -HideFooter
            }
            New-HTMLPanel -Count 4 {
                New-HTMLTable $Allusers -HideFooter
            }
            New-HTMLPanel -Count 4 {
                New-HTMLTable $Allusers -HideFooter
            }
        }
    }
    New-HTMLTab -TabName 'Something' {
        
    }
}
Save-HTML -HTML $Report -FilePath $ReportPath -ShowHTML

Stop-TimeLog -Time $Time -Option OneLiner