Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My charts' -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example-Diagrams02_DashimoStyle.html {
    Diagram {
        DiagramOptionsInteraction -Hover $true
        DiagramNode -Label '1 test' -To '3', '6', '7' -Background Bisque
        DiagramNode -Label '2' -To '5', '1 test'
        DiagramNode -Label '3'
        DiagramNode -Label '4'
        DiagramNode -Label '5'
        DiagramNode -Label '6' -To '5' -Border Aquamarine -Background Yellow
        DiagramNode -Label '7' -To '5' -HighlightBackground Red
        DiagramNode -Label '8' -To '5' -HoverBorder Yellow
    }
} -ShowHTML