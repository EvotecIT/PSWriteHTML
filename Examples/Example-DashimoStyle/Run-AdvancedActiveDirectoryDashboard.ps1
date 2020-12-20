Import-Module .\PSWriteHTML.psd1 -Force
Import-Module PSWinDocumentation.AD -Force
Import-Module PSWinReportingV2

if ($null -eq $DataSetForest) {
    $DataSetForest = Get-WinADForestInformation -Verbose -DontRemoveEmpty -PasswordQuality -Splitter "`r`n"
}
if ($null -eq $DataSetEvents) {
   $DataSetEvents = Find-Events -Report ADUserChangesDetailed, ADUserChanges, ADUserLockouts, ADUserStatus, ADGroupChanges -Servers 'AD1', 'AD2' -DatesRange Last7days -Quiet
}

Dashboard -Name 'Dashimo Test' -FilePath $PSScriptRoot\Output\DashboardActiveDirectory.html -Show {
    Tab -Name 'Forest' {
        Section -Name 'Forest Information' -Invisible {
            Section -Name 'Forest Information' {
                Table -HideFooter -DataTable $DataSetForest.ForestInformation
            }
            Section -Name 'FSMO Roles' {
                Table -HideFooter -DataTable $DataSetForest.ForestFSMO
            }

        }
        Section -Name 'Forest Domain Controllers' -Collapsable {
            Panel {
                Table -HideFooter -DataTable $DataSetForest.ForestDomainControllers
            }
        }
        Section -Name 'Forest Optional Features / UPN Suffixes / SPN Suffixes' -Collapsable {

            Panel {
                Table -HideFooter -DataTable $DataSetForest.ForestOptionalFeatures -Verbose
            }
            Panel {
                Table -HideFooter -DataTable $DataSetForest.ForestUPNSuffixes -Verbose
            }
            Panel {
                Table -HideFooter -DataTable $DataSetForest.ForestSPNSuffixes -Verbose
            }
        }
        Section -Name 'Sites / Subnets / SiteLinks' -Collapsable {
            Panel {
                Table -HideFooter -DataTable $DataSetForest.ForestSites -Verbose
            }
            Panel {
                Table -HideFooter -DataTable $DataSetForest.ForestSubnets -Verbose
            }
            Panel {
                Table -HideFooter -DataTable $DataSetForest.ForestSiteLinks -Verbose
            }
        }
    }

    foreach ($Domain in $DataSetForest.FoundDomains.Keys) {
        Tab -Name $Domain {
            Section -Name 'Domain Controllers / FSMO Roles' {
                Panel {
                    Table -HideFooter -DataTable $DataSetForest.FoundDomains.$Domain.DomainControllers -Verbose
                }
                Panel {
                    Table -HideFooter -DataTable $DataSetForest.FoundDomains.$Domain.DomainFSMO -Verbose
                }
            }


            Section -Name 'Password Policies' -Invisible {
                Section -Name 'Default Password Policy' {
                    Table -HideFooter -DataTable $DataSetForest.FoundDomains.$Domain.DomainDefaultPasswordPolicy -Verbose
                }

                Section -Name 'Domain Fine Grained Policies' {
                    Table -HideFooter -DataTable $DataSetForest.FoundDomains.$Domain.DomainFineGrainedPolicies -Verbose
                }
            }
            Section -Name 'Users' {
                Panel {
                    Table -HideFooter -DataTable $DataSetForest.FoundDomains.$Domain.DomainUsers
                }
            }
            Section -Name 'Computers' {
                Panel {
                    Table -HideFooter -DataTable $DataSetForest.FoundDomains.$Domain.DomainComputers
                }
            }
            Section -Name 'Groups Priviliged' {
                Panel {
                    Table -HideFooter -DataTable $DataSetForest.FoundDomains.$Domain.DomainGroupsPriviliged
                }
                Panel {
                    #Chart -DataTable $DataSetForest.FoundDomains.'ad.evotec.xyz'.DomainGroupsPriviliged -DataNames 'Group Name' -DataCategories $DataSetForest.FoundDomains.'ad.evotec.xyz'.DomainGroupsPriviliged.'Members Count' -DataValues 'Members Count'
                }
            }
            Section -Name 'Organizational Units' {
                Table -HideFooter -DataTable $DataSetForest.FoundDomains.$Domain.DomainOrganizationalUnits
            }
            Section -Name 'OU ACL Basic' {
                Panel {
                    Table -HideFooter -DataTable $DataSetForest.FoundDomains.$Domain.DomainOrganizationalUnitsBasicACL
                }
            }
            Section -Name 'OU ACL Extended' {
                Panel {
                    Table -HideFooter -DataTable $DataSetForest.FoundDomains.$Domain.DomainOrganizationalUnitsExtended
                }
            }

        }
    }
    Tab -Name 'Changes in Last 7 days' {
        Section -Name 'Group Changes' -Collapsable {
            Table -HideFooter -DataTable $DataSetEvents.ADGroupChanges
        }
        Section -Name 'User Status' -Collapsable {
            Table -HideFooter -DataTable $DataSetEvents.ADUserStatus
        }
        Section -Name 'User Changes' -Collapsable {
            Table -HideFooter -DataTable $DataSetEvents.ADGroupChanges
        }
        Section -Name 'User Lockouts' -Collapsable {
            Table -HideFooter -DataTable $DataSetEvents.ADUserStatus
        }
    }
}