New-HTML -TitleText 'My title' -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example23_02.html {
    New-HTMLSection -HeaderText 'Bar Charts - Test' -CanCollapse {
        New-HTMLPanel {
            New-HTMLChart {
                New-ChartLegend -Name 'Time' -Color Red
                New-ChartBar -Name 'Test' -Value 1
                New-ChartBar -Name 'Test1' -Value 2
                New-ChartBar -Name 'Test2' -Value 3
            }
        }
        New-HTMLPanel {
            New-HTMLChart {
                New-ChartLegend -Name 'Time', 'Test', 'Test3' -Color BlueViolet, Beige, YellowGreen
                New-ChartBar -Name 'Test' -Value 1, 2, 3
                New-ChartBar -Name 'Test1' -Value 2, 5, 7
                New-ChartBar -Name 'Test2' -Value 3, 1, 2
            }
        }
        New-HTMLPanel {
            New-HTMLChart {
                New-ChartLegend -Name 'Time'
                for ($i = 0; $i -le 5; $i++) {
                    New-ChartBar -Name "Test $i" -Value $i
                }
            }
        }
    }
} -Open