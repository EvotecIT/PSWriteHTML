Import-Module .\PSWriteHTML.psd1 -Force

$Process = Get-Process | Select-Object -First 30
$Process1 = Get-Process | Select-Object -First 5
$Process2 = Get-Process | Select-Object -First 10

Dashboard -Name 'Dashimo Test' -FilePath $PSScriptRoot\Output\DashboardEasyConditions.html -Show {
    Tab -Name 'First tab' {
        Section -Name 'Test' {
            Table -DataTable $Process {
                TableConditionalFormatting -Name 'ID' -ComparisonType number -Operator gt -Value 16000 -Color BlueViolet -Row
                TableConditionalFormatting -Name 'PriorityClass' -ComparisonType string -Operator eq -Value 'Normal' -BackgroundColor Gold
                TableConditionalFormatting -Name 'PriorityClass' -ComparisonType string -Operator eq -Value 'Idle' -BackgroundColor Gold -Color Green
            }
        }
        Section -Name 'Test2' {
            Panel {
                Table -DataTable $Process1 {
                    TableConditionalFormatting -Name 'HandleCount' -ComparisonType number -Operator lt -Value 200 -Color MidnightBlue
                }
            }
            Panel {
                Table -DataTable $Process1
            }
        }
        Section -Name 'Test3' {
            Table -DataTable $Process {
                TableConditionalFormatting -Name 'HandleCount' -ComparisonType number -Operator lt -Value 200 -BackgroundColor MidnightBlue -Color White
            }
        }
    }
    Tab -Name 'second tab' {
        Panel {
            Table -DataTable $Process2
        }
        Panel {
            Table -DataTable $Process2
        }
        Panel {
            Table -DataTable $Process2
        }
    }
}