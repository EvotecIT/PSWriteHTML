Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -Name 'Test' -FilePath "$PSScriptRoot\Example28-Calendar02.html" -Show {
    New-HTMLTab -Name 'Test' {
        New-HTMLCalendar {
            New-CalendarEvent -Title 'Active Directory Meeting' -Description 'We will talk about stuff' -StartDate (Get-Date)
            New-CalendarEvent -Title 'Lunch' -StartDate (Get-Date).AddDays(2).AddHours(-3) -EndDate  (Get-Date).AddDays(3) -Description 'Very long lunch'
        } -InitialView listWeek
    }
    New-HTMLTab -Name 'Test 2' {
        New-HTMLSection -HeaderText 'Calendars' {
            New-HTMLCalendar {
                New-CalendarEvent -Title '213Active Directory Meeting' -Description 'We will talk about stuff' -StartDate (Get-Date)
                New-CalendarEvent -Title '213Lunch' -StartDate (Get-Date).AddDays(2).AddHours(-3) -EndDate  (Get-Date).AddDays(3) -Description 'Very long lunch'
            }
            New-HTMLCalendar {
                New-CalendarEvent -Title 'Diff 123 meeting' -Description 'We will talk about stuff' -StartDate (Get-Date)
                New-CalendarEvent -Title 'Ooops 123 i did it again' -StartDate (Get-Date).AddDays(2).AddHours(-3) -EndDate  (Get-Date).AddDays(3) -Description 'Very long lunch'
            } -InitialView timeGridDay
        }
        New-HTMLSection -HeaderText 'Table' {
            New-HTMLTable -DataTable (Get-Process | Select-Object -First 3)
        }
    }
    New-HTMLTab -Name 'Test 3' {
        New-HTMLCalendar {
            New-CalendarEvent -Title 'Diff meeting' -Description 'We will talk about stuff' -StartDate (Get-Date)
            New-CalendarEvent -Title 'Ooops i did it again' -StartDate (Get-Date).AddDays(2).AddHours(-3) -EndDate  (Get-Date).AddDays(3) -Description 'Very long lunch'
        } -InitialView timeGridDay
        New-HTMLTable -DataTable (Get-Process | Select-Object -First 3)
    }
} -Online