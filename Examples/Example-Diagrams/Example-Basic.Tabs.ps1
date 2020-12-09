Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My diagram' -Online:$true -FilePath $PSScriptRoot\Example-Basic.Tabs.html {
    New-HTMLTabStyle -SlimTabs
    New-HTMLTab -Name 'Diagram 1' -IconRegular arrow-alt-circle-left {
        New-HTMLPanel {
            New-HTMLDiagram {
                New-DiagramNode -Label '1 test' -To '3', '6', '7' -ColorBackground Bisque
                New-DiagramNode -Label '2' -To 'Przemyslaw Klys', '1 test'
            }
        }
    }
    New-HTMLTab -Name 'Diagrams 2' -IconRegular arrow-alt-circle-left {
        New-HTMLDiagram {
            New-DiagramNode -Label '1 test' -To '3', '6', '7' -ColorBackground Bisque
            New-DiagramNode -Label '2' -To 'Przemyslaw Klys', '1 test'
        }
        New-HTMLDiagram {
            New-DiagramNode -Label '1 test' -To '3', '6', '7' -ColorBackground Bisque
            New-DiagramNode -Label '2' -To 'Przemyslaw Klys', '1 test'
        }
    }
    New-HTMLTab -Name 'Diagram 3' -IconRegular arrow-alt-circle-left {
        New-HTMLPanel {
            New-HTMLDiagram {
                New-DiagramNode -Label '1 test' -To '3', '6', '7' -ColorBackground Bisque
                New-DiagramNode -Label '2' -To 'Przemyslaw Klys', '1 test'
            }
        }
    }
} -ShowHTML