Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {
    New-HTMLChart -Title 'OneDrive Utilization' -TitleAlignment center {
        New-ChartLegend -LegendPosition bottom
        New-ChartDonut -Name 'OneDrive Utilization' -Value 15 -Color '#6dbf88'
        New-ChartDonut -Name 'Not Utilized' -Value 20 -Color Yellow
    }
} -ShowHTML -FilePath $PSScriptRoot\Example-ChartDonut.html -Online