$Processes = Get-Process | Select-Object -First 2 -Property Name, ID, HandleCount, WorkingSet
$Title = 'My title'

New-HTML -TitleText $Title -Online -FilePath $PSScriptRoot\Example13.html {

    <#
    New-HTMLSection -HeaderText '0 section' {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -HideFooter #-ImmediatelyShowHiddenDetails
        }
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -HideFooter
        }
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
    #>
    New-HTMLSection -HeaderText '1 section' {
        New-HTMLTable -DataTable $Processes -HideFooter {
            New-HTMLTableHeader -Names 'ID', 'HandleCount' -ResponsiveOperations none
        } -ImmediatelyShowHiddenDetails
    }
    New-HTMLSection -HeaderText '2 section' {
        New-HTMLTable -DataTable $Processes -HideFooter {
            New-HTMLTableHeader -Names 'ID', 'HandleCount' -ResponsiveOperations none
        } -ImmediatelyShowHiddenDetails -HideShowButton
    }
    New-HTMLSection -HeaderText '3 section' {
        New-HTMLTable -DataTable $Processes -HideFooter {
            New-HTMLTableHeader -Names 'ID', 'HandleCount' -ResponsiveOperations none
        } -ImmediatelyShowHiddenDetails -HideShowButton -DisableResponsiveTable
    }
    New-HTMLSection -HeaderText '4 section' {
        New-HTMLTable -DataTable $Processes -HideFooter {
            New-HTMLTableHeader -Names 'ID', 'HandleCount', 'WorkingSet' -ResponsiveOperations none
        }
    }
    <#
    New-HTMLSection -Invisible {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -HideFooter
        }
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -HideFooter

        }
    }
    New-HTMLPanel {
        New-HTMLTable -DataTable $Processes -HideFooter

    }
    #>
} -ShowHTML