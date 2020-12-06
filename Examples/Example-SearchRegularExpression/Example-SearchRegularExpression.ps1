Import-Module .\PSWriteHTML.psd1 -Force

$Process = Get-Process | Select-Object -First 35

$Name = 'PSWriteHTML Regular Expression Search and Wildcard Conditional Formatting'
$Author = $env:USERNAME

$SaveFilePath = $PSCommandPath -replace "ps1$", "html"


New-HTML -Name $Name -Author $Author -FilePath $SaveFilePath -AutoRefresh 0 -ShowHTML -Online:$true -HTMLData {
    $Buttons = @('copyHtml5', 'excelHtml5', 'csvHtml5', 'pdfHtml5', 'pageLength')
    $PreContent = { New-HTMLText -Text 'Smart Search Enabled for Column Searches' -Color DodgerBlue -Alignment center -FontSize 20 }

    New-HTMLTable -DataTable $Process -DefaultSortIndex 4 -ScrollCollapse -Buttons $Buttons -Filtering -FilteringLocation Bottom -FixedFooter -PreContent $PreContent -HTML {
        # If item matches multiple rules, last matched rule is applied
        New-HTMLTableCondition -Name Name -ComparisonType string -Operator like -Value "Co*" -BackgroundColor Crimson -Color White
        New-HTMLTableCondition -Name Name -ComparisonType string -Operator like -Value "*me" -BackgroundColor Gold -Color Black
        New-HTMLTableCondition -Name Name -ComparisonType string -Operator like -Value "C*de" -BackgroundColor Green -Color White
    }
    New-HTMLHorizontalLine
    New-HTMLText -Text "RegEx Example - Search for all processes but 'Code': ^((?!Code).)*$"
    New-HTMLText -Text "RegEx Example - Search for all processes but 'Code' OR 'Chrome': ^((?!Code|Chrome).)*$"
    New-HTMLText -Text "RegEx Example - Search for all 'Code' OR 'Chrome' processes: Code|Chrome"
    $PreContent = { New-HTMLText -Text 'Regular Expression Search Enabled for Column Searches' -Color DodgerBlue -Alignment center -FontSize 20 }
    New-HTMLTable -DataTable $Process -DefaultSortIndex 4 -ScrollCollapse -Buttons $Buttons -Filtering -FilteringLocation Bottom -FixedFooter -PreContent $PreContent -SearchRegularExpression -HTML {
        New-HTMLTableCondition -Name Path -ComparisonType string -Operator like -Value "*cri*" -BackgroundColor Crimson -Color White
        New-HTMLTableCondition -Name Path -ComparisonType string -Operator like -Value "*me" -BackgroundColor Gold -Color Black
        New-HTMLTableCondition -Name Path -ComparisonType string -Operator like -Value "C*de" -BackgroundColor Green -Color White
    }
}
