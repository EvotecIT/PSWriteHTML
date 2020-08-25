Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My diagram' -Online -FilePath $PSScriptRoot\Example-Easy.html {
    New-HTMLPanel {
        New-HTMLDiagram {
            New-DiagramNode -Label 'One node' -To 'Second node', 'Third node' -ColorBackground Bisque
            New-DiagramNode -Label 'Second node'
            New-DiagramNode -Label 'Third node'
        }
    }
} -ShowHTML