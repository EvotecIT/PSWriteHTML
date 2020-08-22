Import-Module $PSScriptRoot\..\..\PSWriteHTML.psd1 -Force

$Test1 = Get-Process | Select-Object -First 1 -Property Name, Id, PriorityClass

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example27-05.html -Show {
    New-HTMLHeader {
        New-HTMLAnchor -Id 'top'

        New-HTMLAnchor -Href '#LastSection' -Text 'Link to last section'
    }
    # New-HTMLMain is not nessecary but I like to use it when Header/Footer are present to distinguish how things are placed
    New-HTMLMain {
        New-HTMLSectionStyle -RemoveShadow -BorderRadius 0px
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
        New-HTMLSection -HeaderText 'Default Section Style' {
            New-HTMLTable -DataTable $Test1 -HideFooter
        }
        # Keep in mind if you start using AnchorName you need to keep uniquness yourself
        New-HTMLSection -HeaderText 'Default Section Style' -AnchorName 'LastSection' {
            New-HTMLTable -DataTable $Test1 -HideFooter
        }
    }
    New-HTMLFooter {
        New-HTMLAnchor -Href '#top' -Text 'Link to top'
    }
}