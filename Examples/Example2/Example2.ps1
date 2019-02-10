Import-Module PSWriteHTML -Force

$Time = Start-TimeLog

$ReportTitle = 'Test'
$ReportPath = "$PSScriptRoot\Example2.html"

$DomainAdminTable = Get-ADForest | Select-Object ForestMode, Name, RootDomain, SchemaMaster
$EnterpriseAdminTable = Get-ADuser -Filter * | Select-Object Name, Surname, Enabled, DisplayName
$Allusers = Get-AdUser -Filter *

$TabNames = 'Dashboard', 'Something'

$Report = New-HTML -TitleText $ReportTitle -HideLogos -Verbose -AddAuthor -HideDate -UseCssLinks -UseStyleLinks {
    New-HTMLTabHeader -TabNames $TabNames
    New-HTMLTab -TabName 'Dashboard' {
        New-HTMLContent -HeaderText "Groups" {
            New-HTMLContent -HeaderText 'Domain Administrators' -CanCollapse {
                New-HTMLTable $DomainAdminTable -HideFooter
            }
        }
        New-HTMLContent -HeaderText 'Test Group' -CanCollapse {
            New-HTMLColumn -ColumnCount 2 {
                New-HTMLContent -HeaderText 'Enterprise Administrators' {
                    New-HTMLTable $EnterpriseAdminTable -HideFooter
                }
            }
            New-HTMLColumn -ColumnCount 2 {
                New-HTMLContent -HeaderText 'Enterprise Administrators' {
                    New-HTMLTable $EnterpriseAdminTable -HideFooter
                }
            }
        }
        New-HTMLContent -HeaderText "Groups 1" {
            New-HTMLColumn -ColumnCount 1 {
                New-HTMLTable $DomainAdminTable -HideFooter
            }
            New-HTMLColumn -ColumnCount 1 {
                New-HTMLTable $DomainAdminTable -HideFooter
            }
        }
        New-HTMLContent -HeaderText "Groups 2" {
            New-HTMLColumn -ColumnCount 1 {
                New-HTMLTable $Allusers
            }
        }
        New-HTMLContent -HeaderText "Groups 3" {
            New-HTMLColumn -ColumnCount 4 {
                New-HTMLTable $Allusers -HideFooter
            }
            New-HTMLColumn -ColumnCount 4 {
                New-HTMLTable $Allusers -HideFooter
            }
            New-HTMLColumn -ColumnCount 4 {
                New-HTMLTable $Allusers -HideFooter
            }
            New-HTMLColumn -ColumnCount 4 {
                New-HTMLTable $Allusers -HideFooter
            }
        }
    }
}
Save-HTML -HTML $Report -FilePath $ReportPath -ShowHTML

Stop-TimeLog -Time $Time -Option OneLiner