---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# EmailLayout
## SYNOPSIS
Defines the layout structure for an email content.

## SYNTAX
### __AllParameterSets
```powershell
EmailLayout [[-Layout] <scriptblock>] [<CommonParameters>]
```

## DESCRIPTION
This function defines the layout structure for an email content using a ScriptBlock. It generates an HTML table layout for the email content.

## EXAMPLES

### EXAMPLE 1
```powershell
$EmailLayout = {
    'Content goes here'
}
EmailLayout -Layout $EmailLayout
Generates an HTML table layout for the email content with the specified content.
```

## PARAMETERS

### -Layout
Specifies the ScriptBlock containing the layout structure for the email content.

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

