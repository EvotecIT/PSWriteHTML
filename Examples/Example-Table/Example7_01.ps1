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


New-HTML -Online -TitleText "Users With Devices" {
    Add-HTMLStyle -Placement Header -Css @{
        ".dt-button" = @{
            'background-color' = '#f5f5f5;'
            'font-size'        = '30px !important;'
        }
    }
    New-HTMLHeader {
        New-HTMLSpanStyle -Alignment center {
            New-HTMLHeading -Heading h1 -HeadingText "International Users and Devices"
        }
    }
    # New-HTMLTableOption -DataStore JavaScript -DateTimeFormat 'MMM-dd-yyyy'
    $newHTMLTableSplat = @{
        DataTable               = $DataTable1
        Title                   = "Int Users And Devices"
        PagingLength            = 50
        WordBreak               = 'break-word'
        AutoSize                = $true
        Style                   = 'display'
        Buttons                 = 'copyHtml5', 'excelHtml5', 'csvHtml5', 'pdfHtml5', 'columnVisibility', 'searchBuilder'
        EnableColumnReorder     = $true
        SearchRegularExpression = $true
        PreContent              = {
            New-HTMLSpanStyle -Alignment center {
                New-HTMLHeading -Heading h2 -HeadingText "Graph Data Export"
            }
        }
        Filtering               = $true
        HTML                    = {
            New-HTMLTableStyle -FontSize 14
            New-HTMLTableButtonExcel
            New-HTMLTableColumnOption -ColumnIndex 2 -Hidden $true
            New-HTMLTableColumnOption -AllColumns -Width 100
        }
    }

    New-HTMLTable @newHTMLTableSplat
} -FilePath $PSScriptRoot\IntAzureReportHTML.html -ShowHTML



return
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