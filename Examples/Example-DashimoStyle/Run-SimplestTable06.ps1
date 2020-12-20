Import-Module .\PSWriteHTML.psd1 -Force

$Process = Get-Process | Select-Object -First 15 | Select-Object name, Priorityclass, fileversion, handles, cpu

$PagingOptions = @(5, 10)
$Proces = '1Password', 'aesm_service'

$ProcessGreen = 'audiodg', 'browser_broker'

Dashboard -Name 'Dashimo Test' -FilePath $PSScriptRoot\Output\DashboardEasy06.html {
    Section -Name 'Test' -Collapsable {
        Container {
            Panel {
                Table -DataTable $Process {
                    TableButtonPDF
                    TableButtonCopy
                    TableButtonExcel
                    TableButtonPageLength
                    foreach ($T in $Proces) {
                        TableConditionalFormatting -Name 'Name' -ComparisonType string -Operator eq -Value $T -Row -Color Red
                    }
                    foreach ($Green in $ProcessGreen) {
                        TableConditionalFormatting -Name 'Name' -ComparisonType string -Operator eq -Value $Green -Row -BackgroundColor Green
                    }
                } -Buttons @() -DisableSearch -PagingOptions $PagingOptions  -HideFooter
            }
        }
    }
} -Show