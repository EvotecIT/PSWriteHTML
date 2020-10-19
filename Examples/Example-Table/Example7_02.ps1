Import-Module .\PSWriteHTML.psd1 -Force
$Processes = Get-Process | Select-Object -First 10

New-HTML -TitleText 'Title' -Online -FilePath $PSScriptRoot\Example7_02.html -ShowHTML {

    New-HTMLSection -HeaderText '0 section' -BackgroundColor SkyBlue {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -HideFooter
        }
    }

    New-HTMLSection -HeaderText '-1 section' -CanCollapse {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -HideFooter
        }
    }

    New-HTMLSection -HeaderText '1st section' -CanCollapse -HeaderTextAlignment center {
        New-HTMLPanel {

            New-HTMLTable -DataTable $Processes -HideFooter
        }
        New-HTMLPanel {

            New-HTMLTable -DataTable $Processes -HideFooter
        }
        New-HTMLPanel {

            New-HTMLTable -DataTable $Processes -HideFooter
        }
        New-HTMLPanel -BackgroundColor Lime {

            New-HTMLTable -DataTable $Processes -HideFooter
        }
        New-HTMLPanel -BackgroundColor LimeGreen {

            New-HTMLTable -DataTable $Processes -HideFooter
        }
    }
    New-HTMLSection -HeaderText '2nd section' -BackgroundColor Seashell {
        New-HTMLPanel {

            New-HTMLTable -DataTable $Processes -HideFooter
        }
        New-HTMLPanel {

            New-HTMLTable -DataTable $Processes -HideFooter
        }
        New-HTMLPanel {

            New-HTMLTable -DataTable $Processes -HideFooter
        }
    }
}