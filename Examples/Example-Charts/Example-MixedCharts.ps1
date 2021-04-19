Import-Module .\PSWriteHTML.psd1 -Force

$DataTable = @(
    [PSCustomObject] @{ Name = 'Service Desk 1'; Test = 13; Incidents = 1; Resolved = 0; Year = 2001 }
    [PSCustomObject] @{ Name = 'Service Desk 2'; Test = 12; Incidents = 20; Resolved = 15; Year = 2002 }
    [PSCustomObject] @{ Name = 'Service Desk 3'; Test = 15; Incidents = 40; Resolved = 19; Year = 2003 }
    [PSCustomObject] @{ Name = 'Service Desk 4'; Test = 12; Incidents = 15; Resolved = 25; Year = 2004 }
    [PSCustomObject] @{ Name = 'Service Desk 5'; Test = 17; Incidents = 10; Resolved = 19; Year = 2005 }
    [PSCustomObject] @{ Name = 'Service Desk 6'; Test = 12; Incidents = 45; Resolved = 45; Year = 2006 }
    [PSCustomObject] @{ Name = 'Service Desk 7'; Test = 19; Incidents = 18; Resolved = 15; Year = 2007 }
    [PSCustomObject] @{ Name = 'Service Desk 8'; Test = 12; Incidents = 60; Resolved = 50; Year = 2008 }
    [PSCustomObject] @{ Name = 'Service Desk 9'; Test = 20; Incidents = 18; Resolved = 5; Year = 2009 }
    [PSCustomObject] @{ Name = 'Service Desk 0'; Test = 12; Incidents = 9; Resolved = 2; Year = 2010 }
)

New-HTML -TitleText 'Charts - Line' -Online -FilePath $PSScriptRoot\Example-MixedCharts.html {
    New-HTMLTable -DataTable $DataTable -DataTableID 'IDTable'
    New-HTMLChart -Title 'Incidents Reported vs Solved' -TitleAlignment center {
        #New-ChartMarker -Size 30 -Color red -Shape square -StrokeColors yellow
        New-ChartAxisX -Name $DataTable.Year
        New-ChartAxisY -TitleText 'Series A' -Show
        New-ChartAxisY -TitleText 'Series B' -Show -Opposite
        #New-ChartDataLabel -Enabled -DataLabelsColor Green, Yellow, Blue
        New-ChartLine -Name 'Incidents per month' -Value $DataTable.Incidents -Curve smooth -Width 2 -Dash 12 -Cap round
        New-ChartLine -Name 'Incidents per month resolved' -Value $DataTable.Resolved #-Width 1

        New-ChartBar -Name 'Test very long' -Value $DataTable.Test
        #New-ChartBar -Name 'Test very long' -Value $DataTable.Resolved

        New-ChartEvent -DataTableID 'IDTable' -ColumnID 3
    }
} -Show