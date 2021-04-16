function New-CalendarEvent {
    <#
    .SYNOPSIS
    Allows adding new calendar events to calendar

    .DESCRIPTION
    Allows adding new calendar events to calendar

    .PARAMETER Title
    The text that will appear on an event.

    .PARAMETER Description
    The text that will appear on an event when hovering over

    .PARAMETER StartDate
    When your event begins. If your event is explicitly allDay, hour, minutes, seconds and milliseconds will be ignored.

    .PARAMETER EndDate
    hen your event ends. If your event is explicitly allDay, hour, minutes, seconds and milliseconds will be ignored. If omitted, your events will appear to have the default duration.

    .PARAMETER Constraint
    A groupId belonging to other events, "businessHours" or "availableForMeeting"

    .PARAMETER Color
    An alias for specifying the backgroundColor and borderColor at the same time.

    .PARAMETER BackgroundColor
    Sets backround color. Only works if EndDate is provided.

    .PARAMETER BorderColor
    Sets border color. Only works if EndDate is provided.

    .PARAMETER TextColor
    Sets color of Text. Only works if EndDate is provided.

    .PARAMETER Url
    A URL that will be visited when this event is clicked by the user.

    .PARAMETER AllDayEvent
    Determines if the event is shown in the “all-day” section of the view, if applicable. Determines if time text is displayed in the event. If this value is not specified, it will be inferred by the start and end properties

    .EXAMPLE
    New-HTMLCalendar {
        New-CalendarEvent -Title 'Active Directory Meeting' -Description 'We will talk about stuff' -StartDate (Get-Date)
        # End date is required for the colors to work...
        New-CalendarEvent -Title 'Lunch' -StartDate (Get-Date).AddDays(2).AddHours(-3) -EndDate (Get-Date).AddDays(3) -Description 'Very long lunch' -TextColor DeepSkyBlue -BackgroundColor yellow -BorderColor Red
    }

    .NOTES
    Keep in mind that colors like background, border, text work only if there's EndDate. If there's no end date the color "color" is used only
    #>
    [alias('CalendarEvent')]
    [CmdletBinding()]
    param(
        [string] $Title,
        [string] $Description,
        [DateTime] $StartDate,
        [nullable[DateTime]] $EndDate,
        [string] $Constraint,
        [string] $Color,
        [string] $BackgroundColor,
        [string] $BorderColor,
        [string] $TextColor,
        [alias('Uri')][string] $Url,
        [switch] $AllDayEvent
    )
    $Object = [PSCustomObject] @{
        Type     = 'CalendarEvent'
        Settings = [ordered] @{
            title           = $Title
            description     = $Description
            constraint      = $Constraint
            color           = ConvertFrom-Color -Color $Color
            backgroundColor = ConvertFrom-Color -Color $BackgroundColor
            borderColor     = ConvertFrom-Color -Color $BorderColor
            textColor       = ConvertFrom-Color -Color $TextColor
            url             = $Url
        }
    }
    if ($AllDayEvent) {
        $Object.Settings.allDay = $true
    }
    if ($StartDate) {
        $Object.Settings.start = Get-Date -Date ($StartDate) -Format "yyyy-MM-ddTHH:mm:ss"
    }
    if ($EndDate) {
        $Object.Settings.end = Get-Date -Date ($EndDate) -Format "yyyy-MM-ddTHH:mm:ss"
    }

    Remove-EmptyValue -Hashtable $Object.Settings -Recursive #-Rerun 2
    $Object
}
Register-ArgumentCompleter -CommandName New-CalendarEvent -ParameterName Color -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-CalendarEvent -ParameterName BorderColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-CalendarEvent -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-CalendarEvent -ParameterName TextColor -ScriptBlock $Script:ScriptBlockColors