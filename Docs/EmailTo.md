---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# EmailTo
## SYNOPSIS
Defines the email addresses to which the email should be sent.

## SYNTAX
### __AllParameterSets
```powershell
EmailTo [[-Addresses] <string[]>] [<CommonParameters>]
```

## DESCRIPTION
This function sets the email addresses to which the email should be sent.

## EXAMPLES

### EXAMPLE 1
```powershell
EmailTo -Addresses "user1@example.com", "user2@example.com"
Sets the email addresses to which the email should be sent to "user1@example.com" and "user2@example.com".
```

## PARAMETERS

### -Addresses
Specifies an array of email addresses to which the email should be sent.

```yaml
Type: String[]
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

