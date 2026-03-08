---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-MapLegendOption
## SYNOPSIS
Creates a new map legend option with specified parameters.

## SYNTAX
### __AllParameterSets
```powershell
New-MapLegendOption [-Type] <Object> [[-Title] <string>] [[-RedrawOnResize] <bool>] [[-Mode] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new map legend option with the provided parameters. It allows customization of the legend title, redraw behavior on resize, and display mode.

## EXAMPLES

### EXAMPLE 1
```powershell
New-MapLegendOption -Type "area" -Title "Area Legend" -RedrawOnResize $true -Mode "horizontal"
Creates a new map legend option for an area with the title "Area Legend", redraws on resize, and displays horizontally.
```

### EXAMPLE 2
```powershell
New-MapLegendOption -Type "plot" -Title "Plot Legend" -Mode "vertical"
Creates a new map legend option for a plot with the title "Plot Legend" and displays vertically.
```

## PARAMETERS

### -Mode
Specifies the display mode of the legend option. Valid values are 'horizontal' and 'vertical'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: horizontal, vertical

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -RedrawOnResize
Specifies whether the legend should redraw on resize. Default is $null.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Title
Specifies the title of the legend option.

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

### -Type
Specifies the type of the legend option. Valid values are 'area' and 'plot'.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: area, plot

Required: True
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

