Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My diagram' -FilePath $PSScriptRoot\Example-HierarchicalLayout02.html {
    New-HTMLDiagram -Height '1000px' {
        New-DiagramOptionsLayout -HierarchicalEnabled $true -HierarchicalDirection FromUpToDown #-HierarchicalSortMethod directed
        New-DiagramOptionsPhysics -Enabled $false
        New-DiagramNode -Label 'One node' -ColorBackground Bisque -Level 1
        New-DiagramNode -Label 'Second node' -Level 1
        New-DiagramNode -Label 'Third node' -IconBrands amazon -IconColor Brown -Level 3
        New-DiagramNode -Label 'Fourth node' -IconRegular building -IconColor Brown -Level 4
        New-DiagramNode -Label 'Fifth node' -IconSolid align-left -IconColor Brown -Level 4
        New-DiagramNode -Level 4 -Label 'Bart Simson' -Image 'https://cdn.imgbin.com/5/2/1/imgbin-bart-simpson-homer-simpson-supreme-drawing-bart-simpson-bard-simpsons-jAfrtPtYNPTK5rQrcKULn5XBn.jpg' -To 'Second node'
        New-DiagramLink -Label 'Super Connection' -From 'Fourth node' -To 'Bart Simson'
        New-DiagramLink -From 'One node' -To 'Second Node'
        New-DiagramLink -From 'One node' -To 'Third node'
        New-DiagramLink -From 'Third node' -To 'Fourth node'
        New-DiagramLink -From 'Fifth node' -To 'Bart Simson'
    }
} -ShowHTML -Online