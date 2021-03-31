Import-Module .\PSWriteHTML.psd1 -Force

# Define data
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

New-HTML -TitleText 'My charts' -Online -FilePath $PSScriptRoot\Example-ChartsWithTablesRadial.html {
    New-HTMLPanel {
        New-HTMLTable -DataTable $DataTable -DataTableID 'NewIDtoSearchInChart'
        New-HTMLChart {
            New-ChartLegend -LegendPosition bottom -HorizontalAlign center -Color Red, Blue, Yellow
            New-ChartTheme -Palette palette5
            foreach ($Object in $DataTable) {
                New-ChartRadial -Name $Object.Name -Value $Object.Money
            }
            # Define event
            New-ChartEvent -DataTableID 'NewIDtoSearchInChart' -ColumnID 0
        }
    }
    New-HTMLPanel {
        New-HTMLTable -DataTable $DataTable -DataTableID 'Oops'
        New-HTMLChart {
            foreach ($Object in $DataTable) {
                New-ChartRadial -Name $Object.Name -Value $Object.Time
            }
            # Define event
            New-ChartEvent -DataTableID 'Oops' -ColumnID 0
        }
    }
} -ShowHTML