Import-Module .\PSWriteHTML.psd1 -Force

# Define data
$DataTable = @(
    [PSCustomObject] @{
        Name         = '192.168.0.1'
        ComputerName = 'host1'
        Value        = 12
    }
    [PSCustomObject] @{
        Name         = '192.168.0.2'
        ComputerName = 'host2'
        Value        = 15
    }
    [PSCustomObject] @{
        Name         = '192.168.0.3'
        ComputerName = 'host3'
        Value        = 17
    }
)

# Define HTML
New-HTML {
    New-HTMLTable -DataTable $DataTable -DataTableID 'NewIDtoSearchInChart'
    New-HTMLChart {
        New-ChartToolbar -Download
        foreach ($Object in $DataTable) {
            New-ChartPie -Name $Object.Name -Value $Object.Value
        }
        # Define event
        New-ChartEvent -DataTableID 'NewIDtoSearchInChart' -ColumnID 0
    }
} -ShowHTML -FilePath $PSScriptRoot\Example-ChartsWithTablesDecimal.html -Online #-Format