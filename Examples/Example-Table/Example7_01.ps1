Import-Module .\PSWriteHTML.psd1 -Force

$DataTable1 = @(
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.42 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.72 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 1.22 }
    [PSCustomObject] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3'; Test4 = 2.73 }
)

$DataTable2 = @(
    [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3' }
    [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3' }
    [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3' }
    [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3' }
)
$DataTable3 = [ordered] @{ Test = 'Name'; Test2 = 'Name2'; Test3 = 'Name3' }


$RootDSE = Get-ADRootDSE
$TranslatedRootDSE = [ordered] @{ }
foreach ($Key in $RootDSE.PSObject.Properties.Name) {
    $TranslatedRootDSE["$Key"] = $RootDSE.$Key -join ', '
}

New-HTML {
    New-HTMLSection -Invisible {
        New-HTMLSection {
            New-HTMLTable -DataTable $DataTable1 -Title 'Test1' -PagingLength 2 # Title will be used for filename when using export
        }
        #New-HTMLSection {
        #    New-HTMLTable -DataTable $DataTable1 -Title 'Test1' -PagingLength 2 # Title will be used for filename when using export
        #}
    }


    #New-HTMLTable -DataTable $DataTable1 -Title 'Test1' -PagingLength 2 # Title will be used for filename when using export

    #New-HTMLTable -DataTable (Get-Process | Select-Object -First 30) -Title 'Test2' # Title will be used for filename when using export
    #New-HTMLTable -DataTable $DataTable2 -PagingLength 5
    #New-HTMLTable -DataTable $DataTable2 -PagingLength 5 -Simplify -HideFooter
    #New-HTMLTable -DataTable $DataTable2 -PagingLength 5 -HideFooter -Buttons print
    #New-HTMLTable -DataTable $DataTable3 -HideButtons
    #New-HTMLTable -DataTable $TranslatedRootDSE
} -ShowHTML -FilePath $PSScriptRoot\Example7_01.html -Online