Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {
    New-HTMLSection -HeaderText 'Donut Charts - Defaults' -CanCollapse {
        New-HTMLPanel {
            New-HTMLChart {
                New-ChartToolbar -Download
                #New-ChartBarOptions -Gradient
                New-ChartLegend -Name 'Time', 'Money', 'Taxes', 'test'
                New-ChartBar -Name 'Test' -Value 1, 2, 3, 0
                New-ChartBar -Name 'Test1' -Value 2, 5, 7, 0
                New-ChartBar -Name 'Test2' -Value 3, 1, 50, 5
            }
        }
        New-HTMLPanel {
            New-HTMLChart {
                New-ChartToolbar -Download
                #New-ChartBarOptions -Gradient
                New-ChartLegend -Name 'Time', 'Money', 'Taxes' -Color Red, Yellow, Green
                New-ChartBar -Name 'Test' -Value 1, 2, 3
                New-ChartBar -Name 'Test1' -Value 2, 5, 7
                New-ChartBar -Name 'Test2' -Value 3, 1, 2
            }
        }
        New-HTMLPanel {
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
} -ShowHTML -FilePath $PSScriptRoot\Example-ChartBarNext.html -Online -Format