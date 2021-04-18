Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'Charts - TimeLine' -Online -FilePath $PSScriptRoot\Example-ChartTimeLine.html {
    #New-HTMLTabStyle -SlimTabs
    #New-HTMLTab -Name 'TimeLine Charts' -IconRegular hourglass {
    New-HTMLSection -Invisible {
        New-HTMLPanel {
            New-HTMLChart -Title 'Incidents Reported vs Solved' -TitleAlignment center {
                New-ChartAxisY -TitleText 'Some Testing Title 1' -Show
                #New-ChartAxisX -Name 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'
                #New-ChartLine -Name 'Incidents per month' -Value 10, 41, 35, 51, 49, 62, 69, 91, 148
                #New-ChartLine -Name 'Incidents per month resolved' -Value 5, 10, 20, 31, 49, 62, 69, 91, 148

                $From = (Get-Date).AddDays(-1)
                $To = (Get-Date)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Test 0'
                $From = (Get-Date).AddDays(-1)
                $To = (Get-Date)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Test 1' -Color Red
                $From = (Get-Date).AddDays(0)
                $To = (Get-Date).AddDays(2)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Test 2' -Color Yellow
                $From = (Get-Date).AddDays(-5)
                $To = (Get-Date).AddDays(11)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Test 3' -Color Beige
                $From = (Get-Date).AddDays(-5)
                $To = (Get-Date).AddDays(11)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Test 4'
            }
        }
        New-HTMLPanel {
            New-HTMLChart -Title 'Incidents Reported vs Solved' -TitleAlignment center {
                #New-ChartAxisX -Name 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'
                #New-ChartLine -Name 'Incidents per month' -Value 10, 41, 35, 51, 49, 62, 69, 91, 148
                #New-ChartLine -Name 'Incidents per month resolved' -Value 5, 10, 20, 31, 49, 62, 69, 91, 148
                $From = (Get-Date).AddDays(-1)
                $To = (Get-Date)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Test 1' -Color Red
                $From = (Get-Date).AddDays(0)
                $To = (Get-Date).AddDays(2)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Test 2' -Color Yellow
                $From = (Get-Date).AddDays(-5)
                $To = (Get-Date).AddDays(11)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Test 3' -Color Beige
            }
        }
    }
    #}
} -ShowHTML