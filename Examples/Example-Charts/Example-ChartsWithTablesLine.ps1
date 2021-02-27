Import-Module .\PSWriteHTML.psd1 -Force

$DataTable = @(
    [PSCustomObject] @{ Name = 'Service Desk 1'; Incidents = 1; Resolved = 0; Year = 2001 }
    [PSCustomObject] @{ Name = 'Service Desk 2'; Incidents = 20; Resolved = 15; Year = 2002 }
    [PSCustomObject] @{ Name = 'Service Desk 3'; Incidents = 40; Resolved = 19; Year = 2003 }
    [PSCustomObject] @{ Name = 'Service Desk 4'; Incidents = 15; Resolved = 25; Year = 2004 }
    [PSCustomObject] @{ Name = 'Service Desk 5'; Incidents = 10; Resolved = 19; Year = 2005 }
    [PSCustomObject] @{ Name = 'Service Desk 6'; Incidents = 45; Resolved = 45; Year = 2006 }
    [PSCustomObject] @{ Name = 'Service Desk 7'; Incidents = 18; Resolved = 15; Year = 2007 }
    [PSCustomObject] @{ Name = 'Service Desk 8'; Incidents = 60; Resolved = 50; Year = 2008 }
    [PSCustomObject] @{ Name = 'Service Desk 9'; Incidents = 18; Resolved = 5; Year = 2009 }
    [PSCustomObject] @{ Name = 'Service Desk 0'; Incidents = 9; Resolved = 2; Year = 2010 }
)

New-HTML -TitleText 'Charts - Line' -Online -FilePath $PSScriptRoot\Example-ChartsWithTablesLine.html {
    New-HTMLTable -DataTable $DataTable -DataTableID 'IDTable'
    New-HTMLSection -HeaderText 'Line Charts' -CanCollapse {
        New-HTMLPanel {
            New-HTMLChart -Title 'Incidents Reported vs Solved' -TitleAlignment center {
                New-ChartAxisX -Name $DataTable.Year
                New-ChartLine -Name 'Incidents per month' -Value $DataTable.Incidents
                New-ChartLine -Name 'Incidents per month resolved' -Value $DataTable.Resolved
                New-ChartEvent -DataTableID 'IDTable' -ColumnID 3
            }
        }
    }
    New-HTMLPanel {
        New-HTMLChart -Title 'Resolved Incidents' -TitleAlignment left {
            # This controls how the grid looks like
            New-ChartGrid -Show -Position front -xAxisLinesShow -StrokeDash 5 -RowColors Aquamarine, DarkCyan
            # This is category (responsible for values on axis X)
            New-ChartAxisX -Name $DataTable.Name -TitleText 'Month'
            New-ChartAxisY -TitleText 'Number of Incidents' -Show -ShowAlways
            # Data and control of data
            New-ChartLine -Name "Incidents per month" -Value $DataTable.Incidents -Curve smooth #-Color Red -Cap square -Dash 5
            New-ChartLine -Name "Incidents per month resolved" -Value $DataTable.Resolved -Curve smooth #-Color Green -Curve stepline -Width 10
            #New-ChartEvent -DataTableID 'IDTable' -ColumnID 0
        }
    }
} -Show