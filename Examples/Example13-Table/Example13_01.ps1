Import-Module .\PSWriteHTML.psd1 -Force

<#
$Processes = Get-Process | Select-Object -First 50 #-Property Name, ID, HandleCount, WorkingSet
$Title = 'My title'

New-HTML -TitleText $Title -Online -FilePath $PSScriptRoot\Example13_01.html {
    #New-HTMLContent -HeaderText '1 section' {
        New-HTMLTable -ArrayOfObjects $Processes -HideFooter { #-ImmediatelyShowHiddenDetails
            #New-TableRowGrouping -Name 'PriorityClass' -Color Red -BackgroundColor GreenYellow
        } -DisableSearch
    #}
    #New-HTMLContent -HeaderText '2 section' {
        #New-HTMLTable -ArrayOfObjects $Processes -HideFooter -ImmediatelyShowHiddenDetails -HideShowButton
    #}
} -ShowHTML
#>

$Table = Get-Process | Select-Object -First 4

New-HTML -TitleText "Testing HideButtons" -Online -FilePath "$PSScriptRoot\Test-HideButtons.html" {
    # Hide Buttons
    New-HTMLSection -HeaderText "Hide Buttons" -Content {
        New-HTMLTable -DataTable $Table -HideButtons
    }
} -ShowHTML