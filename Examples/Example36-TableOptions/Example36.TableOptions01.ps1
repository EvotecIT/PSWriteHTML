$Processes = Get-Process | Select-Object -First 2 -Property Name, ID, HandleCount, WorkingSet
$Title = 'My title'

New-HTML -TitleText $Title -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example13.html {

    <#
    New-HTMLContent -HeaderText '0 section' {
        New-HTMLPanel {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter #-ImmediatelyShowHiddenDetails
        }
        New-HTMLPanel {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
    }
    #>
    New-HTMLContent -HeaderText '1 section' {
        New-HTMLTable -ArrayOfObjects $Processes -HideFooter {
            New-HTMLTableHeader -Names 'ID', 'HandleCount' -ResponsiveOperations none
        } -ImmediatelyShowHiddenDetails
    }
    New-HTMLContent -HeaderText '2 section' {
        New-HTMLTable -ArrayOfObjects $Processes -HideFooter {
            New-HTMLTableHeader -Names 'ID', 'HandleCount' -ResponsiveOperations none
        } -ImmediatelyShowHiddenDetails -HideShowButton
    }
    New-HTMLContent -HeaderText '3 section' {
        New-HTMLTable -ArrayOfObjects $Processes -HideFooter {
            New-HTMLTableHeader -Names 'ID', 'HandleCount' -ResponsiveOperations none
        } -ImmediatelyShowHiddenDetails -HideShowButton -DisableResponsiveTable
    }
    New-HTMLContent -HeaderText '4 section' {
        New-HTMLTable -ArrayOfObjects $Processes -HideFooter {
            New-HTMLTableHeader -Names 'ID', 'HandleCount', 'WorkingSet' -ResponsiveOperations none
        }
    }
    <#
    New-HTMLContent -Invisible {
        New-HTMLPanel {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
        New-HTMLPanel {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter

        }
    }
    New-HTMLPanel {
        New-HTMLTable -ArrayOfObjects $Processes -HideFooter

    }
    #>
} -ShowHTML