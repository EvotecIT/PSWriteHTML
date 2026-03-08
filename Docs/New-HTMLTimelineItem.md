---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLTimelineItem
## SYNOPSIS
Creates a new HTML timeline item with specified date, heading text, content text, and color.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLTimelineItem [[-Date] <datetime>] [[-HeadingText] <string>] [[-Text] <string>] [[-Color] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function generates an HTML timeline item with the provided information. It allows customization of the date, heading text, content text, and color of the timeline item.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLTimelineItem -Date "2022-01-01" -HeadingText "Project Kickoff" -Text "Started the project development phase." -Color "Blue"
Creates a timeline item with a specific date, heading, content, and color.
```

### EXAMPLE 2
```powershell
New-HTMLTimelineItem -HeadingText "Meeting with Client" -Text "Discussed project requirements." -Color "Green"
Creates a timeline item with the current date, specified heading, content, and color.
```

## PARAMETERS

### -Color
Specifies the color of the timeline item. If not provided, the default color is used.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Date
Specifies the date for the timeline item. Defaults to the current date if not specified.

```yaml
Type: DateTime
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 0
Default value: (Get-Date)
Accept pipeline input: False
Accept wildcard characters: True
```

### -HeadingText
Specifies the heading text for the timeline item.

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

### -Text
Specifies the content text for the timeline item.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
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

