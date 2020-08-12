Import-Module .\PSWriteHTML.psd1 -Force

#$Processes = Get-Process | Select-Object -First 2 -Property Name, ID, HandleCount, WorkingSet
$Title = 'My title'

$Object = @(
    [PSCustomObject] @{
        Test = 5
        Ello = 'Motto'
        Hello = 'Totto'
    }
    [PSCustomObject] @{
        Test = 5
        Ello = 'Motto'
        Hello = 'Totto'
    }
    [PSCustomObject] @{
        Test = 5
        Ello = 'Motto'
        Hello = 'Totto'
    }
    [PSCustomObject] @{
        Test = 5
        Ello = 'Motto'
        Hello = 'Totto'
    }
    [PSCustomObject] @{
        Test = 5
        Ello = 'Motto'
        Hello = 'Totto'
    }
    [PSCustomObject] @{
        Test = 3
        Ello = 'Lotto'
        Hello = 'Totto'
    }
)

New-HTML -TitleText $Title -Online -FilePath $PSScriptRoot\Example13_02.html {
    New-HTMLTable -DataTable $Object {
        New-TableRowGrouping -Name 'Ello' -Color Red -BackgroundColor GreenYellow
    }
    <#
    New-HTMLContent -HeaderText '1 section' {
        New-HTMLTable -DataTable $Processes -HideFooter {
            New-HTMLTableHeader -Names 'ID', 'HandleCount' -ResponsiveOperations none
        } -ImmediatelyShowHiddenDetails
    }
    New-HTMLContent -HeaderText '2 section' {
        New-HTMLTable -DataTable $Processes -HideFooter {
            New-HTMLTableHeader -Names 'ID', 'HandleCount' -ResponsiveOperations none
        } -ImmediatelyShowHiddenDetails -HideShowButton
    }
    New-HTMLContent -HeaderText '3 section' {
        New-HTMLTable -DataTable $Processes -HideFooter {
            New-HTMLTableHeader -Names 'ID', 'HandleCount' -ResponsiveOperations none
        } -ImmediatelyShowHiddenDetails -HideShowButton -DisableResponsiveTable
    }
    New-HTMLContent -HeaderText '4 section' {
        New-HTMLTable -DataTable $Processes -HideFooter {
            New-HTMLTableHeader -Names 'ID', 'HandleCount', 'WorkingSet' -ResponsiveOperations none
        }
    }
    #>
} -ShowHTML