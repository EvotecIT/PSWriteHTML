Import-Module .\PSWriteHTML.psd1 -Force

$Process = @(
    [PSCustomObject] @{
        Name = 'Test'
        Value = 'Something'
    }
    [PSCustomObject] @{
        Name = 'Test'
        Value = 'Something'
    }
    [PSCustomObject] @{
        Name = 'Test'
        Value = 'Something'
    }
    [PSCustomObject] @{
        Name = 'Test'
        Value = 'Something'
    }
)

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example-TableConditions02.html {
    New-HTMLTable -DataTable $Process -PagingOptions @(50, 100, 150, 200) {
        New-HTMLTableCondition -Name 'Name' -Type string -Operator gt -Value 'Test' -BackgroundColor Yellow
    }
} -ShowHTML -Format
