---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# EmailSubject
## SYNOPSIS
Defines the subject line for an email.

## SYNTAX
### __AllParameterSets
```powershell
EmailSubject [[-Subject] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function sets the subject line for an email message.

## EXAMPLES

### EXAMPLE 1
```powershell
EmailSubject -Subject "Important Notification"
Sets the subject line of the email to "Important Notification".
```

## PARAMETERS

### -Subject
Specifies the subject line of the email.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

