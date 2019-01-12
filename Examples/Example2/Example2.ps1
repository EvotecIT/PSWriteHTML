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
            New-HTMLContent -BackgroundShade 1 -HeaderText 'Domain Administrators' -CanCollapse {
                Get-HTMLContentDataTable $DomainAdminTable -HideFooter
            }
        }

        New-HTMLContent -HeaderText 'Test Group' -CanCollapse -BackgroundShade 1 {
            New-HTMLColumn -ColumnNumber 1 -ColumnCount 2 {
                New-HTMLContent -HeaderText 'Enterprise Administrators' {
                    Get-HTMLContentDataTable $EnterpriseAdminTable -HideFooter
                }
            }

            New-HTMLColumn -ColumnNumber 2 -ColumnCount 2 {
                New-HTMLContent -HeaderText 'Enterprise Administrators' {
                    Get-HTMLContentDataTable $EnterpriseAdminTable -HideFooter
                }
            }
        }

        New-HTMLContent -HeaderText "Groups 1" {

            New-HTMLColumn -ColumnNumber 1 -ColumnCount 1 {
                Get-HTMLContentDataTable $DomainAdminTable -HideFooter
            }
            New-HTMLColumn -ColumnNumber 1 -ColumnCount 1 {
                Get-HTMLContentDataTable $DomainAdminTable -HideFooter
            }

        }


        New-HTMLContent -HeaderText "Groups 2" {

            New-HTMLColumn -ColumnNumber 1 -ColumnCount 1 {
                Get-HTMLContentDataTable $Allusers
            }

        }

        New-HTMLContent -HeaderText "Groups 3" {

            New-HTMLColumn -ColumnNumber 1 -ColumnCount 4 {
                Get-HTMLContentDataTable $Allusers -HideFooter
            }

            New-HTMLColumn -ColumnNumber 2 -ColumnCount 4 {
                Get-HTMLContentDataTable $Allusers -HideFooter
            }



            New-HTMLColumn -ColumnNumber 3 -ColumnCount 4 {
                Get-HTMLContentDataTable $Allusers -HideFooter
            }

            New-HTMLColumn -ColumnNumber 4 -ColumnCount 4 {
                Get-HTMLContentDataTable $Allusers -HideFooter
            }

        }
    }
}
Save-HTML -HTML $Report -FilePath $ReportPath -ShowHTML

Stop-TimeLog -Time $Time -Option OneLiner