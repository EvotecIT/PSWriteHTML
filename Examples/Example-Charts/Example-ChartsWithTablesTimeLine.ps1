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
New-HTML -TitleText 'Charts - TimeLine' -Online -FilePath $PSScriptRoot\Example-ChartsWithTablesTimeLine.html {
    New-HTMLTable -DataTable $DataTable -DataTableID 'NewIDtoSearchInChart'
    New-HTMLChart -Title 'Incidents Reported vs Solved' -TitleAlignment center {
        foreach ($Object in $DataTable) {
            New-ChartTimeLine -DateFrom $Object.DateFrom -DateTo $Object.DateTo -Name $Object.Name
        }
        New-ChartEvent -DataTableID 'NewIDtoSearchInChart' -ColumnID 0
    }
} -ShowHTML