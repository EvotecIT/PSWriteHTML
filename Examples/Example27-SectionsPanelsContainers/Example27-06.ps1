Import-Module $PSScriptRoot\..\..\PSWriteHTML.psd1 -Force

$Test1 = Get-Process | Select-Object -First 1 -Property Name, Id, PriorityClass

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example27-06.html -Show {
    New-HTMLHeader {
        New-HTMLAnchor -Id 'top'
        New-HTMLSection -Invisible {
            New-HTMLPanel {
                New-HTMLAnchor -Href '#LastSection' -Text 'Link to last section in hidden panel'
            } -Invisible
            New-HTMLPanel {
                New-HTMLAnchor -Href '#LastPanel' -Text 'Link to last panel in hidden panel but to the right'
            } -Invisible -AlignContentText right
        }
        New-HTMLSection -Invisible {
            New-HTMLSection {
                New-HTMLAnchor -Href '#LastSection' -Text 'Link to last section in hidden section'
            } -Invisible
            New-HTMLSection {
                New-HTMLAnchor -Href '#LastPanel' -Text 'Link to last section in hidden section but to the right'
            } -Invisible -JustifyContent flex-end
        }
    }
    # New-HTMLMain is not nessecary but I like to use it when Header/Footer are present to distinguish how things are placed
    New-HTMLMain {
        New-HTMLTab -Name 'Tab 1' -AnchorName 'Tab1' {
            New-HTMLSectionStyle -RemoveShadow -BorderRadius 0px
            New-HTMLSection -HeaderText 'Default Section Style' {
                New-HTMLTable -DataTable $Test1 -HideFooter
            } -BorderRadius 15px
            New-HTMLSection -HeaderText 'Default Section Style' {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLSection -HeaderText 'Default Section Style' {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLSection -HeaderText 'Default Section Style' {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLSection -HeaderText 'Default Section Style' {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLSection -HeaderText 'Default Section Style' {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLSection -HeaderText 'Default Section Style' {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLSection -HeaderText 'Default Section Style' {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLSection -HeaderText 'Default Section Style' {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLSection -HeaderText 'Default Section Style' {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLSection -HeaderText 'Default Section Style' {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLSection -HeaderText 'Default Section Style' {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLSection -HeaderText 'Default Section Style' {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLSection -HeaderText 'Default Section Style' {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLSection -HeaderText 'Default Section Style' {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLSection -HeaderText 'Default Section Style' {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLSection -HeaderText 'Default Section Style' {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLSection -HeaderText 'Default Section Style' {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            # Keep in mind if you start using AnchorName you need to keep uniquness yourself
            New-HTMLSection -HeaderText 'Default Section Style' -AnchorName 'LastSection' {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
        }
        New-HTMLTab -Name 'Tab 2' -AnchorName 'Tab2' {
            New-HTMLPanel {
                New-HTMLTable -DataTable $Test1 -HideFooter
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLPanel {
                New-HTMLAnchor -Name 'This is link' -HrefLink 'https://evotec.xyz' -Text 'Visit Evotec'
            } -AlignContentText center -BackgroundColor Yellow -BorderRadius 0px
            New-HTMLPanel {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Test1 -HideFooter
            } -AnchorName 'LastPanel'
        }
    }
    New-HTMLFooter {
        New-HTMLAnchor -Href '#top' -Text 'Link to top'
    }
}