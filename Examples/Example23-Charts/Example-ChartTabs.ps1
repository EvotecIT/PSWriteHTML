Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {
    New-HTMLTab -Name 'Test 1' {
        New-HTMLSection -HeaderText 'Test chart1' -CanCollapse {
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartToolbar -Download
                    #New-ChartBarOptions -Gradient
                    New-ChartLegend -Name 'Time', 'Money', 'Taxes'
                    New-ChartBar -Name 'Test' -Value 1, 2, 3
                    New-ChartBar -Name 'Test1' -Value 2, 5, 7
                    New-ChartBar -Name 'Test2' -Value 3, 1, 2
                }
            }
        }
    }
    New-HTMLTab -Name 'Test2' {
        New-HTMLSection -HeaderText 'Test chart2' {
            New-HTMLChart {
                New-ChartToolbar -Download
                New-ChartBarOptions -Type barStacked
                New-ChartLegend -Name 'Time', 'Money', 'Taxes' -Color Red, Yellow, Green
                New-ChartBar -Name 'Test' -Value 1, 2, 3
                New-ChartBar -Name 'Test1' -Value 2, 5, 7
                New-ChartBar -Name 'Test2' -Value 3, 1, 2
            }
        }
    }
    New-HTMLTab -Name 'Test3' {
        New-HTMLSection -HeaderText 'Test chart3' {
            New-HTMLChart {
                New-ChartLegend -Name 'Time' -Color Red
                New-ChartBar -Name 'Test' -Value 1
            }
        }
    }
} -ShowHTML -FilePath $PSScriptRoot\Example-ChartTabs.html -Online