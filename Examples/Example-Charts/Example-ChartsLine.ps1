Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'Charts - Line' -Online -FilePath $PSScriptRoot\Example-ChartsLine.html {

    New-HTMLChart -Title 'Incidents Reported vs Solved' -TitleAlignment center {
        $Dates = @(
            (Get-Date).AddDays(1).Date.AddMinutes(60)
            (Get-Date).AddDays(2).Date.AddMinutes(60)
            (Get-Date).AddDays(3).Date.AddMinutes(60)
            (Get-Date).AddDays(4).Date.AddMinutes(60)
            (Get-Date).AddDays(5).Date.AddMinutes(60)
            (Get-Date).AddDays(6).Date.AddMinutes(60)
            (Get-Date).AddDays(7).Date.AddMinutes(60)
            (Get-Date).AddDays(8).Date.AddMinutes(60)
            (Get-Date).AddDays(9).Date.AddMinutes(60)
        )
        New-ChartAxisX -Type datetime -Names $Dates
        New-ChartLine -Name 'Incidents per month' -Value 10, 41, 35, 51, 49, 62, 69, 91, 148
        New-ChartLine -Name 'Incidents per month resolved' -Value 5, 10, 20, 31, 49, 62, 69, 91, 148
    }


    New-HTMLPanel {
        New-HTMLChart -Title 'Incidents Reported vs Solved' -TitleAlignment center {
            New-ChartAxisX -Name 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'
            New-ChartLine -Name 'Incidents per month' -Value 10, 41, 35, 51, 49, 62, 69, 91, 148 -Color Red -Cap square -Dash 5
            New-ChartLine -Name 'Incidents per month resolved' -Value 5, 10, 20, 31, 49, 62, 69, 91, 148 -Color Green -Curve stepline -Width 10
        }
    }

} -ShowHTML