---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-TablePercentageBar
## SYNOPSIS
Creates a new table percentage bar object with specified attributes.

## SYNTAX
### __AllParameterSets
```powershell
New-TablePercentageBar [[-ConditionalFormatting] <scriptblock>] [[-ColumnID] <int>] [[-ColumnName] <string>] [[-Type] <string>] [[-TextColor] <string>] [[-BorderColor] <string>] [[-BorderStyle] <string>] [[-BarColor] <string>] [[-BackgroundColor] <string>] [[-RoundValue] <int>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new table percentage bar object with the provided attributes. It allows customization of the appearance of the percentage bar within a table.

## EXAMPLES

### EXAMPLE 1
```powershell
New-TablePercentageBar -ColumnID 1 -ColumnName "Progress" -Type 'round' -TextColor "#ffffff" -BorderColor "#000000" -BorderStyle 'solid' -BarColor "#00ff00" -BackgroundColor "#ffffff" -RoundValue 2
```

Description:
Creates a new table percentage bar object for the column "Progress" with specified attributes.

## PARAMETERS

### -BackgroundColor
Specifies the background color of the percentage bar.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BarColor
Specifies the color of the percentage bar itself.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderColor
Specifies the color of the border of the percentage bar.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderStyle
Specifies the style of the border of the percentage bar. Valid values are 'solid', 'outset', 'groove', or 'ridge'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: solid, outset, groove, ridge

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ColumnID
Specifies the ID of the column where the percentage bar will be displayed.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -ColumnName
Specifies the name of the column where the percentage bar will be displayed.

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

### -ConditionalFormatting
Specifies any conditional formatting rules for the percentage bar.

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

### -RoundValue
Specifies the decimal places to round the percentage value to.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 9
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextColor
Specifies the color of the text within the percentage bar.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Type
Specifies the shape of the percentage bar. Valid values are 'square' or 'round'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: square, round

Required: False
Position: 3
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

