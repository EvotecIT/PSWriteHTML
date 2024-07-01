
Import-Module .\PSWriteHTML.psd1 -Force

$ProcessSmaller = Get-Process | Select-Object -First 5

New-HTML {
    New-HTMLTabStyle -BorderRadius 0px -TextTransform capitalize -BackgroundColorActive SlateGrey
    New-HTMLSectionStyle -BorderRadius 0px -HeaderBackGroundColor Grey -RemoveShadow
    New-HTMLPanelStyle -BorderRadius 0px
    New-HTMLTableOption -DataStore JavaScript -BoolAsString -ArrayJoinString ', ' -ArrayJoin

    New-HTMLHeader {
        New-HTMLSection -Invisible {
            New-HTMLPanel -Invisible {
                New-HTMLImage -Source 'https://evotec.pl/wp-content/uploads/2015/05/Logo-evotec-012.png' -UrlLink 'https://evotec.pl/' -AlternativeText 'My other text' -Class 'otehr' -Width '50%'
            }
            New-HTMLPanel -Invisible {
                New-HTMLImage -Source 'https://evotec.pl/wp-content/uploads/2015/05/Logo-evotec-012.png' -UrlLink 'https://evotec.pl/' -AlternativeText 'My other text' -Width '20%'
            } -AlignContentText right
        }
    }
    New-HTMLSection {
        New-HTMLSection -HeaderText 'Test 1' {
            New-HTMLTable -DataTable $ProcessSmaller
        }
        New-HTMLSection -HeaderText 'Test 2' {
            New-HTMLCalendar {
                New-CalendarEvent -Title 'Active Directory Meeting' -Description 'We will talk about stuff' -StartDate (Get-Date)
                New-CalendarEvent -Title 'Lunch' -StartDate (Get-Date).AddDays(2).AddHours(-3) -EndDate (Get-Date).AddDays(3) -Description 'Very long lunch'
            }
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLTabPanel {
            New-HTMLTab -Name 'PSWriteHTML from File' {
                # as a file
                New-HTMLSection {
                    New-HTMLMarkdown -FilePath "$PSScriptRoot\..\..\readme.md"
                }
            }
            New-HTMLTab -Name 'ADEssentials from File' {
                New-HTMLSection {
                    New-HTMLMarkdown -FilePath "C:\Support\GitHub\ADEssentials\readme.md"
                }
            }
        } -Theme elite
    }

    New-HTMLFooter {
        New-HTMLSection -Invisible {
            New-HTMLPanel -Invisible {
                New-HTMLImage -Source 'https://evotec.pl/wp-content/uploads/2015/05/Logo-evotec-012.png' -UrlLink 'https://evotec.pl/' -AlternativeText 'My other text' -Class 'otehr' -Width '50%'
            }
            New-HTMLPanel -Invisible {
                New-HTMLImage -Source 'https://evotec.pl/wp-content/uploads/2015/05/Logo-evotec-012.png' -UrlLink 'https://evotec.pl/' -AlternativeText 'My other text' -Width '20%'
            } -AlignContentText right
        }
    }
} -ShowHTML:$true -Online -FilePath $PSScriptRoot\Example-Markdown1.html