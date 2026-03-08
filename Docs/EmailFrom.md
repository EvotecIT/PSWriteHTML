---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# EmailFrom
## SYNOPSIS
Creates an email object for the sender address.

## SYNTAX
### __AllParameterSets
```powershell
EmailFrom [[-Address] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function creates an email object specifically for the sender address. It takes a single email address as input and returns a custom object representing the sender address.

## EXAMPLES

### EXAMPLE 1
```powershell
$Sender = EmailFrom -Address 'sender@example.com'
Creates an email object with the specified sender address.
```

## PARAMETERS

### -Address
Specifies the email address of the sender.

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

