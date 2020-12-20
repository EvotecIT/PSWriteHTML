Import-Module .\PSWriteHTML.psd1 -Force

Dashboard -Name 'Dashimo Test' -FilePath $PSScriptRoot\Output\DashboardTabsLoop.html -Show {
    $Tabs = 'vCenter', 'vCenter1', 'vCenter2'
    foreach ($_ in $Tabs) {
        Tab -Name $_ {
            Section -Name 'Test' {
                $Process = Get-Process | Select-Object -First 5
                Table -DataTable $Process {
                    TableConditionalFormatting -Name 'ID' -ComparisonType number -Operator gt -Value 16000 -Color BlueViolet -Row
                    TableConditionalFormatting -Name 'PriorityClass' -ComparisonType string -Operator eq -Value 'Normal' -BackgroundColor Gold
                    TableConditionalFormatting -Name 'PriorityClass' -ComparisonType string -Operator eq -Value 'Idle' -BackgroundColor Gold -Color Green
                }
            }
        }
    }
    for ($i = 0; $i -lt 5; $i++) {
        Tab -Name "vCenter#$i" {
            Section -Name "Section Name$i" {
                $Process = Get-Process | Select-Object -First 5
                Table -DataTable $Process {
                    TableConditionalFormatting -Name 'ID' -ComparisonType number -Operator gt -Value 16000 -Color BlueViolet -Row
                    TableConditionalFormatting -Name 'PriorityClass' -ComparisonType string -Operator eq -Value 'Normal' -BackgroundColor Gold
                    TableConditionalFormatting -Name 'PriorityClass' -ComparisonType string -Operator eq -Value 'Idle' -BackgroundColor Gold -Color Green
                }
            }
        }
    }
}