---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# EmailBCC
## SYNOPSIS
Creates an email object for blind carbon copy (BCC) recipients.

## SYNTAX
### __AllParameterSets
```powershell
EmailBCC [[-Addresses] <string[]>] [<CommonParameters>]
```

## DESCRIPTION
This function creates an email object specifically for blind carbon copy (BCC) recipients. It takes an array of email addresses and returns a custom object representing the BCC recipients.

## EXAMPLES

### EXAMPLE 1
```powershell
$BCCRecipients = EmailBCC -Addresses 'bcc1@example.com', 'bcc2@example.com'
Creates an email object with two BCC recipients.
```

### EXAMPLE 2
```powershell
$BCCList = 'bcc1@example.com', 'bcc2@example.com'
$BCCRecipients = EmailBCC -Addresses $BCCList
Creates an email object with multiple BCC recipients.
```

## PARAMETERS

### -Addresses
Specifies an array of email addresses for the BCC recipients.

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

