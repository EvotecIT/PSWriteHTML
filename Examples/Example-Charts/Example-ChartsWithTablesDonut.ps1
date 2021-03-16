Import-Module .\PSWriteHTML.psd1 -Force

# Define data
$DataTable = @(
    [PSCustomObject] @{
        Name     = 'My Object 1'
        Time     = 1
        DateFrom = (Get-Date).AddDays(-1)
        DateTo   = (Get-Date)
    }
    [PSCustomObject] @{
        Name     = 'My Object 2'
        Time     = 5
        DateFrom = (Get-Date).AddDays(-3)
        DateTo   = (Get-Date).AddDays(3)
    }
    [PSCustomObject] @{
        Name     = 'My Object 3'
        Time     = 12
        DateFrom = (Get-Date).AddDays(3)
        DateTo   = (Get-Date).AddDays(7)
    }
)

New-HTML {
    New-HTMLTableOption -DataStore JavaScript
    New-HTMLTable -DataTable $DataTable -DataTableID 'Ooopsa'
    New-HTMLChart -Gradient {
        foreach ($Object in $DataTable) {
            New-ChartDonut -Name $Object.Name -Value $Object.Time
        }
        New-ChartEvent -DataTableID 'Ooopsa' -ColumnID 0
    }
} -ShowHTML -FilePath $PSScriptRoot\Example-ChartsWithTablesDonut.html -Online