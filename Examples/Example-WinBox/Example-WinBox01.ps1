Import-Module .\PSWriteHTML.psd1 -Force

$Data = Get-Process | Select-Object -First 3

New-HTML -TitleText 'This is a test' -FilePath "$PSScriptRoot\Example-WinBox01.html" {
    New-HTMLWinBox -Title 'This is a test Window 1' -BackgroundColor Red {
        New-HTMLText -Text 'This is a text within modal dialog'
        New-HTMLTable -DataTable $Data
    } -Width 50% -Height 50% -X center -Y center
    New-HTMLWinBox -Title 'This is a test Window 2' -BackgroundColor Red {
        New-HTMLText -Text 'This is a text within modal dialog'
        New-HTMLTable -DataTable $Data
    } -Width 50% -Height 50% -X center
} -Online -ShowHTML