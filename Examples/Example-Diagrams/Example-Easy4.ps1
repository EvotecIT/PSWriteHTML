Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My diagram' -FilePath $PSScriptRoot\Example-Easy6.html {
    New-HTMLSection -Invisible {
        New-HTMLSection {
            New-HTMLDiagram {
                New-DiagramNode -Label 'One node' -To 'Second node', 'Third node' -ColorBackground Bisque
                New-DiagramNode -Label 'Second node'
                New-DiagramNode -IconBrands accessible-icon -Label 'Test'
            } #-DisableLoader
        }
        New-HTMLSection -Height 1000px {
            New-HTMLDiagram {
                New-DiagramNode -Label 'One node' -To 'Second node', 'Third node' -ColorBackground Bisque
                New-DiagramNode -Label 'Second node'
            } -DisableLoader
        }
    }
} -ShowHTML -Online