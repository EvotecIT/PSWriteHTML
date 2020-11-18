Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'Charts - TimeLine' -Online -FilePath $PSScriptRoot\Example-ChartTimeLine02.html {
    New-HTMLSection -Invisible {
        New-HTMLPanel {
            New-HTMLChart -Title 'Incidents Reported vs Solved' -TitleAlignment center {
                New-ChartTooltip -TitleText 'Timeline' -XAxisFormatPattern 'HH:mm:ss'
                New-ChartAxisX -MinValue ((Get-Date).AddDays(-1)) -MaxValue ((Get-Date).AddDays(1)) -Type 'datetime'
                $From = (Get-Date).AddDays(-1)
                $To = (Get-Date)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Test 0'
                $From = (Get-Date).AddHours(-1)
                $To = (Get-Date)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Test 1' -Color Red
                $From = (Get-Date).AddDays(0)
                $To = (Get-Date).AddHours(5)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Test 2' -Color Yellow
                $From = (Get-Date).AddHours(-5)
                $To = (Get-Date).AddHours(11)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Test 3' -Color Beige
                $From = (Get-Date).AddMinutes(15)
                $To = (Get-Date).AddHours(3)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Test 4'
            }
        }
        New-HTMLPanel {
            New-HTMLChart -Title 'Incidents Reported vs Solved' -TitleAlignment center {
                New-ChartTooltip -TitleText 'Timeline' -XAxisFormatPattern 'HH:mm:ss'
                New-ChartAxisX -MinValue (Get-Date) -MaxValue ((Get-Date).AddHours(1)) -Type 'datetime'
                $From = (Get-Date).AddMinutes(15)
                $To = (Get-Date).AddMinutes(30)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Test 1' -Color Red
                $From = (Get-Date).AddMinutes(27)
                $To = (Get-Date).AddMinutes(59)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Test 2' -Color Yellow
                $From = (Get-Date).AddMinutes(1)
                $To = (Get-Date).AddMinutes(30)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Test 3' -Color Beige
            }
        }
        New-HTMLPanel {
            New-HTMLChart -Title 'Incidents Reported vs Solved' -TitleAlignment center {
                New-ChartTooltip -TitleText 'Timeline' -XAxisFormatPattern 'HH:mm:ss'
                $From = (Get-Date).AddMinutes(15)
                $To = (Get-Date).AddMinutes(30)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Test 1' -Color Red
                $From = (Get-Date).AddMinutes(27)
                $To = (Get-Date).AddMinutes(59)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Test 2' -Color Yellow
                $From = (Get-Date).AddMinutes(1)
                $To = (Get-Date).AddMinutes(30)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Test 3' -Color Beige
            }
        }
        New-HTMLPanel {
            New-HTMLChart -Title 'Incidents Reported vs Solved' -TitleAlignment center {
                $From = (Get-Date).AddMinutes(15)
                $To = (Get-Date).AddMinutes(30)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Test 1' -Color Red
                $From = (Get-Date).AddMinutes(27)
                $To = (Get-Date).AddMinutes(59)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Test 2' -Color Yellow
                $From = (Get-Date).AddMinutes(1)
                $To = (Get-Date).AddMinutes(30)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Test 3' -Color Beige
            }
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLPanel {
            New-HTMLChart -Title 'Days' -TitleAlignment center {
                New-ChartAxisY # this hides AXIS Y
                New-ChartDataLabel -Enabled -DataLabelsColor Black, Red, Red, Red, Red
                $From = (Get-Date).AddDays(-1)
                $To = (Get-Date).AddDays(2)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Analysis' -Color Red
                $From = (Get-Date).AddDays(0)
                $To = (Get-Date).AddDays(5)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Design' -Color Yellow
                $From = (Get-Date).AddDays(1)
                $To = (Get-Date).AddDays(8)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Coding' -Color Beige
                $From = (Get-Date).AddDays(3)
                $To = (Get-Date).AddDays(7)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Testing' -Color Beige
                $From = (Get-Date).AddDays(8)
                $To = (Get-Date).AddDays(10)
                New-ChartTimeLine -DateFrom $From -DateTo $To -Name 'Deployment' -Color Beige
            }
        }
    }
} -ShowHTML