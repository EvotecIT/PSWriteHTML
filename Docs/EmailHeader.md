---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# EmailHeader
## SYNOPSIS
Creates email headers based on the provided ScriptBlock.

## SYNTAX
### __AllParameterSets
```powershell
EmailHeader [[-EmailHeader] <scriptblock>] [<CommonParameters>]
```

## DESCRIPTION
This function creates email headers using the specified ScriptBlock. It allows customization of email headers before sending an email.

## EXAMPLES

### EXAMPLE 1
```powershell
$EmailHeader = {
    'From: sender@example.com'
    'To: recipient@example.com'
    'Subject: Hello World'
}
$Headers = EmailHeader -EmailHeader $EmailHeader
Creates email headers with sender, recipient, and subject information.
```

## PARAMETERS

### -EmailHeader
Specifies the ScriptBlock containing the email header content.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

