Import-Module .\PSWriteHTML.psd1 -Force

$Process = Get-Process | Select-Object -First 30

Dashboard -Name 'Dashimo Test' -FilePath $PSScriptRoot\Output\DashboardEasy07.html -Show {
    Table -DataTable $Process -HideFooter {
        TableConditionalFormatting -Name 'ID' -ComparisonType number -Operator gt -Value 10000 -Color BlueViolet -Row
        TableConditionalFormatting -Name 'Name' -ComparisonType string -Operator eq -Value 'chrome' -Color White -BackgroundColor Crimson -Row
        TableConditionalFormatting -Name 'PriorityClass' -ComparisonType string -Operator eq -Value 'Idle' -Color White -BackgroundColor Green
    }
}