Import-Module .\PSWriteHTML.psd1 -Force

Dashboard -TitleText 'My charts' -Online -FilePath $PSScriptRoot\Example-Diagrams02_DashimoStyle.html {
    Diagram -Height 'calc(100vh - 20px)' {
        DiagramOptionsInteraction -Hover $true
        DiagramOptionsPhysics -Enabled $false
        DiagramNode -Label '1 test' -To '3', '6', '7' -ColorBackground Bisque
        DiagramNode -Label '2' -To '5', '1 test'
        DiagramNode -Label '3'
        DiagramNode -Label '4'
        DiagramNode -Label '5'
        DiagramNode -Label '6' -To '5' -ColorBorder Aquamarine -ColorBackground Yellow
        DiagramNode -Label '7' -To '5' -ColorHighlightBackground Red
        DiagramNode -Label '8' -To '5' -ColorHoverBorder Yellow
    }
} -ShowHTML