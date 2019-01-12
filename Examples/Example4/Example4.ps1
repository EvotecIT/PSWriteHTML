Import-Module PSWriteHTML -Force

$Time = Start-TimeLog

$ReportTitle = 'Test'

$ReportPath = "$PSScriptRoot\Example4.html"

$DomainAdminTable = Get-ADForest | Select-Object ForestMode, Name, RootDomain, SchemaMaster
$EnterpriseAdminTable = Get-ADuser -Filter * | Select-Object Name, Surname, Enabled, DisplayName
$Allusers = Get-AdUser -Filter *

$TabNames = 'Dashboard', 'Something'

$Report = New-HTMLPage -TitleText $ReportTitle -HideLogos -AddAuthor -HideDate -UseCssLinks -UseStyleLinks -Verbose {
    New-HTMLTabHeader -TabNames $TabNames
    New-HTMLTab -TabName 'Dashboard' {
        New-HTMLContent -HeaderText "Groups" {
            New-HTMLContent -BackgroundShade 1 -HeaderText 'Domain Administrators' -CanCollapse {
                Get-HTMLContentTable -DataTable $DomainAdminTable -Verbose
            }
        }
    }
}
Save-HTML -HTML $Report -FilePath $ReportPath -ShowHTML
Stop-TimeLog -Time $Time -Option OneLiner