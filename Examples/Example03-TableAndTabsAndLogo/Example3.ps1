Import-Module .\PSWriteHTML.psd1 -Force

$Time = Start-TimeLog

$ReportTitle = 'Test'

$DomainAdminTable = Get-ADForest | Select-Object ForestMode, Name, RootDomain, SchemaMaster

$ImageLink = 'https://evotec.xyz/wp-content/uploads/2015/05/Logo-evotec-012.png'

New-HTML -TitleText $ReportTitle -UseJavaScriptLinks -UseCssLinks -FilePath "$PSScriptRoot\Example3.html" {
    New-HTMLLogo -RightLogoString $ImageLink
    New-HTMLTab -TabName 'Dashboard' {
        New-HTMLContent  -HeaderText "Groups" {
            New-HTMLContent -HeaderText 'Domain Administrators' -CanCollapse {
                New-HTMLPanel {
                    New-HTMLTable -DataTable $DomainAdminTable -HideFooter
                }
            }
        }
    }
    New-HTMLTab -TabName 'Something' {

    }
    New-HTMLTab -TabName 'This is very long title' {

    }
    New-HTMLTab -TabName 'This is long title' {

    }
} -ShowHTML

Stop-TimeLog -Time $Time -Option OneLiner