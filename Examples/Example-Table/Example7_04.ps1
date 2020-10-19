Import-Module .\PSWriteHTML.psd1 -Force

$Processes = Get-Process | Select-Object -First 50
$Title = 'My title'

New-HTML -TitleText $Title -Online -FilePath $PSScriptRoot\Example7_04.html {
    New-HTMLSection -HeaderText '1 section' {
        New-HTMLTable -DataTable $Processes -HideFooter {
            New-TableRowGrouping -Name 'PriorityClass' -Color Red -BackgroundColor GreenYellow
        } -DisableSearch
    }
    New-HTMLSection -HeaderText '2 section' {
        New-HTMLTable -DataTable $Processes -HideFooter -ImmediatelyShowHiddenDetails -HideShowButton
    }
} -ShowHTML

