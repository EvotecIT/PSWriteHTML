Import-Module -Name "$PSScriptRoot\..\..\PSWriteHTML.psd1" -Force

New-HTML -TitleText "Example35-FavIcon-FromFile" -FavIcon "$PSScriptRoot\favicon.png" -FilePath "$PSScriptRoot\Example35_01.html" {
    New-HTMLSection -HeaderText "Computer Process" -HeaderTextAlignment center -Content {
        New-HTMLTable -DataTable $(Get-Process | Select-Object -First 10)
    }
} -ShowHTML