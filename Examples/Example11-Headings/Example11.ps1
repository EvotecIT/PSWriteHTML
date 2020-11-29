Import-Module .\PSWriteHTML.psd1 -Force
$Processes = Get-Process | Select-Object -First 5

New-HTML -TitleText "Title" -Online:$true -FilePath $PSScriptRoot\Example11.html -ShowHTML {
    New-HTMLLogo
    New-HTMLTab -TabName 'Test1' {
        New-HTMLHeading -Heading h1 -HeadingText 'This is my heading'
        New-HTMLHeading -Heading h2 -HeadingText 'This is my heading'
        New-HTMLHeading -Heading h3 -HeadingText 'This is my heading'
        New-HTMLHeading -Heading h4 -HeadingText 'This is my heading'
        New-HTMLHeading -Heading h5 -HeadingText 'This is my heading'
        New-HTMLHeading -Heading h6 -HeadingText 'This is my heading'
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
}