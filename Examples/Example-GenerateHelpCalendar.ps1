Import-Module .\PSWriteHTML.psd1 -Force

$Files = Get-ChildItem -Path 'C:\Support\GitHub\PSWriteHTML\Examples' -Filter *.html -Recurse

New-HTML -TitleText 'This is a test' -FilePath "$PSScriptRoot\ShowMeCalendar.html" {
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Introduction' {

        }
        New-HTMLSection -HeaderText 'Calendar' {
            New-HTMLCalendar {
                foreach ($File in $Files) {
                    $CalendarEntry = @{
                        Date     = $File.CreationTime
                        FileName = $File.FullName.Replace("$PSScriptRoot\", '')
                        Name     = $File.BaseName
                    }
                    if ($($CalendarEntry.Date).Day -eq $($($CalendarEntry.Date).AddMinutes(30)).Day) {
                        New-CalendarEvent -Title $CalendarEntry.Name -StartDate $CalendarEntry.Date -EndDate $($CalendarEntry.Date).AddMinutes(30) -Url $CalendarEntry.FileName #-TargetName '_blank'
                    } else {
                        New-CalendarEvent -Title $CalendarEntry.Name -StartDate $CalendarEntry.Date.AddMinutes(-30) -EndDate $($CalendarEntry.Date) -Url $CalendarEntry.FileName #-TargetName '_blank'
                    }
                }
            } -HeaderRight @('dayGridMonth', 'timeGridWeek', 'timeGridDay', 'listMonth', 'listYear') #-UrlTarget 'contentFrame'

        }

    }
    New-HTMLSection -Invisible {
        New-HTMLFrame -Name 'contentFrame' -Scrolling Auto -Height 1500px
    }
} -Online -ShowHTML