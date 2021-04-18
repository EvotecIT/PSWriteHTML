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

New-HTML -TitleText 'Charts - Line' -Online -FilePath $PSScriptRoot\Example-ChartsMultiSeries.html {
    New-HTMLTable -DataTable $DataTable -DataTableID 'IDTable'
    New-HTMLChart -Title 'Incidents Reported vs Solved' -TitleAlignment center {
        New-ChartAxisX -Name $DataTable.Year
        New-ChartAxisY -TitleText 'Series A' -Show
        New-ChartAxisY -TitleText 'Series B' -Show
        New-ChartLine -Name 'Incidents per month' -Value $DataTable.Incidents -Color Yellow
        New-ChartLine -Name 'Incidents per month resolved' -Value $DataTable.Resolved -Color Green
        New-ChartEvent -DataTableID 'IDTable' -ColumnID 3
    }
} -Show