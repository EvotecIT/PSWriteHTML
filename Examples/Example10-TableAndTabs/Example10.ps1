Import-Module .\PSWriteHTML.psd1 -Force

$Processes = Get-Process | Select-Object -First 5

New-HTML -TitleText 'My Title' -Online -FilePath $PSScriptRoot\Example10.html -ShowHTML {
    New-HTMLLogo
    New-HtmlTab -TabName 'Test' {
        New-HTMLSection -HeaderText '0 section' {
            New-HTMLPanel {
                New-HTMLTable -DataTable $Processes -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Processes -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Processes -HideFooter -Simplify
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Processes -HideFooter
            }
        }
    }
    New-HTMLTab -TabName 'Test5' {
        New-HTMLSection -HeaderText '1 section' {
            New-HTMLPanel {
                New-HTMLTable -DataTable $Processes -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Processes -HideFooter
                # New-HTMLTable -DataTable $Processes -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Processes -HideFooter
            }
        }
    }


    New-HTMLTab {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -HideFooter
        }
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -HideFooter
        }
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -HideFooter
        }
    }
    New-HTMLTab {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -HideFooter
        }
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -HideFooter
        }
    }
    New-HTMLTab {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -HideFooter
        }
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -HideFooter
        }
    }
    New-HTMLTab {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -HideFooter
        }
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -HideFooter
        }
        New-HTMLSection -HeaderText '1 section' {
            New-HTMLPanel {
                New-HTMLTable -DataTable $Processes -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $Processes -HideFooter
                # New-HTMLTable -DataTable $Processes -HideFooter
            }
            New-HTMLPanel {
                #   New-HTMLTable -DataTable $Processes -HideFooter -Simplify
            }
        }
    }
}