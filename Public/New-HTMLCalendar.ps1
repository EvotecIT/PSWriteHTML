function New-HTMLCalendar {
    [alias('Calendar')]
    [CmdletBinding()]
    param(
        [ScriptBlock] $CalendarSettings,
        [ValidateSet('interaction', 'dayGrid', 'timeGrid', 'list', 'rrule')][string[]] $Plugins = @('interaction', 'dayGrid', 'timeGrid', 'list', 'rrule'),
        [ValidateSet('prev', 'next', 'today')][string[]] $ButtonsLeft = @('prev', 'next', 'today'),
        [DateTime] $DefaultDate = (Get-Date),
        [bool] $NavigationLinks = $true,
        [switch] $BusinessHours,
        [switch] $Editable
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
    $Script:HTMLSchema.Features.FullCalendarRRule = $true
    $Script:HTMLSchema.Features.FullCalendarTimeGrid = $true
    $Script:HTMLSchema.Features.FullCalendarTimeLine = $true

    $CalendarEvents = [System.Collections.Generic.List[System.Collections.IDictionary]]::new()

    [Array] $Settings = & $CalendarSettings
    foreach ($Object in $Settings) {
        if ($Object.Type -eq 'CalendarEvent') {
            $CalendarEvents.Add($Object.Settings)
        }
    }

    # Define HTML/Script
    [string] $ID = "Calendar-" + (Get-RandomStringName -Size 8)

    $Calendar = [ordered] @{
        plugins               = $Plugins
        header                = @{
            left   = $ButtonsLeft -join ','
            #left: 'prev,next today',
            center = 'title'
            right  = 'dayGridMonth,timeGridWeek,timeGridDay,listDay,listWeek,listMonth'
            #    right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
            #left: 'prevYear,prev,next,nextYear today',
            #center: 'title',
            #right: 'dayGridMonth,dayGridWeek,dayGridDay'
        }
        defaultDate           = '{0:yyyy-MM-dd}' -f ($DefaultDate) #($DefaultDate.Year, '-', $DefaultDate.Month, '-', $DefaultDate.Day)
        navLinks              = $NavigationLinks #// can click day/week names to navigate views
        businessHours         = $BusinessHours.IsPresent #// display business hours
        editable              = $Editable.IsPresent
        events                = $CalendarEvents
        eventLimit            = $true
        weekNumbers           = $true
        weekNumbersWithinDays = $true
        weekNumberCalculation = 'ISO'
        selectable            = $true
        selectMirror          = $true
        buttonIcons           = $false # // show the prev/next text
        #// customize the button names,
        #// otherwise they'd all just say "list"
        views                 = @{
            listDay  = @{ buttonText = 'list day' }
            listWeek = @{ buttonText = 'list week' }
            listMonth = @{ buttonText = 'list month' }
        }
    } | ConvertTo-Json -Depth 7

    $Div = New-HTMLTag -Tag 'div' -Attributes @{ id = $ID; class = 'calendarFullCalendar'; style = $Style }
    $Script = New-HTMLTag -Tag 'script' -Value {
        "document.addEventListener('DOMContentLoaded', function () {"
        "var calendarEl = document.getElementById('$ID');"
        'var calendar = new FullCalendar.Calendar(calendarEl,'
        $Calendar
        ');'
        'calendar.render();'
        '}); '
    } -NewLine

    # return HTML
    $Script
    $Div
}