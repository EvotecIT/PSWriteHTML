Import-Module .\PSWriteHTML.psd1 -Force

$ProcessesAll = Get-Process

New-HTML -TitleText 'Title' -Online -FilePath $PSScriptRoot\Example12.html -ShowHTML {
    New-HTMLContent -HeaderText 'Demo for ScrollY' {
        New-HTMLPanel {
            New-HTMLTable -DataTable $ProcessesAll -DisablePaging -FixedHeader -FixedFooter
        }
    }
}