---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# EmailAttachment
## SYNOPSIS
Creates an email attachment object for header attachments.

## SYNTAX
### __AllParameterSets
```powershell
EmailAttachment [[-FilePath] <string[]>] [<CommonParameters>]
```

## DESCRIPTION
This function creates an email attachment object specifically for header attachments. It takes an array of file paths and returns a custom object representing the attachment.

## EXAMPLES

### EXAMPLE 1
```powershell
$Attachment = EmailAttachment -FilePath 'C:\Files\attachment1.txt', 'C:\Files\attachment2.pdf'
Creates an email attachment object with two file paths for header attachments.
```

### EXAMPLE 2
```powershell
$Files = 'C:\Files\attachment1.txt', 'C:\Files\attachment2.pdf'
$Attachment = EmailAttachment -FilePath $Files
Creates an email attachment object with multiple file paths for header attachments.
```

## PARAMETERS

### -FilePath
Specifies an array of file paths for the attachments.

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

