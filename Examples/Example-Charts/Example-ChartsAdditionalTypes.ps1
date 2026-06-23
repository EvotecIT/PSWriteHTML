Import-Module .\PSWriteHTML.psd1 -Force

$FilePath = Join-Path $PSScriptRoot 'Example-ChartsAdditionalTypes.html'

New-HTML -TitleText 'Additional Chart Types' -FilePath $FilePath -Online {
    New-HTMLSection -HeaderText 'Area chart' {
        New-HTMLChart -Title 'Quarterly Revenue' {
            New-ChartAxisX -Name 'Q1', 'Q2', 'Q3', 'Q4'
            New-ChartArea -Name 'Revenue' -Value 42, 55, 48, 64 -Color DodgerBlue -Curve smooth
        }
    }

    New-HTMLSection -HeaderText 'Scatter and bubble charts' {
        New-HTMLPanel {
            New-HTMLChart -Title 'Sample Distribution' {
                New-ChartScatter -Name 'Samples' -X 1, 2, 3, 4 -Y 8, 12, 7, 15 -Color Purple
            }
        }
        New-HTMLPanel {
            New-HTMLChart -Title 'Risk Size' {
                New-ChartBubble -Name 'Risk' -X 1, 2, 3, 4 -Y 15, 22, 13, 28 -Z 4, 8, 5, 12 -Color Orange
            }
        }
    }

    New-HTMLSection -HeaderText 'Heatmap and radar charts' {
        New-HTMLPanel {
            New-HTMLChart -Title 'Daily Load' {
                New-ChartHeatmap -Name 'Monday' -X 'AM', 'Noon', 'PM' -Y 12, 18, 14
                New-ChartHeatmap -Name 'Tuesday' -Data ([ordered] @{ AM = 9; Noon = 20; PM = 16 })
            }
        }
        New-HTMLPanel {
            New-HTMLChart -Title 'Coverage' {
                New-ChartAxisX -Name 'Identity', 'Mail', 'Devices', 'Apps'
                New-ChartRadar -Name 'Tenant A' -Value 70, 85, 62, 91 -Color SeaGreen
            }
        }
    }

    New-HTMLSection -HeaderText 'Custom pie labels' {
        New-HTMLChart -Title 'Status' {
            New-ChartPie -Name 'One' -Value 10 -Color SeaGreen
            New-ChartPie -Name 'Two' -Value 3 -Color FireBrick
            New-ChartLabel -Name 'Healthy', 'Needs attention'
        }
    }
}
