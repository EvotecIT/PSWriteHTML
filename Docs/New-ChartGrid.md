---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-ChartGrid
## SYNOPSIS
Creates a new chart grid with customizable options.

## SYNTAX
### __AllParameterSets
```powershell
New-ChartGrid [[-BorderColor] <string>] [[-StrokeDash] <int>] [[-Position] <string>] [[-RowColors] <string[]>] [[-RowOpacity] <double>] [[-ColumnColors] <string[]>] [[-ColumnOpacity] <double>] [[-PaddingTop] <int>] [[-PaddingRight] <int>] [[-PaddingBottom] <int>] [[-PaddingLeft] <int>] [-Show] [-xAxisLinesShow] [-yAxisLinesShow] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new chart grid with the provided parameters. It allows customization of the grid visibility, colors, opacity, padding, and other styling options.

## EXAMPLES

### EXAMPLE 1
```powershell
New-ChartGrid -Show -BorderColor 'black' -StrokeDash 2 -Position 'front' -xAxisLinesShow -yAxisLinesShow -RowColors @('red', 'blue') -RowOpacity 0.7 -ColumnColors @('green', 'yellow') -ColumnOpacity 0.8 -PaddingTop 10 -PaddingRight 5 -PaddingBottom 15 -PaddingLeft 5
```

Creates a new chart grid with specified options including visible grid, black border color, dashed border style, front position, visible x-axis and y-axis lines, red and blue row colors with 0.7 opacity, green and yellow column colors with 0.8 opacity, and padding values.

### EXAMPLE 2
```powershell
New-ChartGrid -Show -BorderColor 'gray' -RowColors @('orange', 'purple') -ColumnColors @('pink', 'cyan') -PaddingTop 5 -PaddingRight 5 -PaddingBottom 5 -PaddingLeft 5
```

Creates a new chart grid with visible grid, gray border color, orange and purple row colors, pink and cyan column colors, and equal padding values.

## PARAMETERS

### -BorderColor
The color of the grid border.

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

### -ColumnColors
An array of colors for the columns in the grid.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ColumnOpacity
The opacity of the column colors. Valid range is 0 to 1. Default is 0.5.

```yaml
Type: Double
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 6
Default value: 0.5
Accept pipeline input: False
Accept wildcard characters: True
```

### -PaddingBottom
The bottom padding of the grid.

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

### -PaddingLeft
The left padding of the grid.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 10
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -PaddingRight
The right padding of the grid.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 8
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -PaddingTop
The top padding of the grid.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 7
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -Position
The position of the grid. Accepted values are 'front', 'back', 'default'. Default is 'default'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: front, back, default

Required: False
Position: 2
Default value: default
Accept pipeline input: False
Accept wildcard characters: True
```

### -RowColors
An array of colors for the rows in the grid.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -RowOpacity
The opacity of the row colors. Valid range is 0 to 1. Default is 0.5.

```yaml
Type: Double
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 4
Default value: 0.5
Accept pipeline input: False
Accept wildcard characters: True
```

### -Show
Indicates whether the grid is visible.

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -StrokeDash
The style of the grid border. Default is 0.

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

### -xAxisLinesShow
Indicates whether the x-axis lines are visible.

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -yAxisLinesShow
Indicates whether the y-axis lines are visible.

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
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

