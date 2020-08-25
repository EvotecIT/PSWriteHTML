Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My Ubiquiti Network' -Online -FilePath "$PSScriptRoot\Example-HierarchicalLayout04.html" {
    New-HTMLSection -HeaderText 'Diagram - My Network' -CanCollapse {
        New-HTMLDiagram -Height '1000px' {
            New-DiagramOptionsLayout -RandomSeed 500 -HierarchicalEnabled $true -HierarchicalDirection FromLeftToRight
            New-DiagramNode -Label 'DC2' -IconSolid address-card -IconColor Green -Level 1
            New-DiagramNode -ID '17000' -Label 'DC2' -Level 2 -To 'DC2'
            New-DiagramNode -ID '17001' -Label 'DC2' -Level 2 -To 'DC2'
            New-DiagramNode -Label 'DC3' -Level 3 -To '17001'
            New-DiagramNode -Label 'DC4' -Level 3 -To '17001'
            New-DiagramNode -Label 'Fourth Level' -Level 4 -To 'DC4'
        }
    }
} -ShowHTML