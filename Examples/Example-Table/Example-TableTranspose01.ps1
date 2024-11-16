Import-Module .\PSWriteHTML.psd1 -Force

$Title = 'My title'

$Object = @(
    [PSCustomObject] @{
        Test  = 5
        Ello  = 'Motto'
        Hello = 'Totto'
    }
    [PSCustomObject] @{
        Test  = 5
        Ello  = 'Motto'
        Hello = 'Totto'
    }
    [PSCustomObject] @{
        Test  = 5
        Ello  = 'Motto'
        Hello = 'Totto'
    }
    [PSCustomObject] @{
        Test  = 5
        Ello  = 'Motto'
        Hello = 'Totto'
    }
    [PSCustomObject] @{
        Test  = 5
        Ello  = 'Motto'
        Hello = 'Totto'
    }
    [PSCustomObject] @{
        Test  = 3
        Ello  = 'Lotto'
        Hello = 'Totto'
    }
)


$Object | Out-HtmlView -Transpose -TransposeName 'Test' -Filtering

New-HTML -TitleText $Title -Online -FilePath $PSScriptRoot\Example-TableTranspose01.html {
    New-HTMLTable -DataTable $Object -Filtering -Transpose -TransposeName 'Test'
} -ShowHTML