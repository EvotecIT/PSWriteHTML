Import-Module -Name "$PSScriptRoot\..\..\PSWriteHTML.psd1" -Force

New-HTML -TitleText "Example37 - Word Breaking" -FilePath "$PSScriptRoot\Example37.html" {
    New-HTMLSection -HeaderText "Word Break for whole table" -HeaderTextAlignment center -Content {
        New-HTMLTable -DataTable $(Get-Process | Select-Object -First 5) -WordBreak 'break-word'
    }
    New-HTMLSection -HeaderText "Word Break per column" -HeaderTextAlignment center -Content {
        New-HTMLTable -DataTable $(Get-Process | Select-Object -First 5) {
            New-TableContent -WordBreak break-all -ColumnName 'Path'
        }
    }
    New-HTMLSection -HeaderText "No word break" -HeaderTextAlignment center -Content {
        New-HTMLTable -DataTable $(Get-Process | Select-Object -First 5)
    }
} -Online -ShowHTML
