function New-HTMLCalendar {
    param(

    )
    if (-not $Script:HTMLSchema.Features) {
        Write-Warning 'New-HTMLCalendar - Creation of HTML aborted. Most likely New-HTML is missing.'
        Exit
    }
    $Script:HTMLSchema.Features.FullCalendar = $true
    $Script:HTMLSchema.Features.FullCalendarCore = $true
    $Script:HTMLSchema.Features.FullCalendarDayGrid = $true
    $Script:HTMLSchema.Features.FullCalendarInteraction = $true
    $Script:HTMLSchema.Features.FullCalendarList = $true
    $Script:HTMLSchema.Features.FullCalendarTimeGrid = $true
    $Script:HTMLSchema.Features.FullCalendarTimeLine = $true

    [string] $ID = "Calendar-" + (Get-RandomStringName -Size 8)

    $Calendar = @"
    plugins: ['interaction', 'dayGrid', 'timeGrid', 'list'],
    header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
    },
    defaultDate: '2019-08-12',
    navLinks: true, // can click day/week names to navigate views
    businessHours: true, // display business hours
    editable: true,
    events: [{
            title: 'Business Lunch',
            start: '2019-08-03T13:00:00',
            constraint: 'businessHours'
        },
        {
            title: 'Meeting',
            start: '2019-08-13T11:00:00',
            constraint: 'availableForMeeting', // defined below
            color: '#257e4a'
        },
        {
            title: 'Conference',
            start: '2019-08-18',
            end: '2019-08-20'
        },
        {
            title: 'Party',
            start: '2019-08-29T20:00:00'
        },

        // areas where "Meeting" must be dropped
        {
            groupId: 'availableForMeeting',
            start: '2019-08-11T10:00:00',
            end: '2019-08-11T16:00:00',
            rendering: 'background'
        },
        {
            groupId: 'availableForMeeting',
            start: '2019-08-13T10:00:00',
            end: '2019-08-13T16:00:00',
            rendering: 'background'
        },

        // red areas where no events can be dropped
        {
            start: '2019-08-24',
            end: '2019-08-28',
            overlap: false,
            rendering: 'background',
            color: '#ff9f89'
        },
        {\
            start: '2019-08-06',
            end: '2019-08-08',
            overlap: false,
            rendering: 'background',
            color: '#ff9f89'
        }
    ]
"@

    $Script = New-HTMLTag -Tag 'script' -Value {
        "document.addEventListener('DOMContentLoaded', function () {"
        "var calendarEl = document.getElementById('$ID');"
        'var calendar = new FullCalendar.Calendar(calendarEl, {'
        $Calendar
        '});'
        'calendar.render();'
        '}); '
    } -NewLine


    $Div = New-HTMLTag -Tag 'div' -Attributes @{ id = $ID; class = 'calendarFullCalendar'; style = $Style }

    $Script
    $Div
}