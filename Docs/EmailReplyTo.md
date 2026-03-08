---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# EmailReplyTo
## SYNOPSIS
Defines the email address to which replies should be directed.

## SYNTAX
### __AllParameterSets
```powershell
EmailReplyTo [[-Address] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function sets the email address to which replies should be directed when receiving notifications.

## EXAMPLES

### EXAMPLE 1
```powershell
EmailReplyTo -Address "reply@example.com"
Sets the email address to which replies should be directed to "reply@example.com".
```

## PARAMETERS

### -Address
Specifies the email address to which replies should be directed.

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

