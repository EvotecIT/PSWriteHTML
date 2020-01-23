Import-Module -Name "$PSScriptRoot\..\..\PSWriteHTML.psd1" -Force

New-HTML -TitleText "Example35-FavIcon-FromLink" -FavIcon "https://image.flaticon.com/icons/png/512/2433/2433484.png" -FilePath "$PSScriptRoot\Example35_02.html" {
    New-HTMLSection -HeaderText "Computer Process" -HeaderTextAlignment center -Content {
        New-HTMLTable -DataTable $(Get-Process | Select-Object -First 10)
    }
} -ShowHTML