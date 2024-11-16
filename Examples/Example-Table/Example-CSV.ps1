Import-Module .\PSWriteHTML.psd1 -Force

$data = Get-Process | Select-Object Name, WorkingSet, Id, VirtualMemorySize, CPU -First 10
New-HTML -HtmlData {
    New-HTMLTable -DataTable $data -HideFooter -PagingLength 7 -PagingOptions 5, 7, 10, 15, 30, 50, 100 -HTML {
        #New-TableButtonCopy
        #New-TableButtonColumnVisibility
        New-TableButtonCSV
        New-TableCondition -Name Name -ComparisonType string -Operator eq -Value 1password -Color BlueViolet -BackgroundColor MoonYellow -Row
        New-TableCondition -Name Name -ComparisonType string -Operator like -Value svc -Color White -BackgroundColor Green
    } -DataStore JavaScript
} -ShowHTML -FilePath $PSScriptRoot\Example-CVS.html -Online