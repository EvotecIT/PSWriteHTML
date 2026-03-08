---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-ChartLegend
## SYNOPSIS
Creates a new chart legend with customizable options.

## SYNTAX
### __AllParameterSets
```powershell
New-ChartLegend [[-Names] <array>] [[-Color] <string[]>] [[-LegendPosition] <string>] [[-HorizontalAlign] <string>] [[-OffsetX] <int>] [[-OffsetY] <int>] [[-ItemMarginHorizontal] <int>] [[-ItemMarginVertical] <int>] [[-FontSize] <Object>] [[-FontFamily] <string>] [[-FontWeight] <string>] [-HideLegend] [-Floating] [-InverseOrder] [-DisableOnItemClickToggleDataSeries] [-DisableOnItemHoverHighlightDataSeries] [-UseSeriesColors] [<CommonParameters>]
```

## DESCRIPTION
The New-ChartLegend function creates a new chart legend with various customization options such as position, alignment, font settings, and more.

## EXAMPLES

### EXAMPLE 1
```powershell
New-ChartLegend -Names @('A', 'B', 'C') -Color @('red', 'blue', 'green') -LegendPosition 'top' -HorizontalAlign 'center' -FontSize 12
```

Creates a new chart legend with three items ('A', 'B', 'C') in red, blue, and green colors positioned at the top with center alignment and font size of 12.

## PARAMETERS

### -Color
Specifies an array of colors for the legend items.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -DisableOnItemClickToggleDataSeries
Indicates whether to disable toggling data series on legend item click.

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

### -DisableOnItemHoverHighlightDataSeries
Indicates whether to disable highlighting data series on legend item hover.

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

### -Floating
Indicates whether the legend should float.

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

### -FontFamily
Specifies the font family of the legend labels.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontSize
Specifies the font size of the legend labels.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontWeight
Specifies the font weight of the legend labels.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, bold, bolder, lighter, 100, 200, 300, 400, 500, 600, 700, 800, 900

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HideLegend
Indicates whether to hide the legend.

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

### -HorizontalAlign
Specifies the horizontal alignment of the legend labels (left, center, right).

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: left, center, right

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -InverseOrder
Indicates whether to display legend items in reverse order.

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

### -ItemMarginHorizontal
Specifies the horizontal margin between legend items.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ItemMarginVertical
Specifies the vertical margin between legend items.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -LegendPosition
Specifies the position of the legend (top, left, right, bottom).

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: top, left, right, bottom

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Names
Specifies an array of names for the legend items.

```yaml
Type: Array
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -OffsetX
Specifies the horizontal offset of the legend.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -OffsetY
Specifies the vertical offset of the legend.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -UseSeriesColors
Indicates whether to use series colors for legend items.

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

