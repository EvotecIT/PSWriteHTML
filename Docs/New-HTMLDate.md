---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLDate
## SYNOPSIS
Outputs a date with a data attribute for live "time ago" calculation or custom display via Moment.js.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLDate [-InputDate] <datetime> [[-Format] <string>] [[-CustomMomentFormat] <string>] [-DoNotIncludeFromNow] [<CommonParameters>]
```

## DESCRIPTION
Generates a <span> element containing the provided date.
- CanonicalFormat is always 'yyyy-MM-dd HH:mm:ss' (used for consistent parsing).
- Data attribute "data-format" uses one of the predefined or custom Moment.js formats.
- Visible text uses standard .NET formatting. (Or can be changed if desired.)

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLDate -CustomMomentFormat 'Value'
```

## PARAMETERS

### -CustomMomentFormat
Only used if -Format is set to 'Custom', e.g. 'dddd, MMMM Do YYYY, h:mm:ss A'

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
Default value: YYYY-MM-DD HH:mm:ss
Accept pipeline input: False
Accept wildcard characters: True
```

### -DoNotIncludeFromNow
Decide whether to display "X minutes/hours/days ago" next to the date.

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

### -Format
Choose one of the predefined format sets or use 'Custom'

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: US, EU, 24, 12, Custom

Required: False
Position: 1
Default value: 24
Accept pipeline input: False
Accept wildcard characters: True
```

### -InputDate
{{ Fill InputDate Description }}

```yaml
Type: DateTime
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: True
Position: 0
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

