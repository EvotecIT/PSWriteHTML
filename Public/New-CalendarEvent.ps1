function New-CalendarEvent {
    [alias('CalendarEvent')]
    [CmdletBinding()]
    param(
        [string] $Title,
        [string] $Description,
        [DateTime] $StartDate,
        [nullable[DateTime]] $EndDate,
        [string] $Constraint,
        [string] $Color
    )

    $Object = [PSCustomObject] @{
        Type     = 'CalendarEvent'
        Settings = [ordered] @{
            title       = $Title
            description = $Description
            constraint  = $Constraint
            #      url: 'http://google.com/',
            color       = ConvertFrom-Color -Color $Color
        }
    }
    if ($StartDate) {
        $Object.Settings.start = Get-Date -Date ($StartDate) -Format "yyyy-MM-ddTHH:mm:ss"
    }
    if ($EndDate) {
        $Object.Settings.end = Get-Date -Date ($EndDate) -Format "yyyy-MM-ddTHH:mm:ss"
    }

    Remove-EmptyValues -Hashtable $Object.Settings -Recursive #-Rerun 2
    $Object

    <#


      events: [
        {
          title: 'rrule event',
          rrule: {
            dtstart: '2019-08-09T13:00:00',
            // until: '2019-08-01',
            freq: 'weekly'
          },
          duration: '02:00'
        }
      ],
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
        {
            start: '2019-08-06',
            end: '2019-08-08',
            overlap: false,
            rendering: 'background',
            color: '#ff9f89'
        }
    ]
    #>
}