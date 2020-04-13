
New-HTML {

    New-HTMLSection -HeaderText 'Donut Charts - Defaults' -CanCollapse {
        New-HTMLPanel {
            New-HTMLChart -Gradient {
                New-ChartDonut -Name 'Test' -Value 20
                New-ChartDonut -Name 'Test1' -Value 30
                New-ChartDonut -Name 'Test2' -Value 40
                New-ChartDonut -Name 'Test1' -Value 30
                New-ChartDonut -Name 'Test2' -Value 40
            }
        }
        New-HTMLPanel {
            New-HTMLChart -Gradient {
                New-ChartDonut -Name 'Test' -Value 20
                New-ChartDonut -Name 'Test1' -Value 30
                New-ChartDonut -Name 'Test2' -Value 40
                New-ChartDonut -Name 'Test1' -Value 30
                New-ChartDonut -Name 'Test2' -Value 40
            }
        }
        New-HTMLPanel {
            New-HTMLChart -Gradient {
                New-ChartDonut -Name 'Test' -Value 20
                New-ChartDonut -Name 'Test1' -Value 30
                New-ChartDonut -Name 'Test2' -Value 40
                New-ChartDonut -Name 'Test1' -Value 30
                New-ChartDonut -Name 'Test2' -Value 40
            }
        }
    }
} -ShowHTML -FilePath $PSScriptRoot\Example-ChartsBarDonuts.html -Online