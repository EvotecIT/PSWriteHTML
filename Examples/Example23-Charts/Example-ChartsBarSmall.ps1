Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {

    New-HTMLSection -HeaderText 'Donut Charts - Defaults' -CanCollapse -Wrap wrap {
        New-HTMLPanel {
            New-HTMLChart -Width 300 {
                New-ChartToolbar -Download
                New-ChartBarOptions -Gradient
                New-ChartLegend -Name 'Time', 'Money', 'Taxes'
                New-ChartBar -Name 'Test' -Value 1, 2, 3
                New-ChartBar -Name 'Test1' -Value 2, 5, 7
                New-ChartBar -Name 'Test2' -Value 3, 1, 2
            }
        }
        New-HTMLPanel{
            New-HTMLChart {
                New-ChartToolbar -Download
                New-ChartBarOptions -Gradient
                New-ChartLegend -Name 'Time', 'Money', 'Taxes'
                New-ChartBar -Name 'Test' -Value 1, 2, 3
                New-ChartBar -Name 'Test1' -Value 2, 5, 7
                New-ChartBar -Name 'Test2' -Value 3, 1, 2
            }
        }
        New-HTMLPanel {
            New-HTMLChart -Width 300 {
                New-ChartToolbar -Download
                New-ChartBarOptions -Gradient
                New-ChartLegend -Name 'Time', 'Money', 'Taxes'
                New-ChartBar -Name 'Test' -Value 1, 2, 3
                New-ChartBar -Name 'Test1' -Value 2, 5, 7
                New-ChartBar -Name 'Test2' -Value 3, 1, 2
            }
        }
    }
} -ShowHTML -FilePath $PSScriptRoot\Example-ChartsBarSmall.html -Online