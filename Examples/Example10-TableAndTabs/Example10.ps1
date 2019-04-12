Import-Module .\PSWriteHTML.psd1 -Force
$Processes = Get-Process | Select -First 5

New-HTML -TitleText 'My Title' -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example10.html -ShowHTML {
    New-HTMLLogo
    New-HtmlTab -TabName 'Test' {
        New-HTMLContent -HeaderText '0 section' {
            New-HTMLPanel {
                New-HTMLTable -ArrayOfObjects $Processes -HideFooter
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
        New-HTMLContent -HeaderText '1 section' {
            New-HTMLPanel {
                New-HTMLTable -ArrayOfObjects $Processes -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -ArrayOfObjects $Processes -HideFooter
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
        New-HTMLContent -HeaderText '1 section' {
            New-HTMLPanel {
                New-HTMLTable -ArrayOfObjects $Processes -HideFooter
            }
            New-HTMLPanel {
                New-HTMLTable -ArrayOfObjects $Processes -HideFooter
                # New-HTMLTable -DataTable $Processes -HideFooter
            }
            New-HTMLPanel {
                #   New-HTMLTable -DataTable $Processes -HideFooter -Simplify
            }
        }
    }
}