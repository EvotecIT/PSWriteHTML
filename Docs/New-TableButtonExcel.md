---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-TableButtonExcel
## SYNOPSIS
Creates a new table button for exporting data to Excel with customizable options.

## SYNTAX
### __AllParameterSets
```powershell
New-TableButtonExcel [[-Title] <string>] [[-ButtonName] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new table button for exporting data to Excel with customizable options. It allows users to specify the button title and display text.

## EXAMPLES

### EXAMPLE 1
```powershell
New-TableButtonExcel -Title "Export to Excel" -ButtonName "Export"
```

Description
-----------
Creates a new table button with the title "Export to Excel" and button name "Export".

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

