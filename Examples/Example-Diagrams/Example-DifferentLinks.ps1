Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -FilePath $PSScriptRoot\Example-DifferentLinks.html {
    New-HTMLDiagram {
        New-DiagramNode -Label 2
        New-DiagramNode -LABEL 3
        New-DiagramLink -from 2 -to 3 -label 'ello' -ArrowsToEnabled $true
        New-DiagramLink -from 2 -to 3 -Label 'test' -ArrowsFromEnabled $true
    }
} -ShowHTML -Online