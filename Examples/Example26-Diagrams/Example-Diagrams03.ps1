Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My Ubiquiti Network' -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example-Diagrams03.html {

    New-HTMLSection -HeaderText 'Diagram - My Network' -CanCollapse {
        New-HTMLPanel {
            New-HTMLDiagram {
                New-DiagramOptionsInteraction -Hover $true
                #New-DiagramOptionsManipulation
                New-DiagramNode -Label 'USG Pro' -To 'Unifi Switch'
                New-DiagramNode -Label 'Unifi Switch' -To 'Unifi AP', 'EvoWin'
                New-DiagramNode -Label 'Unifi AP' -To 'EvoMac', 'EvoWin'
                New-DiagramNode -Label 'EvoMac'
                New-DiagramNode -Label 'EvoWin' -To 'Exch1','Exch2','AD1','AD2','AD3','DC1','DC2'
                New-DiagramNode -Label 'Exch1'
                New-DiagramNode -Label 'Exch2'
                New-DiagramNode -Label 'AD1'
                New-DiagramNode -Label 'AD2' -IconBrands 500px -Shape icon
                New-DiagramNode -Label 'AD3'
                New-DiagramNode -Label 'DC1'
                New-DiagramNode -Label 'DC2'
            }
        }
        New-HTMLPanel {
            #New-HTMLTable -DataTable (Get-Process | Select-Object -First 5)
        }
    }

} -ShowHTML