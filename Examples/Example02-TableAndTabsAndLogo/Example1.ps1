Import-Module .\PSWriteHTML.psd1 -Force

$Allusers = Get-ADUser -Filter * | Select-Object -First 10

New-HTML -TitleText $ReportTitle -Online -FilePath "$PSScriptRoot\Example1.html" {
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText "Groups 1" {
            New-HTMLPanel {
                New-HTMLTable -DataTable $Allusers -Buttons searchPanes
            }
        }
        New-HTMLSection -HeaderText "Groups 2" {

        }
    }
} -ShowHTML