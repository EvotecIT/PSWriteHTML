Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My charts' -Online -FilePath $PSScriptRoot\Example-Diagrams01.html {
    New-HTMLTabStyle -SlimTabs
    New-HTMLTab -Name 'Diagrams' -IconRegular arrow-alt-circle-left {
        New-HTMLSection -HeaderText 'Diagram - Defaults' -CanCollapse {
            New-HTMLSection -Height '1000px' {
                New-HTMLDiagram {
                    New-DiagramOptionsInteraction -Hover $true
                    #New-DiagramOptionsManipulation
                    New-DiagramNode -Label '1 test' -To '3', '6', '7' -ColorBackground Bisque
                    New-DiagramNode -Label '2' -To 'Przemyslaw Klys', '1 test'
                    New-DiagramNode -Label '3'
                    New-DiagramNode -Label 'Size based on name' -Shape database -Size 10
                    New-DiagramNode -Label 'Przemyslaw Klys'
                    New-DiagramNode -Label '6' -To 'Przemyslaw Klys' -ColorBorder Aquamarine -ColorBackground Yellow
                    New-DiagramNode -Label '7' -To 'Przemyslaw Klys' -ColorHighlightBackground Red -Shape diamond
                    New-DiagramNode -Label '8' -To 'Przemyslaw Klys' -ColorHoverBorder Yellow -Shape diamond
                }
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable (Get-Process | Select-Object -First 2)
            }
            <#
            New-HTMLDiagram {
                New-DiagramOptionsInteraction -Hover $true
                #New-DiagramOptionsManipulation
                New-DiagramNode -Label '1 test' -To '3', '6', '7' -ColorBackground Bisque
                New-DiagramNode -Label '2' -To 'Przemyslaw Klys', '1 test'
                New-DiagramNode -Label '3'
                New-DiagramNode -Label 'Size based on name' -Shape database -Size 10
                New-DiagramNode -Label 'Przemyslaw Klys'
                New-DiagramNode -Label '6' -To 'Przemyslaw Klys' -ColorBorder Aquamarine -ColorBackground Yellow
                New-DiagramNode -Label '7' -To 'Przemyslaw Klys' -ColorHighlightBackground Red -Shape diamond
                New-DiagramNode -Label '8' -To 'Przemyslaw Klys' -ColorHoverBorder Yellow -Shape diamond
            }
            #>
        }
    }
} -ShowHTML