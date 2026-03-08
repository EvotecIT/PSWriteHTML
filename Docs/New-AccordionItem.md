---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-AccordionItem
## SYNOPSIS
Creates a new accordion item with specified header text and panel text.

## SYNTAX
### __AllParameterSets
```powershell
New-AccordionItem [[-HeaderText] <string>] [[-HeaderAlign] <string>] [[-PanelText] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new accordion item with the provided header text and panel text. The header text is displayed as a clickable button to toggle the visibility of the panel text.

## EXAMPLES

### EXAMPLE 1
```powershell
New-AccordionItem -HeaderText "Header 1" -HeaderAlign "left" -PanelText "Panel 1 Text"
```

Creates a new accordion item with the header text "Header 1" aligned to the left and panel text "Panel 1 Text".

### EXAMPLE 2
```powershell
New-AccordionItem -HeaderText "Header 2" -HeaderAlign "center" -PanelText "Panel 2 Text"
```

Creates a new accordion item with the header text "Header 2" aligned to the center and panel text "Panel 2 Text".

## PARAMETERS

### -HeaderAlign
The alignment of the header text. Accepted values are 'left', 'center', or 'right'.

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

### -HeaderText
The text to be displayed as the header of the accordion item.

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

### -PanelText
The text to be displayed in the panel of the accordion item.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
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

