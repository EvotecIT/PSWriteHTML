Import-Module .\PSWriteHTML.psd1 -Force

# Code Block for PowerShell Code (Showing how <pre> tags work)
$CodeBlock = @'

$HTML = New-HtmlPage -Name 'Test' -Online {
    New-HTMLTabHeader -TabNames 'Dashboard', 'Other'
    New-HTMLTab -TabName 'Dashboard' {
        New-HTMLSection -HeaderText 'Content' {
            New-HTMLPanel -Count 2 {
                New-HTMLSection -HeaderText 'My text' -CanCollapse {
                    New-HTMLTable -Simplify -DataTable $DomainAdminTable
                }
            }
            New-HTMLPanel -Count 2 {
                New-HTMLSection -HeaderText 'My text' -CanCollapse {
                    New-HTMLTable -Simplify -DataTable $DomainAdminTable
                }
            }
            New-HTMLSection -HeaderText 'My text 2' -CanCollapse {
                New-HTMLTable -DataTable $EnterpriseAdminTable
            }
        }
        New-HTMLSection -HeaderText 'This shows PowerShell Language' {
            Get-HTMLCodeBlock -Code $CodeBlock -Style 'PowerShell'
        }
    }
    New-HTMLTab -TabName 'Other' -TabHeading 'Test 2' {
        New-HTMLSection -HeaderText 'My other text' {
            New-HTMLTable -Simplify -DataTable $EnterpriseAdminTable
        }
    }
}
Save-HTML -FilePath $HTMLPath -ShowHTML -HTML $HTML

'@

# Code Block for JS Code (Showing how <pre> tags work)
$CodeBlockJS = @'
//refresh page on browser resize
$(window).bind("resize", function(e) {
    if (window.RT) clearTimeout(window.RT);
    window.RT = setTimeout(function() {
        this.location.reload(false); /* false to get page from cache */
    }, 200);
});
'@

# Code Block for XML Code (Showing how <pre> tags work)
$CodeBlocksXML = @'
<!--?xml version="1.0" encoding="UTF-8"?-->
<building name="GlobalDynamics Main Building"
    core:id="0xFA8A91C6617DFA1B" core:uid="0898213-123123123-1230898123" xmlns:core="http://www.xmlnamespace.tld">
  <core:group core:level="2">
    <room number="123">Conference Room A</room>
    <room number="124">Conference Room B</room>
    <room number="125">Conference Room C</room>
    <room number="126">Conference Room D</room>
  </core:group>
  <core:group core:level="2">
    <room number="17">John's Office</room>
            <room number="19">Eric's Office</room>
  </core:group>
  <core:group core:level="1">
    <room number="091">Mainframe Housing A</room>
    <room number="092">Mainframe Housing B</room>
    <room number="090">Mainframe Power Supply Station</room>
    <room number="089">Mainframe Backup Power Supply Station</room>
  </core:group>
  <core:group core:level="8">
    <room number="1717" role="cto">CTO Office</room>
    <room number="1819" role="ceo">CEO Office</room>
    <room number="1820" role="cfo">
      <x_room label="k89121">Lab01</x_room>
    </room>
  </core:group>
</building>
'@

New-HTML -Online -FilePath "$PSScriptRoot\CodeBlocks02.html" -ShowHTML {
    New-HTMLTab -TabName 'Coding' {
        New-HTMLSection -HeaderText 'This shows PowerShell Language' {
            New-HTMLCodeBlock -Code $CodeBlock -Style 'PowerShell' -Group 'Test123' -Title 'PowerShell Code 1' -Theme godzilla -Highlight '2-5, 13'
            New-HTMLCodeBlock -Code $CodeBlock -Style 'PowerShell' -Group 'Test123' -Title 'PowerShell Code 2'
        }
        New-HTMLSection -HeaderText 'This shows PowerShell Language' {
            New-HTMLCodeBlock -Code $CodeBlockJS -Style 'JavaScript' -Theme enlighter -Highlight '2, 5'
        }
        New-HTMLSection -HeaderText 'XML Language Minimal Theme' {
            New-HTMLCodeBlock -Code $CodeBlocksXML -Style 'xml' -Highlight '12, 19' -Theme minimal
        }
        New-HTMLSection -HeaderText 'XML Language - Monokai Theme' {
            New-HTMLCodeBlock -Code $CodeBlocksXML -Style 'xml' -Highlight '12, 19' -Theme monokai
        }
        New-HTMLSection -HeaderText 'XML Language - bootstrap4 Theme' {
            New-HTMLCodeBlock -Code $CodeBlocksXML -Style 'xml' -Highlight '12, 19' -Theme bootstrap4
        }
        New-HTMLSection -HeaderText 'XML Language - Classic Theme' {
            New-HTMLCodeBlock -Code $CodeBlocksXML -Style 'xml' -Highlight '12, 19' -Theme classic
        }
    }
    New-HTMLTab -TabName 'Other' {
        New-HTMLPanel {
            New-HTMLCodeBlock {
                Install-Module PSWriteHTML
            }
        }
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
        New-HTMLPanel {
            New-HTMLSpanStyle -FontSize 10pt {
                New-HTMLWizard {
                    New-HTMLWizardStep -Name 'Prepare environment' {
                        New-HTMLText -Text "To be able to execute actions in automated way please install required modules. Those modules will be installed straight from Microsoft PowerShell Gallery."
                        New-HTMLCodeBlock -Code {
                            Install-Module GPOZaurr -Force
                            Import-Module GPOZaurr -Force
                        } -Style powershell
                        New-HTMLText -Text "Once installed you're ready for next step."
                    }
                    New-HTMLWizardStep -Name 'Prepare report' {
                        New-HTMLText -Text "Depending when this report was run you may want to prepare new report before proceeding with removal. To generate new report please use:"
                        New-HTMLCodeBlock -Code {
                            Show-GPOZaurr -FilePath $Env:UserProfile\Desktop\GPOZaurr-BrokenGPOS.html -Verbose -Type GPOOrphans
                        }
                        New-HTMLText -Text "Once confirmed the data is the same or requires fixing please proceed with next step."
                    }
                    New-HTMLWizardStep -Name 'Execute with test' {
                        New-HTMLText -TextBlock {
                            'Following command when executed runs cleanup procedure that removes all broken GPOs on SYSVOL side. '
                            "Make sure when running it for the first time to run it with WhatIf parameter as shown below to prevent accidental removal."
                        }
                        New-HTMLCodeBlock -Code {
                            Remove-GPOZaurrBroken -Type SYSVOL -WhatIf
                        }
                        New-HTMLText -TextBlock {
                            "After execution please review proposed changes and if you're confident that output is correct execute following command: "
                        }
                        New-HTMLCodeBlock -Code {
                            Remove-GPOZaurrBroken -Type SYSVOL -LimitProcessing 2 -BackupPath $Env:UserProfile\Desktop\GPOSYSVOLBackup
                        }
                        New-HTMLText -TextBlock {
                            "This command when executed deletes only first X broken GPOs. Use LimitProcessing parameter to prevent mass delete and increase the counter when no errors occur."
                            "Repeat step above as much as possible increating LimitProcessing count till there's nothing left. "
                        }

                    }
                    New-HTMLWizardStep -Name 'Execute' {

                    }
                    New-HTMLWizardStep -Name 'Finish' {

                    }
                } -RemoveDoneStepOnNavigateBack
            }
        }
    }
}