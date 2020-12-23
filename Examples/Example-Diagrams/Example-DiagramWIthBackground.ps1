Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My charts' -Online -FilePath $PSScriptRoot\Example-DiagramWIthBackground.html {
    New-HTMLTabStyle -SlimTabs
    New-HTMLTab -Name 'Diagrams' -IconRegular arrow-alt-circle-left {
        New-HTMLSection -HeaderText 'Diagram - Defaults' -CanCollapse {
            New-HTMLPanel {
                New-HTMLDiagram {
                    New-DiagramOptionsInteraction -Hover $true
                    #New-DiagramOptionsManipulation
                    New-DiagramNode -Label '1 test' -To '3','6','7' -ColorBackground Bisque
                    New-DiagramNode -Label '2' -To 'Przemyslaw Klys','1 test'
                    New-DiagramNode -Label '3'
                    New-DiagramNode -Label 'Size based on name' -Shape database -Size 10
                    New-DiagramNode -Label 'Przemyslaw Klys'
                    New-DiagramNode -Label '6' -To 'Przemyslaw Klys' -ColorBorder Aquamarine -ColorBackground Yellow
                    New-DiagramNode -Label '7' -To 'Przemyslaw Klys' -ColorHighlightBackground Red -Shape diamond
                    New-DiagramNode -Label '8' -To 'Przemyslaw Klys' -ColorHoverBorder Yellow -Shape diamond
                } -BackGroundImage 'https://cdn.imgbin.com/5/2/1/imgbin-bart-simpson-homer-simpson-supreme-drawing-bart-simpson-bard-simpsons-jAfrtPtYNPTK5rQrcKULn5XBn.jpg' #-BundleImages
            }
        }
    }
} -ShowHTML