Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example-ChartsBarColor.html {
    New-HTMLPanel {
        New-HTMLChart {
            New-ChartToolbar -Download
            New-ChartLegend -Name 'Time', 'Money', 'Taxes' -Color '#024DA1', '#AFD135', Green
            New-ChartBar -Name 'Test' -Value 1, 2, 3
            New-ChartBar -Name 'Test1' -Value 2, 5, 7
            New-ChartBar -Name 'Test2' -Value 3, 1, 2
        } -Title 'Testing Title' -TitleAlignment center
    }
} -Show -Format