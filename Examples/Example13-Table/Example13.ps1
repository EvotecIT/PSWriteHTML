Import-Module .\PSWriteHTML.psd1 -Force

$Processes = Get-Process | Select-Object -First 2 -Property Name, ID, HandleCount, WorkingSet
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

New-HTML -TitleText $Title -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example13.html {
    New-HTMLTable -ArrayOfObjects $Object
    <#
    New-HTMLContent -HeaderText '1 section' {
        New-HTMLTable -ArrayOfObjects $Processes -HideFooter {
            New-HTMLTableHeader -Names 'ID', 'HandleCount' -ResponsiveOperations none
        } -ImmediatelyShowHiddenDetails
    }
    New-HTMLContent -HeaderText '2 section' {
        New-HTMLTable -ArrayOfObjects $Processes -HideFooter {
            New-HTMLTableHeader -Names 'ID', 'HandleCount' -ResponsiveOperations none
        } -ImmediatelyShowHiddenDetails -HideShowButton
    }
    New-HTMLContent -HeaderText '3 section' {
        New-HTMLTable -ArrayOfObjects $Processes -HideFooter {
            New-HTMLTableHeader -Names 'ID', 'HandleCount' -ResponsiveOperations none
        } -ImmediatelyShowHiddenDetails -HideShowButton -DisableResponsiveTable
    }
    New-HTMLContent -HeaderText '4 section' {
        New-HTMLTable -ArrayOfObjects $Processes -HideFooter {
            New-HTMLTableHeader -Names 'ID', 'HandleCount', 'WorkingSet' -ResponsiveOperations none
        }
    }
    #>
} -ShowHTML