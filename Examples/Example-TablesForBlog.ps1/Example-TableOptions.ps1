Import-Module .\PSWriteHTML.psd1 -Force

$Objects = @(
    [PSCustomObject] @{ Name = 'Przemek'; Tags = 'PowerShell', 'IT', 'SomethingElse'; Value = 15; Date = (Get-Date).AddYears(-20) }
    [PSCustomObject] @{ Name = 'Adam'; Tags = 'Rain', 'MorseCode'; Value = 30; Date = (Get-Date).AddYears(-20) }
)
New-HTML {
    New-HTMLTableOption -DataStore JavaScript -DateTimeFormat 'yyyy-MM-dd' -ArrayJoin -ArrayJoinString ','
    New-HTMLTable -DataTable $Objects -Title 'Table with Users' -HideFooter -PagingLength 10 -SearchBuilder
} -ShowHTML -FilePath "$PSScriptRoot\Example-TableOptions.html" -Online