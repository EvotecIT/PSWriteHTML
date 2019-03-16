Import-Module ..\PSWriteHTML -Force

$Time = Start-TimeLog

$ReportTitle = 'Test'
$ReportPath = "$PSScriptRoot\Example3.html"

$DomainAdminTable = Get-ADForest | Select-Object ForestMode, Name, RootDomain, SchemaMaster
$EnterpriseAdminTable = Get-ADuser -Filter * | Select-Object Name, Surname, Enabled, DisplayName
$Allusers = Get-AdUser -Filter *

$ImageLink = 'https://evotec.xyz/wp-content/uploads/2015/05/Logo-evotec-012.png'

$Report = New-HTML -TitleText $ReportTitle -UseJavaScriptLinks -UseCssLinks {
    New-HTMLLogo -RightLogoString $ImageLink
    New-HTMLTab -TabName 'Dashboard' {
        New-HTMLContent  -HeaderText "Groups" {    
            New-HTMLContent -HeaderText 'Domain Administrators' -CanCollapse {
                New-HTMLPanel -Count 1 {
                    New-HTMLTable -DataTable $DomainAdminTable -HideFooter
                }
            }  
        }
    }
    New-HTMLTab -TabName 'Something' {
        
    }
}

Save-HTML -HTML $Report -FilePath $ReportPath -ShowHTML

Stop-TimeLog -Time $Time -Option OneLiner