Import-Module ..\PSWriteHTML -Force

$Time = Start-TimeLog

$ReportTitle = 'Test'
$ReportPath = "$PSScriptRoot\Example3.html"

$DomainAdminTable = Get-ADForest | Select-Object ForestMode, Name, RootDomain, SchemaMaster
$EnterpriseAdminTable = Get-ADuser -Filter * | Select-Object Name, Surname, Enabled, DisplayName
$Allusers = Get-AdUser -Filter *

$TabNames = 'Dashboard', 'Something'

$ImageLink = 'https://evotec.xyz/wp-content/uploads/2015/05/Logo-evotec-012.png'

$Report = New-HTML -TitleText $ReportTitle -AddAuthor -HideDate -RightLogoString $ImageLink -Verbose -UseStyleLinks -UseCssLinks {
    New-HTMLTabHeader -TabNames $TabNames
    New-HTMLTab -TabName 'Dashboard' {
        New-HTMLContent  -HeaderText "Groups" {    
            New-HTMLContent -HeaderText 'Domain Administrators' -CanCollapse {
                Get-HTMLContentDataTable -DataTable $DomainAdminTable -HideFooter
            }  
        }
    }
}

Save-HTML -HTML $Report -FilePath $ReportPath -ShowHTML

Stop-TimeLog -Time $Time -Option OneLiner