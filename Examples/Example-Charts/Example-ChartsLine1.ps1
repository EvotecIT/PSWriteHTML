Import-Module .\PSWriteHTML.psd1 -Force

$test = @(
    @{date = "May 4"; time = "00:02:47"; participantNumber = 0 }
    @{date = "May 4"; time = "00:07:47"; participantNumber = 0 }
    @{date = "May 4"; time = "00:12:47"; participantNumber = 3 }
    @{date = "May 4"; time = "00:17:47"; participantNumber = 2 }
    @{date = "May 4"; time = "00:22:47"; participantNumber = 1 }
    @{date = "May 4"; time = "00:27:47"; participantNumber = 2 }
    @{date = "May 4"; time = "00:32:47"; participantNumber = 3 }
    @{date = "May 4"; time = "00:37:47"; participantNumber = 4 }
    @{date = "May 4"; time = "00:42:47"; participantNumber = 5 }
    @{date = "May 4"; time = "00:47:47"; participantNumber = 10 })

New-HTML -TitleText 'Charts - TimeLine' -Online -FilePath "$PSScriptRoot\Example-ChartsLine1.html" {
    New-HTMLSection -Name 'Total number of Calls' -Collapsable -TextBackGroundColor "#000000" -TextColor "#ff7900" {
        New-HTMLPanel -Invisible {
            New-HTMLChart {
                New-ChartAxisX -Name $test.date
                ChartLegend -Name 'Calls Number'
                New-ChartLine -Name 'Participants Number' -Value $test.participantNumber -Color "#ff7900"
                New-ChartAxisY -Show -TitleText 'Time'
            }
        }
    }
} -ShowHTML