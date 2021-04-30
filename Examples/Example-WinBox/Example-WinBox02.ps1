Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'This is a test' -FilePath "$PSScriptRoot\Example-WinBox02.html" {
    New-HTMLWinBox -Title 'This is a test Window' -Url 'https://google.pl'
} -Online -ShowHTML