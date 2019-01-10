Import-Module "..\PSWriteHTML\PSWriteHTML.psd1" -Force

$DomainAdminTable = Get-ADForest | Select-Object ForestMode, Name, RootDomain, SchemaMaster
$EnterpriseAdminTable = Get-ADuser -Filter * | Select-Object Name, Surname, Enabled, DisplayName
$Allusers = Get-AdUser -Filter *

$HTMLPath = "$PSScriptRoot\Example5.html"

$HTML = New-HtmlPage -Name 'Test' -UseCssLinks -UseStyleLinks {
    New-HTMLTabHeader -TabNames 'Dashboard', 'Other'
    New-HTMLTab -TabName 'Dashboard' -TabHeading 'Test' {
        New-HTMLContent -HeaderText 'Content' {
            New-HTMLColumn -ColumnNumber 1 -ColumnCount 2 {
                New-HTMLContent -HeaderText 'My text' -CanCollapse {
                    Get-HTMLContentTable -ArrayOfObjects $DomainAdminTable
                }
            }
            New-HTMLColumn -ColumnNumber 2 -ColumnCount 2 {
                New-HTMLContent -HeaderText 'My text' -CanCollapse {
                    Get-HTMLContentTable -ArrayOfObjects $DomainAdminTable
                }
            }
            New-HTMLContent -HeaderText 'My text 2' -CanCollapse {
                Get-HTMLContentDataTable -ArrayOfObjects $EnterpriseAdminTable
            }
        }
    }
    New-HTMLTab -TabName 'Other' -TabHeading 'Test 2' {
        New-HTMLContent -HeaderText 'My other text' {
            Get-HTMLContentTable -ArrayOfObjects $EnterpriseAdminTable
        }
    }
}
Save-HTML -FilePath $HTMLPath -ShowHTML -HTML $HTML