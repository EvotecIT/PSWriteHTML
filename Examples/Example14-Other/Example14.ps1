Import-Module PSWriteHTML.psd1 -Force
$Processes = Get-Process | Select-Object -First 2
$Processes1 = Get-Process | Select-Object -First 10
$Title = 'My title'

New-HTML -TitleText $Title -Online -FilePath $PSScriptRoot\Example14.html -AutoRefresh 30 {

    New-HTMLSection -HeaderText '0 section' -CanCollapse {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -HideFooter
        }
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes1 -HideFooter
        }
        New-HTMLPanel {

        }
        New-HTMLPanel {

        }
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes1 -HideFooter
        }
    }
    New-HTMLSection -HeaderText '1 section' {
        New-HTMLTable -DataTable $Processes -HideFooter
    }
} -ShowHTML