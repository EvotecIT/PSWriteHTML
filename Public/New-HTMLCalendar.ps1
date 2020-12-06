function New-HTMLCalendar {
    [alias('Calendar')]
    [CmdletBinding()]
    param(
        [ScriptBlock] $CalendarSettings,
        [ValidateSet(
            'prev', 'next', 'today', 'prevYear', 'nextYear', 'dayGridDay', 'dayGridWeek', 'dayGridMonth',
            'timeGridWeek', 'timeGridDay', 'listDay', 'listWeek', 'listMonth', 'title'
        )][string[]] $HeaderLeft = @('prev', 'next', 'today'),
        [ValidateSet(
            'prev', 'next', 'today', 'prevYear', 'nextYear', 'dayGridDay', 'dayGridWeek', 'dayGridMonth',
            'timeGridWeek', 'timeGridDay', 'listDay', 'listWeek', 'listMonth', 'title'
        )][string[]]$HeaderCenter = 'title',
        [ValidateSet(
            'prev', 'next', 'today', 'prevYear', 'nextYear', 'dayGridDay', 'dayGridWeek', 'dayGridMonth',
            'timeGridWeek', 'timeGridDay', 'listDay', 'listWeek', 'listMonth', 'title'
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
            'dayGridDay', 'dayGridWeek', 'dayGridMonth', 'timeGridDay', 'timeGridWeek', 'listDay', 'listWeek', 'listMonth'
        )][string] $InitialView
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
        eventDidMount         = 'ReplaceMe'
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
        #// customize the button names,
        #// otherwise they'd all just say "list"
        views                 = @{
            listDay   = @{ buttonText = 'list day' }
            listWeek  = @{ buttonText = 'list week' }
            listMonth = @{ buttonText = 'list month' }
        }
    }
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
    if ($PSEdition -eq 'Desktop') {
        $TextToFind = '"eventDidMount":  "ReplaceMe"'
    } else {
        $TextToFind = '"eventDidMount": "ReplaceMe"'
    }
    $CalendarJSON = $CalendarJSON.Replace($TextToFind, $eventDidMount)

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