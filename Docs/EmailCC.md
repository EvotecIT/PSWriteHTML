---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# EmailCC
## SYNOPSIS
Creates an email object for carbon copy (CC) recipients.

## SYNTAX
### __AllParameterSets
```powershell
EmailCC [[-Addresses] <string[]>] [<CommonParameters>]
```

## DESCRIPTION
This function creates an email object specifically for carbon copy (CC) recipients. It takes an array of email addresses and returns a custom object representing the CC recipients.

## EXAMPLES

### EXAMPLE 1
```powershell
$CCRecipients = EmailCC -Addresses 'cc1@example.com', 'cc2@example.com'
Creates an email object with two CC recipients.
```

### EXAMPLE 2
```powershell
$CCList = 'cc1@example.com', 'cc2@example.com'
$CCRecipients = EmailCC -Addresses $CCList
Creates an email object with multiple CC recipients.
```

## PARAMETERS

### -Addresses
Specifies an array of email addresses for the CC recipients.

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

