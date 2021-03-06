Import-Module .\PSWriteHTML.psd1 -Force

$ProcessesAll = Get-Process

New-HTML -TitleText 'Title' -Online -FilePath $PSScriptRoot\Example-TableAdvancedFreeze.html -ShowHTML {
    New-HTMLSection -HeaderText 'Demo for ScrollY' {
        New-HTMLPanel {
            New-HTMLTable -DataTable $ProcessesAll -DisablePaging -FixedHeader -FixedFooter
        }
    }
}