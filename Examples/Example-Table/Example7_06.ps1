Import-Module .\PSWriteHTML.psd1 -Force

$Table = Get-Process | Select-Object -First 4

New-HTML -TitleText "Testing HideButtons" -Online -FilePath "$PSScriptRoot\Example7_06.html" {
    # Hide Buttons
    New-HTMLSection -HeaderText "Hide Buttons" -Content {
        New-HTMLTable -DataTable $Table -HideButtons
    }
} -ShowHTML