---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-TableButtonPageLength
## SYNOPSIS
Creates a new table button for setting the page length in a DataTable.

## SYNTAX
### __AllParameterSets
```powershell
New-TableButtonPageLength [[-Title] <string>] [[-ButtonName] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new table button for setting the page length in a DataTable. It allows users to customize the button title and display text.

## EXAMPLES

### EXAMPLE 1
```powershell
New-TableButtonPageLength -Title "Set Page Length" -ButtonName "Page Length"
```

Description
-----------
Creates a new table button with the title "Set Page Length" and button name "Page Length".

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

