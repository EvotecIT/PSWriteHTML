Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My Ubiquiti Network' -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example-NodesEdgesOptions.html {
    New-HTMLSection -HeaderText 'Diagram - My Network' -CanCollapse {
        New-HTMLPanel {
            New-HTMLDiagram {
                New-DiagramOptionsInteraction -Hover $true
                New-DiagramOptionsPhysics
                New-DiagramOptionsLayout -RandomSeed 500  
                New-DiagramOptionsEdges -ArrowsToEnabled $true -Color Red            
                New-DiagramNode -Label 'USG Pro' -To 'Unifi Switch'
                New-DiagramNode -Label 'Unifi Switch' -To 'Unifi AP', 'EvoWin'
                New-DiagramNode -Label 'Unifi AP' -To 'EvoMac', 'EvoWin' -Shape hexagon
                New-DiagramNode -Label 'EvoMac' -Shape ellipse
                New-DiagramNode -Label 'EvoWin' -To 'Exch1','Exch2','AD1','AD2','AD3','DC1','DC2' -Shape database
                New-DiagramNode -Label 'Exch1' -Shape diamond
                New-DiagramNode -Label 'Exch2' -Shape box
                New-DiagramNode -Label 'AD1'
                New-DiagramNode -Label 'AD2' -IconBrands apple
                New-DiagramNode -Label 'AD3' -IconRegular address-card
                New-DiagramNode -Label 'DC1' -IconSolid address-book
                New-DiagramNode -Label 'DC2' -IconSolid address-card
           }
        }
    }
} -ShowHTML
