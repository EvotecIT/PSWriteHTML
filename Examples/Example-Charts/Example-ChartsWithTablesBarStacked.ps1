Import-Module .\PSWriteHTML.psd1 -Force

$DataTable = @(
    [PSCustomObject] @{
        Name  = 'My Object 1'
        Time  = 1
        Money = 5
        Taxes = 20
        Year  = 2001
    }
    [PSCustomObject] @{
        Name  = 'My Object 2'
        Time  = 3
        Money = 1
        Taxes = 5
        Year  = 2002
    }
    [PSCustomObject] @{
        Name  = 'My Object 3'
        Time  = 12
        Money = 5
        Taxes = 1
        Year  = 2003
    }
)

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example-ChartsWithTablesBarStacked.html {
    New-HTMLPanel {
        New-HTMLTable -DataTable $DataTable -DataTableID 'NewIDtoSearchInChart'
        New-HTMLChart -Title 'Money vs Taxes vs Time v1' -TitleAlignment center {
            New-ChartBarOptions -Type barStacked
            New-ChartLegend -Name 'Money', 'Taxes', 'Time'
            foreach ($Object in $DataTable) {
                New-ChartBar -Name $Object.Year -Value $Object.Money, $Object.Taxes, $Object.Time
            }
            New-ChartEvent -DataTableID 'NewIDtoSearchInChart' -ColumnID 4

            New-ChartAxisY -TitleText 'Years' -Show -TitleColor Gold
        }
    }

    New-HTMLPanel {
        New-HTMLChart -Title 'Money vs Taxes vs Time v2' {
            New-ChartBarOptions -Type barStacked100Percent
            New-ChartLegend -Name 'Money', 'Taxes', 'Time' -LegendPosition top
            foreach ($Object in $DataTable) {
                New-ChartBar -Name $Object.Year -Value $Object.Money, $Object.Taxes, $Object.Time
            }
            New-ChartEvent -DataTableID 'NewIDtoSearchInChart' -ColumnID 4
        }
    }
} -Show