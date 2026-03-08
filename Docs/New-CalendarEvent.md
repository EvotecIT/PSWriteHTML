---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-CalendarEvent
## SYNOPSIS
Allows adding new calendar events to calendar

## SYNTAX
### __AllParameterSets
```powershell
New-CalendarEvent [[-Title] <string>] [[-Description] <string>] [[-StartDate] <datetime>] [[-EndDate] <datetime>] [[-Constraint] <string>] [[-Color] <string>] [[-BackgroundColor] <string>] [[-BorderColor] <string>] [[-TextColor] <string>] [[-Url] <string>] [[-TargetName] <string>] [-AllDayEvent] [<CommonParameters>]
```

## DESCRIPTION
Allows adding new calendar events to calendar

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLCalendar {
    New-CalendarEvent -Title 'Active Directory Meeting' -Description 'We will talk about stuff' -StartDate (Get-Date)
    # End date is required for the colors to work...
    New-CalendarEvent -Title 'Lunch' -StartDate (Get-Date).AddDays(2).AddHours(-3) -EndDate (Get-Date).AddDays(3) -Description 'Very long lunch' -TextColor DeepSkyBlue -BackgroundColor yellow -BorderColor Red
}
```

## PARAMETERS

### -AllDayEvent
Determines if the event is shown in the “all-day” section of the view, if applicable. Determines if time text is displayed in the event. If this value is not specified, it will be inferred by the start and end properties

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

### -BackgroundColor
Sets backround color. Only works if EndDate is provided.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderColor
Sets border color. Only works if EndDate is provided.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Color
An alias for specifying the backgroundColor and borderColor at the same time.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Constraint
A groupId belonging to other events, "businessHours" or "availableForMeeting"

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Description
The text that will appear on an event when hovering over

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -EndDate
hen your event ends. If your event is explicitly allDay, hour, minutes, seconds and milliseconds will be ignored. If omitted, your events will appear to have the default duration.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -StartDate
When your event begins. If your event is explicitly allDay, hour, minutes, seconds and milliseconds will be ignored.

```yaml
Type: DateTime
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TargetName
Specifies the name of the target frame or window. Default is _self

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextColor
Sets color of Text. Only works if EndDate is provided.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Title
The text that will appear on an event.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Url
A URL that will be visited when this event is clicked by the user.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: Uri
Possible values: 

Required: False
Position: 9
Default value: None
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

