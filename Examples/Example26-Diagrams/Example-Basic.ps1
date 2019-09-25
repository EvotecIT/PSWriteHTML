Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My diagram' -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example-Basic.html {
    New-HTMLTabOptions -SlimTabs
    New-HTMLTab -Name 'Diagrams' -IconRegular arrow-alt-circle-left {
        New-HTMLSection -HeaderText 'Diagram - Defaults' -CanCollapse {
            New-HTMLPanel {
                New-HTMLDiagram {
                    New-DiagramOptionsInteraction -Hover $true
                    #New-DiagramOptionsManipulation
                    New-DiagramNode -Label '1 test' -To '3','6','7' -Background Bisque
                    New-DiagramNode -Label '2' -To 'Przemyslaw Klys','1 test'
                    New-DiagramNode -Label '3'
                    New-DiagramNode -Label 'Size based on name' -Shape database -Size 10
                    New-DiagramNode -Label 'Przemyslaw Klys'
                    New-DiagramNode -Label '6' -To 'Przemyslaw Klys' -Border Aquamarine -Background Yellow
                    New-DiagramNode -Label '7' -To 'Przemyslaw Klys' -HighlightBackground Red -Shape diamond
                    New-DiagramNode -Label '8' -To 'Przemyslaw Klys' -HoverBorder Yellow -Shape diamond
                }
            }
            #New-HTMLPanel {
                #New-HTMLTable -DataTable (Get-Process | Select-Object -First 5)
            #}
        }
    }
} -ShowHTML