Import-Module $PSScriptRoot\..\..\PSWriteHTML.psd1 -Force

$Test1 = Get-Process | Select-Object -First 1 -Property Name, Id, PriorityClass

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example27-07.html -Show {
    New-HTMLHeader {
        New-HTMLSection -Invisible {
            New-HTMLSection {
                New-HTMLAnchor -Href '#LastSection' -Text 'Link to last section'
            } -Invisible
            New-HTMLSection {
                New-HTMLAnchor -Href '#LastPanel' -Text 'Same link but to the right'
            } -Invisible -JustifyContent flex-end
        }
    }
    # New-HTMLMain is not nessecary but I like to use it when Header/Footer are present to distinguish how things are placed
    New-HTMLMain {
        New-HTMLTab -Name 'Tab 1' {
            New-HTMLSectionStyle -RemoveShadow -BorderRadius 0px
            New-HTMLSection -HeaderText 'Default Section Style' {
                New-HTMLTable -DataTable $Test1 -HideFooter
            }
        }
    }
}