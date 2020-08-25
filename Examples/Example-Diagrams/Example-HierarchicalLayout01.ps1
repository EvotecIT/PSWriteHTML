Import-Module .\PSWriteHTML.psd1 -Force

$ShapeTypes = @('circle', 'dot', 'diamond', 'ellipse', 'database', 'box', 'square', 'triangle', 'triangleDown', 'text', 'star', 'hexagon')

New-HTML -TitleText 'My Ubiquiti Network' -Online -FilePath "$PSScriptRoot\Example-HierarchicalLayout01.html" {
    New-HTMLSection -HeaderText 'Diagram - My Network' -CanCollapse {
        New-HTMLPanel {
            New-HTMLDiagram -Height '1000px' {
                New-DiagramOptionsInteraction -Hover $true
                #New-DiagramOptionsManipulation
                New-DiagramOptionsPhysics
                New-DiagramOptionsLayout -RandomSeed 500 -HierarchicalEnabled $true
                New-DiagramNode -Label 'USG Pro' -To 'Unifi Switch'
                New-DiagramNode -Label 'Unifi Switch' -To 'Unifi AP', 'EvoWin'
                New-DiagramNode -Label 'Unifi AP' -To 'EvoMac', 'EvoWin' -Shape hexagon
                New-DiagramNode -Label 'EvoMac' -Shape ellipse
                New-DiagramNode -Label 'EvoWin' -To 'Exch1','Exch2','AD1','AD2','AD3','DC1','DC2' -Shape database
                New-DiagramNode -Label 'Exch1' -Shape diamond
                New-DiagramNode -Label 'Exch2' -Shape box
                New-DiagramNode -Label 'AD1'
                New-DiagramNode -Label 'AD2' -IconBrands apple -IconColor Bisque
                New-DiagramNode -Label 'AD3' -IconRegular address-card
                New-DiagramNode -Label 'DC1' -IconSolid address-book
                New-DiagramNode -Label 'DC2' -IconSolid address-card -IconColor Green -To '17000','17001'
                New-DiagramNode -ID '17000' -Label 'DC2'
                New-DiagramNode -ID '17001' -Label 'DC2'
                foreach ($_ in $ShapeTypes) {
                    New-DiagramNode -Label $_ -Shape $_ -To 'Unifi Switch'
                }
            }
        }
        New-HTMLPanel {
            New-HTMLTable -DataTable (Get-Process | Select-Object -First 5)
        }
    }
} -ShowHTML
