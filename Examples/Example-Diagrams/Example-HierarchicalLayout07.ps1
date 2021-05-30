New-HTML -TitleText 'Test' -Online -FilePath "$PSScriptRoot\Example-HierarchicalLayout01.html" {
    New-HTMLSection -HeaderText 'Diagram - My Network' -CanCollapse {
        New-HTMLPanel {
            New-HTMLDiagram -Height '1000px' {
                New-DiagramOptionsLayout -RandomSeed 500 -HierarchicalEnabled $true -HierarchicalDirection FromLeftToRight
                New-DiagramNode -Label 'Node 1' -Level 0
                New-DiagramNode -Label 'Node 2' -Level 1
                New-DiagramNode -Label 'Node 3' -Level 1
                New-DiagramNode -Label 'Node 4' -Level 1
                New-DiagramNode -Label 'Node 5' -Level 2
                New-DiagramNode -Label 'Node 6' -Level 2 -Shape database
                New-DiagramNode -Label 'Node 7' -Level 3 -Image 'https://cdn4.iconfinder.com/data/icons/pretty-office-part-5-reflection-style/256/Examples.png'
                New-DiagramNode -Label 'Node 8' -Level 4

                New-DiagramNode -Label 'Node 4.1' -Level 2
                New-DiagramNode -Label 'Node 4.2' -Level 3

                New-DiagramLink -From 'Node 1' -To 'Node 2'
                New-DiagramLink -From 'Node 1' -To 'Node 3'
                New-DiagramLink -From 'Node 1' -To 'Node 4'
                New-DiagramLink -From 'Node 2' -To 'Node 5'
                New-DiagramLink -From 'Node 3' -To 'Node 6'
                New-DiagramLink -From 'Node 5' -To 'Node 7'
                New-DiagramLink -From 'Node 6' -To 'Node 7'
                New-DiagramLink -From 'Node 7' -To 'Node 8'
                New-DiagramLink -From 'Node 4' -To 'Node 4.1'
                New-DiagramLink -From 'Node 4.1' -To 'Node 4.2'

            }
        }
    }
} -ShowHTML
