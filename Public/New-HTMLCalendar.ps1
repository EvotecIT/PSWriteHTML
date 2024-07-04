function New-HTMLCalendar {
    <#
    .SYNOPSIS
    Creates a new HTML calendar using FullCalendar library.

    .DESCRIPTION
    This function creates a new HTML calendar using the FullCalendar library. It allows customization of various calendar settings such as header elements, initial view, default date, event handling, and more.

    .PARAMETER CalendarSettings
    Specifies the script block containing settings for the calendar.

    .PARAMETER HeaderLeft
    Specifies the elements to display on the left side of the calendar header.

    .PARAMETER HeaderCenter
    Specifies the element to display in the center of the calendar header.

    .PARAMETER HeaderRight
    Specifies the elements to display on the right side of the calendar header.

    .PARAMETER DefaultDate
    Specifies the default date to display on the calendar.

    .PARAMETER NavigationLinks
    Indicates whether navigation links are enabled on the calendar.

    .PARAMETER NowIndicator
    Indicates whether the current time indicator is displayed on the calendar.

    .PARAMETER EventLimit
    Indicates whether to limit the number of events displayed on a day.

    .PARAMETER WeekNumbers
    Indicates whether week numbers are displayed on the calendar.

    .PARAMETER Selectable
    Indicates whether events can be selected on the calendar.

    .PARAMETER SelectMirror
    Indicates whether a mirror effect is applied when selecting events.

    .PARAMETER BusinessHours
    Indicates whether business hours are displayed on the calendar.

    .PARAMETER Editable
    Indicates whether events are editable on the calendar.

    .PARAMETER InitialView
    Specifies the initial view of the calendar.

    .PARAMETER UrlTarget
    Specifies the target URL for calendar events.

    .PARAMETER EventTimeFormat
    Specifies the format for displaying event times.

    .PARAMETER SlotLabelFormat
    Specifies the format for displaying slot labels.

    .EXAMPLE
    New-HTMLCalendar -CalendarSettings {
        # Define calendar settings here
    }

    Creates a new HTML calendar with default settings.

    .EXAMPLE
    New-HTMLCalendar -CalendarSettings {
        # Define calendar settings here
    } -HeaderLeft 'prev', 'next' -HeaderCenter 'title' -HeaderRight 'dayGridMonth', 'timeGridWeek' -DefaultDate (Get-Date) -NavigationLinks $true -NowIndicator $true -EventLimit $true -WeekNumbers $true -Selectable $true -SelectMirror $true -BusinessHours -Editable -InitialView 'dayGridMonth' -UrlTarget 'https://example.com' -EventTimeFormat @{
        hour           = '2-digit'
        minute         = '2-digit'
        omitZeroMinute = $false
        meridiem       = $false
        hour12         = $false
    } -SlotLabelFormat @{
        hour           = '2-digit'
        minute         = '2-digit'
        omitZeroMinute = $false
        meridiem       = $false
        hour12         = $false
    }

    Creates a new HTML calendar with custom settings.

    #>
    [alias('Calendar')]
    [CmdletBinding()]
    param(
        [ScriptBlock] $CalendarSettings,
        [ValidateSet(
            'prev', 'next', 'today', 'prevYear', 'nextYear', 'dayGridDay', 'dayGridWeek', 'dayGridMonth',
            'timeGridWeek', 'timeGridDay', 'listDay', 'listWeek', 'listMonth', 'title', 'listYear'
        )][string[]] $HeaderLeft = @('prev', 'next', 'today'),
        [ValidateSet(
            'prev', 'next', 'today', 'prevYear', 'nextYear', 'dayGridDay', 'dayGridWeek', 'dayGridMonth',
            'timeGridWeek', 'timeGridDay', 'listDay', 'listWeek', 'listMonth', 'title', 'listYear'
        )][string[]]$HeaderCenter = 'title',
        [ValidateSet(
            'prev', 'next', 'today', 'prevYear', 'nextYear', 'dayGridDay', 'dayGridWeek', 'dayGridMonth',
            'timeGridWeek', 'timeGridDay', 'listDay', 'listWeek', 'listMonth', 'title', 'listYear'
        )][string[]] $HeaderRight = @('dayGridMonth', 'timeGridWeek', 'timeGridDay', 'listMonth'),
        [DateTime] $DefaultDate = (Get-Date),
        [bool] $NavigationLinks = $true,
        [bool] $NowIndicator = $true,
        [bool] $EventLimit = $true,
        [bool] $WeekNumbers = $true,
        #[bool] $WeekNumbersWithinDays = $true,
        [bool] $Selectable = $true,
        [bool] $SelectMirror = $true,
        [switch] $BusinessHours,
        [switch] $Editable,
        [ValidateSet(
            'dayGridDay', 'dayGridWeek', 'dayGridMonth', 'timeGridDay', 'timeGridWeek', 'listDay', 'listWeek', 'listMonth', 'listYear'
        )][string] $InitialView,
        [string] $UrlTarget,
        [System.Collections.IDictionary] $EventTimeFormat = [ordered] @{
            hour           = '2-digit'
            minute         = '2-digit'
            #second   = '2-digit'
            omitZeroMinute = $false
            meridiem       = $false
            hour12         = $false
        },
        [System.Collections.IDictionary] $SlotLabelFormat = [ordered] @{
            hour           = '2-digit'
            minute         = '2-digit'
            #second   = '2-digit'
            omitZeroMinute = $false
            meridiem       = $false
            hour12         = $false
        }
    )
    if (-not $Script:HTMLSchema.Features) {
        Write-Warning 'New-HTMLCalendar - Creation of HTML aborted. Most likely New-HTML is missing.'
        Exit
    }
    $Script:HTMLSchema.Features.MainFlex = $true
    $Script:HTMLSchema.Features.FullCalendar = $true
    $Script:HTMLSchema.Features.Popper = $true

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
        headerToolbar         = @{
            left   = $HeaderLeft -join ','
            center = $HeaderCenter -join ','
            right  = $HeaderRight -join ','
        }

        initialView           = $InitialView
        initialDate           = '{0:yyyy-MM-dd}' -f ($DefaultDate)
        eventDidMount         = 'eventDidMountReplaceMe'
        nowIndicator          = $NowIndicator
        #now: '2018-02-13T09:25:00' // just for demo
        navLinks              = $NavigationLinks #// can click day/week names to navigate views
        businessHours         = $BusinessHours.IsPresent #// display business hours
        editable              = $Editable.IsPresent
        events                = $CalendarEvents
        dayMaxEventRows       = $EventLimit
        weekNumbers           = $WeekNumbers
        weekNumberCalculation = 'ISO'
        selectable            = $Selectable
        selectMirror          = $SelectMirror
        buttonIcons           = $false # // show the prev/next text
        # https://fullcalendar.io/docs/eventTimeFormat
        eventTimeFormat       = $EventTimeFormat
        slotLabelFormat       = $SlotLabelFormat
        #// customize the button names,
        #// otherwise they'd all just say "list"
        views                 = @{
            listDay   = @{ buttonText = 'list day' }
            listWeek  = @{ buttonText = 'list week' }
            listMonth = @{ buttonText = 'list month' }
            listYear  = @{ buttonText = 'list year' }
        }
    }
    $Calendar['eventClick'] = 'eventClickReplaceMe'

    Remove-EmptyValue -Hashtable $Calendar -Recursive
    $CalendarJSON = $Calendar | ConvertTo-Json -Depth 7

    # Adding function for ToolTips / need cleaner way
    $eventDidMount = @"
    eventDidMount: function(info) {
        var tooltip = new Tooltip(info.el, {
            title: info.event.extendedProps.description,
            placement: 'top',
            trigger: 'hover',
            container: 'body'
        });
    }
"@

    if ($UrlTarget) {
        # this allows to open links in new tab, frames etc but on global basis
        $eventClick = @"
    eventClick: function (info) {
        var eventObj = info.event;
        if (eventObj.url) {
            window.open(eventObj.url, '$UrlTarget');
            info.jsEvent.preventDefault(); // prevents browser from following link in current tab.
        }
    }
"@
    } else {
        # this allows to open links in new tab, frames etc but on link per link basis via New-CalendarEvent -TargetName '_blank'
        $eventClick = @"
    eventClick: function (info) {
        var eventObj = info.event;
        if (eventObj.extendedProps.targetName) {
            window.open(eventObj.url, eventObj.extendedProps.targetName);
            info.jsEvent.preventDefault(); // prevents browser from following link in current tab.
        }
    }
"@
    }

    if ($PSEdition -eq 'Desktop') {
        $TextToFind = '"eventDidMount":  "eventDidMountReplaceMe"'
    } else {
        $TextToFind = '"eventDidMount": "eventDidMountReplaceMe"'
    }
    $CalendarJSON = $CalendarJSON.Replace($TextToFind, $eventDidMount)

    if ($PSEdition -eq 'Desktop') {
        $TextToFind = '"eventClick":  "eventClickReplaceMe"'
    } else {
        $TextToFind = '"eventClick": "eventClickReplaceMe"'
    }
    $CalendarJSON = $CalendarJSON.Replace($TextToFind, $eventClick)

    $Div = New-HTMLTag -Tag 'div' -Attributes @{ id = $ID; class = 'calendarFullCalendar'; style = $Style }
    $Script = New-HTMLTag -Tag 'script' -Value {
        "document.addEventListener('DOMContentLoaded', function () {"
        "var calendarEl = document.getElementById('$ID');"
        'var calendar = new FullCalendar.Calendar(calendarEl,'
        $CalendarJSON
        ');'
        'calendar.render();'
        "calendarTracker['$ID'] = calendar;"
        '}); '
    } -NewLine

    # return HTML
    $Div
    $Script
}