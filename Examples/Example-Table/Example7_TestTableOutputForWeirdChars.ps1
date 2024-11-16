Import-Module .\PSWriteHTML.psd1 -Force

Get-Process | Select-Object -First 50 | Out-HtmlView -SearchRegularExpression -FilePath "$PSScriptRoot\Example7_TestTableOutputForWeirdChars.html01" -Online -Filtering -DataStore JavaScript

$Test1 = [PSCustomObject] @{
    Number     = 1
    Number2    = 2.2
    Bool       = $false
    Array      = @(
        'C:\Users\1Password.exe'
        "C:\Users\Ooops.exe"
        "\\EvoWin\c$\Users\przemyslaw klys\AppData\Local\1password\This is other\7\1Password.exe"
        "\\EvoWin\c$\Users\przemyslaw.klys\AppData\Local\1password\This is other\7\1Password.exe"
    )
    EmptyArray = @()
    EmptyList  = [System.Collections.Generic.List[string]]::new()
    HashTable  = @{
        NumberAgain       = 2
        OrderedDictionary = [ordered] @{
            String    = 'test'
            HashTable = @{
                StringAgain = "oops"
            }
        }
        Array             = @(
            'C:\Users\1Password.exe'
            "C:\Users\Ooops.exe"
            "\\EvoWin\c$\Users\przemyslaw klys\AppData\Local\1password\This is other\7\1Password.exe"
            "\\EvoWin\c$\Users\przemyslaw.klys\AppData\Local\1password\This is other\7\1Password.exe"
        )
    }
    DateTime   = Get-Date
}

$Test1 | Out-HtmlView -SearchRegularExpression -FilePath "C:\Temp\test.html" -Online -Filtering -DataStore JavaScript

$DataTable3 = @(
    $PropertyName1 = 'Test' + [System.Environment]::NewLine + 'Test3'
    $PropertyName2 = 'Test' + [System.Environment]::NewLine + 'Test4'; ##+ "`n Test"
    [PSCustomObject] @{
        'Test1'        = 'Test' + [System.Environment]::NewLine + 'test3'
        'Test2'        = 'Test' + [System.Environment]::NewLine + 'test3' + "`n test"
        'Test3'        = 'Test' + [System.Environment]::NewLine + 'test3' + "`r`n test"
        'Test4'        = 'Test' + [System.Environment]::NewLine + 'test3' + "`r test"
        'Test5'        = 'Test' + "`r`n" + 'test3' + "test"
        'Test6'        = @"
        Test1
        Test2
        Test3

        Test4
"@
        'Test7'        = 'Test' + "`n`n" + "Oops"
        'Test9'        = 'Test' + "<Br>" + "Oops"
        'Test8"Oopps"' = 'MyTest "Ofcourse"'
        "Test9'Ooops'" = "MyTest 'Ofcourse'"
        $PropertyName1 = 'Test' + [System.Environment]::NewLine + 'test3'
        $PropertyName2 = 'Test' + [System.Environment]::NewLine + 'test3'
        'Property1'    = 'Test1'
        'property2'    = 'Test2'
    }
)

<#
$DataTable3 | ConvertTo-JsonLiteral -NewLineFormat @{
    NewLineCarriage = '<br>'
    NewLine         = "\n"
    Carriage        = "\r"
}
$DataTable3 | ConvertTo-JsonLiteral
$DataTable3 | ConvertTo-Json
#>


$DataTable3 | ConvertTo-PrettyObject

New-HTML {
    New-HTMLTableOption -DataStore JavaScript #-NewLineCarriage '\r\n'
    New-HTMLTable -DataTable $DataTable3
} -ShowHTML -FilePath "$PSScriptRoot\Example7_TestTableOutputForWeirdChars02.html" -Online