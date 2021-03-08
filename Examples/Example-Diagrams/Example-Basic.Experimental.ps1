Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My diagram' -Online -FilePath $PSScriptRoot\Example-Basic.Experimental.html {
    New-HTMLTabStyle -SlimTabs
    New-HTMLTab -Name 'Diagrams' -IconRegular arrow-alt-circle-left {
        New-HTMLSection -HeaderText 'Diagram - Defaults' -CanCollapse {
            New-HTMLPanel {
                New-HTMLDiagram {
                    # This uses a bit unspported conversion from HTML to SVG (works as an image)
                    New-DiagramNode -Label '1 test' -To '3', '6', '7' -HtmlTextBox {
                        # This is highly experimental, not sure it even will work
                        # Requires a lot more work
                        New-HTMLText -Text @(
                            'This is advanced text '
                            'Very advanced'
                            'Super Advanced'
                        ) -Color Red, Blue, Orange -FontSize 25px
                    }
                    New-DiagramNode -Label '2' -To 'Przemyslaw Klys', '1 test'
                    New-DiagramNode -Label '3' -Title 'my new popup'
                    New-DiagramNode -Label 'HTML Test <b>ok</b>' -FontMulti html
                    New-DiagramNode -Label 'Limited <u>HTML</u>' -FontMulti html
                    New-DiagramNode -Label 'Size based on name' -Shape database -Size 10 -Title "Long Line`nIn another line"
                    New-DiagramNode -Label 'Przemyslaw Klys' -Title $Title -FontMulti html
                    New-DiagramNode -Label '6' -To 'Przemyslaw Klys' -ColorBorder Aquamarine -ColorBackground Yellow
                    New-DiagramNode -Label '7' -To 'Przemyslaw Klys' -ColorHighlightBackground Red -Shape diamond
                    New-DiagramNode -Label '8' -To 'Przemyslaw Klys' -ColorHoverBorder Yellow -Shape diamond
                }
            }
        }
    }
} -ShowHTML