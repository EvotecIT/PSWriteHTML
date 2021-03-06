Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {
    New-HTMLTab -Name 'Health State' {
        New-HTMLPanel {
            New-HTMLText -TextBlock {
                "Following table shows list of all group policies and their status in AD and SYSVOL. Due to different reasons it's "
                "possible that "
            } -FontSize 10pt
            New-HTMLList -Type Unordered {
                New-HTMLListItem -Text 'Group Policies on SYSVOL, but no details in AD: ', $NotAvailableInAD.Count -FontWeight normal, bold
                New-HTMLListItem -Text 'Group Policies in AD, but no content on SYSVOL: ', $NotAvailableOnSysvol.Count -FontWeight normal, bold
                New-HTMLListItem -Text "Group Policies which couldn't be assed due to permissions issue: ", $NotAvailablePermissionIssue.Count -FontWeight normal, bold
            } -FontSize 10pt
            New-HTMLText -Text "Follow the steps below table to get Active Directory Group Policies in healthy state." -FontSize 10pt
        }
        New-HTMLPanel -Invisible {
            New-HTMLText -TextBlock {
                "Following table shows list of all group policies and their status in AD and SYSVOL. Due to different reasons it's "
                "possible that "
            } -FontSize 10pt
            New-HTMLList -Type Unordered {
                New-HTMLListItem -Text 'Group Policies on SYSVOL, but no details in AD: ', $NotAvailableInAD.Count -FontWeight normal, bold
                New-HTMLListItem -Text 'Group Policies in AD, but no content on SYSVOL: ', $NotAvailableOnSysvol.Count -FontWeight normal, bold
                New-HTMLListItem -Text "Group Policies which couldn't be assed due to permissions issue: ", $NotAvailablePermissionIssue.Count -FontWeight normal, bold
            } -FontSize 10pt
            New-HTMLText -Text "Follow the steps below table to get Active Directory Group Policies in healthy state." -FontSize 10pt
        }
        New-HTMLSection {
            New-HTMLText -TextBlock {
                "Following table shows list of all group policies and their status in AD and SYSVOL. Due to different reasons it's "
                "possible that "
            } -FontSize 10pt
            New-HTMLList -Type Unordered {
                New-HTMLListItem -Text 'Group Policies on SYSVOL, but no details in AD: ', $NotAvailableInAD.Count -FontWeight normal, bold
                New-HTMLListItem -Text 'Group Policies in AD, but no content on SYSVOL: ', $NotAvailableOnSysvol.Count -FontWeight normal, bold
                New-HTMLListItem -Text "Group Policies which couldn't be assed due to permissions issue: ", $NotAvailablePermissionIssue.Count -FontWeight normal, bold
            } -FontSize 10pt
            New-HTMLText -Text "Follow the steps below table to get Active Directory Group Policies in healthy state." -FontSize 10pt
        }
        New-HTMLSection -Invisible {
            New-HTMLText -TextBlock {
                "Following table shows list of all group policies and their status in AD and SYSVOL. Due to different reasons it's "
                "possible that "
            } -FontSize 10pt
            New-HTMLList -Type Unordered {
                New-HTMLListItem -Text 'Group Policies on SYSVOL, but no details in AD: ', $NotAvailableInAD.Count -FontWeight normal, bold
                New-HTMLListItem -Text 'Group Policies in AD, but no content on SYSVOL: ', $NotAvailableOnSysvol.Count -FontWeight normal, bold
                New-HTMLListItem -Text "Group Policies which couldn't be assed due to permissions issue: ", $NotAvailablePermissionIssue.Count -FontWeight normal, bold
            } -FontSize 10pt
            New-HTMLText -Text "Follow the steps below table to get Active Directory Group Policies in healthy state." -FontSize 10pt
        }
        New-HTMLSection {
            New-HTMLPanel -Invisible {
                New-HTMLText -TextBlock {
                    "Following table shows list of all group policies and their status in AD and SYSVOL. Due to different reasons it's "
                    "possible that "
                } -FontSize 10pt
                New-HTMLList -Type Unordered {
                    New-HTMLListItem -Text 'Group Policies on SYSVOL, but no details in AD: ', $NotAvailableInAD.Count -FontWeight normal, bold
                    New-HTMLListItem -Text 'Group Policies in AD, but no content on SYSVOL: ', $NotAvailableOnSysvol.Count -FontWeight normal, bold
                    New-HTMLListItem -Text "Group Policies which couldn't be assed due to permissions issue: ", $NotAvailablePermissionIssue.Count -FontWeight normal, bold
                } -FontSize 10pt
                New-HTMLText -Text "Follow the steps below table to get Active Directory Group Policies in healthy state." -FontSize 10pt
            }
        }
        New-HTMLSection -Invisible {
            New-HTMLPanel -Invisible {
                New-HTMLText -TextBlock {
                    "Following table shows list of all group policies and their status in AD and SYSVOL. Due to different reasons it's "
                    "possible that "
                } -FontSize 10pt
                New-HTMLList -Type Unordered {
                    New-HTMLListItem -Text 'Group Policies on SYSVOL, but no details in AD: ', $NotAvailableInAD.Count -FontWeight normal, bold
                    New-HTMLListItem -Text 'Group Policies in AD, but no content on SYSVOL: ', $NotAvailableOnSysvol.Count -FontWeight normal, bold
                    New-HTMLListItem -Text "Group Policies which couldn't be assed due to permissions issue: ", $NotAvailablePermissionIssue.Count -FontWeight normal, bold
                } -FontSize 10pt
                New-HTMLText -Text "Follow the steps below table to get Active Directory Group Policies in healthy state." -FontSize 10pt
            }
        }
        New-HTMLContainer {
            New-HTMLText -TextBlock {
                "Following table shows list of all group policies and their status in AD and SYSVOL. Due to different reasons it's "
                "possible that "
            } -FontSize 10pt
            New-HTMLList -Type Unordered {
                New-HTMLListItem -Text 'Group Policies on SYSVOL, but no details in AD: ', $NotAvailableInAD.Count -FontWeight normal, bold
                New-HTMLListItem -Text 'Group Policies in AD, but no content on SYSVOL: ', $NotAvailableOnSysvol.Count -FontWeight normal, bold
                New-HTMLListItem -Text "Group Policies which couldn't be assed due to permissions issue: ", $NotAvailablePermissionIssue.Count -FontWeight normal, bold
            } -FontSize 10pt
            New-HTMLText -Text "Follow the steps below table to get Active Directory Group Policies in healthy state." -FontSize 10pt
        }

        New-HTMLSection -Invisible {
            New-HTMLContainer -Width '400px' -Margin 'auto' {
                New-HTMLText -TextBlock {
                    "Following table shows list of all group policies and their status in AD and SYSVOL. Due to different reasons it's "
                    "possible that "
                } -FontSize 10pt
                New-HTMLList -Type Unordered {
                    New-HTMLListItem -Text 'Group Policies on SYSVOL, but no details in AD: ', $NotAvailableInAD.Count -FontWeight normal, bold
                    New-HTMLListItem -Text 'Group Policies in AD, but no content on SYSVOL: ', $NotAvailableOnSysvol.Count -FontWeight normal, bold
                    New-HTMLListItem -Text "Group Policies which couldn't be assed due to permissions issue: ", $NotAvailablePermissionIssue.Count -FontWeight normal, bold
                } -FontSize 10pt
                New-HTMLText -Text "Follow the steps below table to get Active Directory Group Policies in healthy state." -FontSize 10pt
            }
        }
        New-HTMLSection -HeaderText 'Containers Test 70/30' {
            New-HTMLContainer {
                New-HTMLPanel {
                    New-HTMLText -Text 'Test'
                }
            }
            New-HTMLContainer {
                New-HTMLPanel {
                    New-HTMLText -Text 'Test'
                }
            } -Width 30%
        }

        New-HTMLSection -HeaderText 'Section Test 70/30' {
            New-HTMLSection {
                New-HTMLPanel {
                    New-HTMLText -Text 'Test'
                }
            }
            New-HTMLSection -Width 30% {
                New-HTMLPanel {
                    New-HTMLText -Text 'Test'
                }
            }
        }
        New-HTMLSection -HeaderText 'Section Test 100' {
            New-HTMLSection {
                New-HTMLPanel {
                    New-HTMLText -Text 'Test'
                }
            }
            New-HTMLSection {
                New-HTMLPanel {
                    New-HTMLText -Text 'Test'
                }
            }
        }
    }
} -Online -FilePath $PSScriptRoot\ContainerPanelSection01.html -TitleText 'Container Panel Section 01' -ShowHTML