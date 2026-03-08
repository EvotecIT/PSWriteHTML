---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLCalendar
## SYNOPSIS
Creates a new HTML calendar using FullCalendar library.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLCalendar [[-CalendarSettings] <scriptblock>] [[-HeaderLeft] <string[]>] [[-HeaderCenter] <string[]>] [[-HeaderRight] <string[]>] [[-DefaultDate] <datetime>] [[-NavigationLinks] <bool>] [[-NowIndicator] <bool>] [[-EventLimit] <bool>] [[-WeekNumbers] <bool>] [[-Selectable] <bool>] [[-SelectMirror] <bool>] [[-InitialView] <string>] [[-UrlTarget] <string>] [[-EventTimeFormat] <IDictionary>] [[-SlotLabelFormat] <IDictionary>] [-BusinessHours] [-Editable] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new HTML calendar using the FullCalendar library. It allows customization of various calendar settings such as header elements, initial view, default date, event handling, and more.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLCalendar -CalendarSettings {
    # Define calendar settings here
}
```

Creates a new HTML calendar with default settings.

### EXAMPLE 2
```powershell
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
```

Creates a new HTML calendar with custom settings.

## PARAMETERS

### -BusinessHours
Indicates whether business hours are displayed on the calendar.

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -CalendarSettings
Specifies the script block containing settings for the calendar.

```yaml
Type: ScriptBlock
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -DefaultDate
Specifies the default date to display on the calendar.

```yaml
Type: DateTime
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 4
Default value: (Get-Date)
Accept pipeline input: False
Accept wildcard characters: True
```

### -Editable
Indicates whether events are editable on the calendar.

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -EventLimit
Indicates whether to limit the number of events displayed on a day.

```yaml
Type: Boolean
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 7
Default value: True
Accept pipeline input: False
Accept wildcard characters: True
```

### -EventTimeFormat
Specifies the format for displaying event times.

```yaml
Type: IDictionary
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 13
Default value: [ordered] @{
            hour           = '2-digit'
            minute         = '2-digit'
            #second   = '2-digit'
            omitZeroMinute = $false
            meridiem       = $false
            hour12         = $false
        }
Accept pipeline input: False
Accept wildcard characters: True
```

### -HeaderCenter
Specifies the element to display in the center of the calendar header.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: prev, next, today, prevYear, nextYear, dayGridDay, dayGridWeek, dayGridMonth, timeGridWeek, timeGridDay, listDay, listWeek, listMonth, title, listYear

Required: False
Position: 2
Default value: title
Accept pipeline input: False
Accept wildcard characters: True
```

### -HeaderLeft
Specifies the elements to display on the left side of the calendar header.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: prev, next, today, prevYear, nextYear, dayGridDay, dayGridWeek, dayGridMonth, timeGridWeek, timeGridDay, listDay, listWeek, listMonth, title, listYear

Required: False
Position: 1
Default value: @('prev', 'next', 'today')
Accept pipeline input: False
Accept wildcard characters: True
```

### -HeaderRight
Specifies the elements to display on the right side of the calendar header.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: prev, next, today, prevYear, nextYear, dayGridDay, dayGridWeek, dayGridMonth, timeGridWeek, timeGridDay, listDay, listWeek, listMonth, title, listYear

Required: False
Position: 3
Default value: @('dayGridMonth', 'timeGridWeek', 'timeGridDay', 'listMonth')
Accept pipeline input: False
Accept wildcard characters: True
```

### -InitialView
Specifies the initial view of the calendar.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: dayGridDay, dayGridWeek, dayGridMonth, timeGridDay, timeGridWeek, listDay, listWeek, listMonth, listYear

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -NavigationLinks
Indicates whether navigation links are enabled on the calendar.

```yaml
Type: Boolean
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: True
Accept pipeline input: False
Accept wildcard characters: True
```

### -NowIndicator
Indicates whether the current time indicator is displayed on the calendar.

```yaml
Type: Boolean
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 6
Default value: True
Accept pipeline input: False
Accept wildcard characters: True
```

### -Selectable
Indicates whether events can be selected on the calendar.

```yaml
Type: Boolean
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 9
Default value: True
Accept pipeline input: False
Accept wildcard characters: True
```

### -SelectMirror
Indicates whether a mirror effect is applied when selecting events.

```yaml
Type: Boolean
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 10
Default value: True
Accept pipeline input: False
Accept wildcard characters: True
```

### -SlotLabelFormat
Specifies the format for displaying slot labels.

```yaml
Type: IDictionary
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 14
Default value: [ordered] @{
            hour           = '2-digit'
            minute         = '2-digit'
            #second   = '2-digit'
            omitZeroMinute = $false
            meridiem       = $false
            hour12         = $false
        }
Accept pipeline input: False
Accept wildcard characters: True
```

### -UrlTarget
Specifies the target URL for calendar events.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -WeekNumbers
Indicates whether week numbers are displayed on the calendar.

```yaml
Type: Boolean
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 8
Default value: True
Accept pipeline input: False
Accept wildcard characters: True
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

