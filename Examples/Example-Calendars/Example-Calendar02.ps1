Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -Name 'Test' -FilePath "$PSScriptRoot\Example-Calendar02.html" -Show {
    New-HTMLTab -Name 'Test' {
        New-HTMLCalendar {
            New-CalendarEvent -Title 'Active Directory Meeting' -Description 'We will talk about stuff' -StartDate (Get-Date)
            New-CalendarEvent -Title 'Lunch' -StartDate (Get-Date).AddDays(2).AddHours(-3) -EndDate (Get-Date).AddDays(3) -Description 'Very long lunch'
        } -InitialView listWeek
    }
    New-HTMLTab -Name 'Test 2' {
        New-HTMLSection -HeaderText 'Calendars' {
            New-HTMLCalendar {
                New-CalendarEvent -Title 'Active Directory Meeting' -Description 'We will talk about stuff' -StartDate (Get-Date)
                # End date is required for the colors to work...
                New-CalendarEvent -Title 'Lunch' -StartDate (Get-Date).AddDays(2).AddHours(-3) -EndDate (Get-Date).AddDays(3) -Description 'Very long lunch' -TextColor DeepSkyBlue -BackgroundColor yellow -BorderColor Red
                New-CalendarEvent -Title 'One day event' -StartDate (Get-Date).AddDays(4).AddHours(-3)
            }
            New-HTMLCalendar {
                New-CalendarEvent -Title 'Diff 123 meeting' -Description 'We will talk about stuff' -StartDate (Get-Date)
                New-CalendarEvent -Title 'Ooops 123 i did it again' -StartDate (Get-Date).AddDays(2).AddHours(-3) -EndDate (Get-Date).AddDays(3) -Description 'Very long lunch'
            } -InitialView timeGridDay
        }
        New-HTMLSection -HeaderText 'Table' {
            New-HTMLTable -DataTable (Get-Process | Select-Object -First 3)
        }
        New-HTMLDiagram {
            New-DiagramOptionsLayout -HierarchicalEnabled $true #-HierarchicalDirection FromLeftToRight #-HierarchicalSortMethod directed
            New-DiagramOptionsPhysics -Enabled $true -HierarchicalRepulsionAvoidOverlap 1 -HierarchicalRepulsionNodeDistance 200

            New-DiagramNode -Label '1 test' -To '3', '6', '7' -ColorBackground Bisque
            New-DiagramNode -Label '2' -To 'Przemyslaw Klys', '1 test'
            New-DiagramNode -Label '3' -To 'Przemyslaw Klys', '1 test'
            New-DiagramNode -Label '4' -To 'Przemyslaw Klys', '1 test'
            New-DiagramNode -Label '5' -To 'Przemyslaw Klys', '1 test'
            New-DiagramNode -Label '6' -To 'Przemyslaw Klys', '1 test'
            New-DiagramNode -Label '7' -To 'Przemyslaw Klys', '1 test'
            New-DiagramNode -Label '8' -To 'Przemyslaw Klys', '1 test'
            New-DiagramNode -Label '9' -To 'Przemyslaw Klys', '1 test'
        }
    }
    New-HTMLTab -Name 'Test 3' {
        New-HTMLCalendar {
            New-CalendarEvent -Title 'Diff meeting' -Description 'We will talk about stuff' -StartDate (Get-Date)
            New-CalendarEvent -Title 'Ooops i did it again' -StartDate (Get-Date).AddDays(2).AddHours(-3) -EndDate (Get-Date).AddDays(3) -Description 'Very long lunch'
        } -InitialView timeGridDay
        New-HTMLTable -DataTable (Get-Process | Select-Object -First 3)
    }
} -Online