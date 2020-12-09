Import-Module $PSScriptRoot\..\..\PSWriteHTML.psd1 -Force

$data = Get-Process | Select-Object -First 50
New-HTML -Online -FilePath $PSScriptRoot\Example-Tabs10.html -ShowHTML {
    New-HTMLTab -Name 'Tab1' {

    }
    New-HTMLTab -Name 'Tab2' {
        New-HTMLSection -HeaderText 'Test Table' {
            New-HTMLTable -DataTable $data -DisablePaging -FixedFooter
        }
    }
}