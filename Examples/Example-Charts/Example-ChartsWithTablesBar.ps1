Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {
    New-HTMLSection -HeaderText 'Donut Charts - Defaults' -CanCollapse {
        New-HTMLPanel {
            $DataTable = @(
                [PSCustomObject] @{
                    Name  = 'My Object 1'
                    Time  = 1
                    Money = 5
                    Taxes = 20
                }
                [PSCustomObject] @{
                    Name  = 'My Object 2'
                    Time  = 3
                    Money = 1
                    Taxes = 5
                }
                [PSCustomObject] @{
                    Name  = 'My Object 3'
                    Time  = 12
                    Money = 5
                    Taxes = 1
                }
            )

            New-HTMLTable -DataTable $DataTable -DataTableID 'NewIDtoSearchInChart'
            New-HTMLChart {
                New-ChartToolbar -Download
                New-ChartLegend -Name 'Time', 'Money', 'Taxes'
                foreach ($Object in $DataTable) {
                    New-ChartBar -Name $Object.Name -Value $Object.Time, $Object.Money, $Object.Taxes
                }
                New-ChartEvent -DataTableID 'NewIDtoSearchInChart' -ColumnID 0
            }
        }
    }
} -ShowHTML -FilePath $PSScriptRoot\Example-ChartsWithTablesBar.html -Online