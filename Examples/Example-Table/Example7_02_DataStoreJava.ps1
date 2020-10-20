Import-Module .\PSWriteHTML.psd1 -Force

$DataTable3 = @(
    [PSCustomObject] @{
        'Test1'        = 'Test' + [System.Environment]::NewLine + 'test3';
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

    }
)
$DataTable3 | Out-HtmlView -DataStore JavaScript -FilePath $PSScriptRoot\Example7_02_DataStoreJava.html -Online