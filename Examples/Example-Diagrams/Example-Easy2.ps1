Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My diagram' -Online -FilePath $PSScriptRoot\Example-Easy2.html {
    New-HTMLSection {
        New-HTMLDiagram {
            New-DiagramNode -Label 'One node' -To 'Second node', 'Third node' -ColorBackground Bisque
            New-DiagramNode -Label 'Second node'
            New-DiagramNode -Label 'Third node' -IconBrands amazon -IconColor Brown
            New-DiagramNode -Label 'Bart Simson' -Image 'https://cdn.imgbin.com/5/2/1/imgbin-bart-simpson-homer-simpson-supreme-drawing-bart-simpson-bard-simpsons-jAfrtPtYNPTK5rQrcKULn5XBn.jpg' -To 'Second node'
        } #-DisableLoadingBar
    }
} -ShowHTML