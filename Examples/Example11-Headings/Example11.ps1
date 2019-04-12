Import-Module .\PSWriteHTML.psd1 -Force
$Processes = Get-Process | Select-Object -First 5

New-HTML -TitleText "Title" `
    -UseCssLinks:$true `
    -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example11.html -ShowHTML {

    New-HTMLLogo

    New-HTMLHeading -Heading h1  -HeadingText 'This is my heading'
    New-HTMLHeading -Heading h2  -HeadingText 'This is my heading'
    New-HTMLHeading -Heading h3  -HeadingText 'This is my heading'
    New-HTMLHeading -Heading h4  -HeadingText 'This is my heading'
    New-HTMLHeading -Heading h5  -HeadingText 'This is my heading'
    New-HTMLHeading -Heading h6  -HeadingText 'This is my heading'

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
}