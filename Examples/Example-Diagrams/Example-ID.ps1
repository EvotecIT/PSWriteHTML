Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My Ubiquiti Network' -Online -FilePath $PSScriptRoot\Example-ID.html {
    New-HTMLSection -HeaderText 'Diagram - My Network' -CanCollapse {
        New-HTMLDiagram -Height '1000px' {
            New-DiagramOptionsInteraction -Hover $true
            #New-DiagramOptionsManipulation
            New-DiagramOptionsPhysics
            New-DiagramOptionsLayout -RandomSeed 500
            New-DiagramNode -Label 'DC2' -IconSolid address-card -IconColor Green -To '17000', '17001'
            New-DiagramNode -ID '17000' -Label 'DC2'
            New-DiagramNode -ID '17001' -Label 'DC2'
        }
    }
} -ShowHTML