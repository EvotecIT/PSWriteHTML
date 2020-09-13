Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My diagram' -FilePath $PSScriptRoot\Example-Easy6.html {
    New-HTMLSection -Invisible {
        New-HTMLSection {
            New-HTMLDiagram {
                New-DiagramNode -Label 'One node' -To 'Second node', 'Third node' -ColorBackground Bisque
                New-DiagramNode -Label 'Second node'
            } -DisableLoadingBar
        }
        New-HTMLSection -Height 1000px {

        }
        New-HTMLPanel {
            New-HTMLText -Text 'Test'
        } -AlignContentText right
    }
} -ShowHTML -Online

<#

#>

New-HTML -TitleText 'My diagram' -FilePath $PSScriptRoot\Example-Easy7.html {
    New-HTMLDiagram {
        New-DiagramNode -Label 'One node' -To 'Second node', 'Third node' -ColorBackground Bisque
        New-DiagramNode -Label 'Second node'
    } -DisableLoadingBar
} -ShowHTML -Online