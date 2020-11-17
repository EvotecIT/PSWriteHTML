Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'Charts - TimeLine' -Online -FilePath $PSScriptRoot\Example-ChartTimeLine.html {
    New-HTMLSection -Invisible {
        New-HTMLPanel {
            New-HTMLChart -Title 'Incidents Reported vs Solved' -TitleAlignment center {
                New-ChartTooltip -TitleText 'Timeline' -XAxisFormatPattern 'HH:mm:s'
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
                New-ChartTooltip -TitleText 'Timeline' -XAxisFormatPattern 'HH:mm:s'
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
    }
} -ShowHTML