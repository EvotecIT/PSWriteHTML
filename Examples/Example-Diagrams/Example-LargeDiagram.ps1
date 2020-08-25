Import-Module PSWriteHTML -Force

New-HTML -TitleText 'My Ubiquiti Network' -Online -FilePath $PSScriptRoot\Example-LargeDiagram.html {
    New-HTMLSection -HeaderText 'Diagram - My Network' -CanCollapse {
        New-HTMLDiagram -Height '1000px' {
            #New-DiagramOptionsInteraction -Hover $true
            #New-DiagramOptionsManipulation
            #New-DiagramOptionsPhysics
            #New-DiagramOptionsLayout -RandomSeed 500

            New-DiagramNode -Label 'Forest'
            New-DiagramNode -Label 'Domain1'
            New-DiagramNode -Label 'Domain2'
            New-DiagramNode -Label 'Domain3'

            New-DiagramLink -From 'Forest' -To 'Domain1'
            New-DiagramLink -From 'Domain1' -To 'Domain2'
            New-DiagramLink -From 'Domain2' -To 'Domain3'
            New-DiagramLink -From 'Forest' -To 'Domain3'
            New-DiagramLink -From 'Forest' -To 'Domain2'


            for ($i = 0; $i -lt 300; $i++) {
                New-DiagramNode -Label "Connection1$i" -To 'Domain1'
            }
            for ($i = 0; $i -lt 300; $i++) {
                New-DiagramNode -Label "Connection2$i" -To 'Domain2'
            }
            for ($i = 0; $i -lt 300; $i++) {
                New-DiagramNode -Label "Connection3$i" -To 'Domain3'
            }
        }
    }
} -ShowHTML