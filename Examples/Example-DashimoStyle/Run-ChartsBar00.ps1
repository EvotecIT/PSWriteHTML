Import-Module .\PSWriteHTML.psd1 -Force

$Process = Get-Process | Select-Object -First 30

Dashboard -Name 'Charts - Bar' -FilePath $PSScriptRoot\Output\DashboardChartsBar00.html -Online {
    Section -Invisible {
        Panel -Invisible {
            Chart {
                ChartLegend -Name 'Time'
                ChartBar -Name 'Test' -Value 1
                ChartBar -Name 'Test1' -Value 2
                ChartBar -Name 'Test2' -Value 3
            }
        }
        Panel -Invisible {
            Chart {
                ChartToolbar -Download
                ChartLegend -Name 'Time', 'Money', 'Taxes'
                ChartBar -Name 'Test' -Value 1, 2, 3
                ChartBar -Name 'Test1' -Value 2, 5, 7
                ChartBar -Name 'Test2' -Value 3, 1, 2
            }
        }
        Panel -Invisible {
            Chart {
                ChartLegend -Name 'Time'
                for ($i = 0; $i -le 5; $i++) {
                    ChartBar -Name "Test $i" -Value $i
                }
            }
        }
        Panel -Invisible {
            Chart {
                ChartBarOptions -Vertical -DataLabelsColor GreenYellow
                ChartLegend -Name 'Time'
                for ($i = 0; $i -le 5; $i++) {
                    ChartBar -Name "Test $i" -Value $i
                }
            }
        }
    }
    Section -Invisible {
        Table -DataTable $Process -HideFooter {
            TableConditionalFormatting -Name 'ID' -ComparisonType number -Operator gt -Value 10000 -Color BlueViolet -Row
            TableConditionalFormatting -Name 'Name' -ComparisonType string -Operator eq -Value 'chrome' -Color White -BackgroundColor Crimson -Row
            TableConditionalFormatting -Name 'PriorityClass' -ComparisonType string -Operator eq -Value 'Idle' -Color White -BackgroundColor Green
        }
    }
    Section -Invisible {
        Panel -Invisible {
            Chart -Title 'Incidents Reported vs Solved' -TitleAlignment center {
                ChartAxisX -Name 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'
                ChartLine -Name 'Incidents per month' -Value 10, 41, 35, 51, 49, 62, 69, 91, 148
                ChartLine -Name 'Incidents per month resolved' -Value 5, 10, 20, 31, 49, 62, 69, 91, 148
            }
        }
        Panel -Invisible {
            Chart -Title 'Incidents Reported vs Solved' -TitleAlignment center {
                ChartAxisX -Name 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'
                ChartLine -Name 'Incidents per month' -Value 10, 41, 35, 51, 49, 62, 69, 91, 148 -Color Red -Cap square -Dash 5
                ChartLine -Name 'Incidents per month resolved' -Value 5, 10, 20, 31, 49, 62, 69, 91, 148 -Color Green -Curve stepline -Width 10
            }
        }
        Panel -Invisible {
            Table -DataTable $Process -Filtering -FilteringLocation Bottom -PagingOptions 7, 14 {
                TableButtonExcel
                TableButtonPDF -Title 'Test' -PageSize A4 -Orientation landscape
                TableButtonPageLength
                TableConditionalFormatting -Name 'ID' -ComparisonType number -Operator gt -Value 10000 -Color BlueViolet -Row
                TableConditionalFormatting -Name 'Name' -ComparisonType string -Operator eq -Value 'chrome' -Color White -BackgroundColor Crimson -Row
                TableConditionalFormatting -Name 'PriorityClass' -ComparisonType string -Operator eq -Value 'Idle' -Color White -BackgroundColor Green
            }
        }
    }
} -Show