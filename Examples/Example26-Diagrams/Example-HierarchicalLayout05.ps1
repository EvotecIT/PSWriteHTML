Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My Ubiquiti Network' -Online -FilePath "$PSScriptRoot\Example-HierarchicalLayout05.html" {
    New-HTMLSection -HeaderText 'Diagram - My Network' -CanCollapse {
        New-HTMLDiagram -Height '1000px' {
            New-DiagramOptionsLayout -RandomSeed 500 -HierarchicalEnabled $true -HierarchicalDirection FromUpToDown
            New-DiagramOptionsLinks -FontSize 12 -WidthConstraint 90 -Length 200
            New-DiagramOptionsNodes -WidthConstraintMaximum 200 -Margin 10 -Shape box
            New-DiagramNode -ID 1 -Label "This is my very long title that I want to use on Level 1" -Level 1
            New-DiagramNode -ID 3 -Label "This is my very long title that I want to use on Level 2" -Level 2 -To 1
            New-DiagramNode -ID 4 -Label "This is my very long title that I want to use on Level 2" -Level 2 -To 1
            New-DiagramNode -ID 5 -Label "This is my very long title that I want to use on Level 3" -Level 3 -To 3
            New-DiagramNode -ID 6 -Label "This is my very long title that I want to use on Level 3" -Level 3 -To 3
            New-DiagramNode -ID 7 -Label "This is my very long title that I want to use on Level 4" -Level 4 -To 6
        }
    }
} -ShowHTML