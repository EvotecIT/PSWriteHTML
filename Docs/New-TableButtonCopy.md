---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-TableButtonCopy
## SYNOPSIS
Creates a new table button for copying data with customizable options.

## SYNTAX
### __AllParameterSets
```powershell
New-TableButtonCopy [[-Title] <string>] [[-ButtonName] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new table button for copying data with customizable options. It allows users to specify the button title and display text.

## EXAMPLES

### EXAMPLE 1
```powershell
New-TableButtonCopy -Title "Copy Data" -ButtonName "Copy"
```

Description
-----------
Creates a new table button with the title "Copy Data" and button name "Copy".

## PARAMETERS

### -ButtonName
The text to be displayed on the button.

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

### -Title
The title to be displayed when hovering over the button.

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

