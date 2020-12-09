Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My diagram' -Online:$true -FilePath $PSScriptRoot\Example-Basic.Wizard.html {
    New-HTMLWizard {
        New-HTMLWizardStep -Name 'Step 1' {
            New-HTMLPanel {
                New-HTMLDiagram {
                    New-DiagramNode -Label '1 test' -To '3', '6', '7' -ColorBackground Bisque
                    New-DiagramNode -Label '2' -To 'Przemyslaw Klys', '1 test'
                }
            }
        }
        New-HTMLWizardStep -Name 'Step 2' {
            New-HTMLDiagram {
                New-DiagramOptionsLayout -HierarchicalEnabled $true #-HierarchicalDirection FromLeftToRight #-HierarchicalSortMethod directed
                New-DiagramOptionsPhysics -Enabled $true -HierarchicalRepulsionAvoidOverlap 1 -HierarchicalRepulsionNodeDistance 200

                New-DiagramNode -Label '1 test' -To '3', '6', '7' -ColorBackground Bisque
                New-DiagramNode -Label '2' -To 'Przemyslaw Klys', '1 test'
                New-DiagramNode -Label '3' -To 'Przemyslaw Klys', '1 test'
                New-DiagramNode -Label '4' -To 'Przemyslaw Klys', '1 test'
                New-DiagramNode -Label '5' -To 'Przemyslaw Klys', '1 test'
                New-DiagramNode -Label '6' -To 'Przemyslaw Klys', '1 test'
                New-DiagramNode -Label '7' -To 'Przemyslaw Klys', '1 test'
                New-DiagramNode -Label '8' -To 'Przemyslaw Klys', '1 test'
                New-DiagramNode -Label '9' -To 'Przemyslaw Klys', '1 test'
            }
            New-HTMLDiagram {
                New-DiagramNode -Label '1 test' -To '3', '6', '7' -ColorBackground Bisque
                New-DiagramNode -Label '2' -To 'Przemyslaw Klys', '1 test'
            }
        }
        New-HTMLWizardStep -Name 'Step 3' {
            New-HTMLPanel {
                New-HTMLDiagram {
                    New-DiagramNode -Label '1 test' -To '3', '6', '7' -ColorBackground Bisque
                    New-DiagramNode -Label '2' -To 'Przemyslaw Klys', '1 test'
                }
            }
        }
    } -RemoveDoneStepOnNavigateBack -Theme arrows -ToolbarButtonPosition center
} -ShowHTML