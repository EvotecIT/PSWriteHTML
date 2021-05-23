Import-Module $PSScriptRoot\..\..\PSWriteHTML.psd1 -Force

$data = Get-Process | Select-Object -First 3
New-HTML -Online -FilePath $PSScriptRoot\Example-Tabs10.html -ShowHTML {
    New-HTMLTabStyle -BorderRadius 5px -TextTransform capitalize -BackgroundColorActive SlateGrey -BackgroundColor AirForceBlue
    New-HTMLTab -Name 'Tab1' {
        New-HTMLTab -Name 'Tab 3' {

        }
        New-HTMLTab -Name 'Tab 4' {

        }
    }
    New-HTMLTab -Name 'Tab2' {
        New-HTMLSection -HeaderText 'Test Table' {
            New-HTMLTable -DataTable $data -DisablePaging -FixedFooter
        }
    }
}