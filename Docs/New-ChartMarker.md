---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-ChartMarker
## SYNOPSIS
Creates a new chart marker with customizable options.

## SYNTAX
### __AllParameterSets
```powershell
New-ChartMarker [[-Size] <int>] [[-Color] <string[]>] [[-StrokeColors] <string[]>] [[-StrokeWidth] <int[]>] [[-StrokeOpacity] <int[]>] [[-StrokeDashArray] <int[]>] [[-FillOpacity] <int[]>] [[-Shape] <string[]>] [[-Radius] <int[]>] [[-OffsetX] <int[]>] [[-OffsetY] <int[]>] [[-HoverSize] <int[]>] [[-HoverSizeOffset] <int[]>] [-ShowNullDataPoints] [<CommonParameters>]
```

## DESCRIPTION
This function defines the properties of a chart marker, such as size, color, shape, and other visual attributes. It allows customization of the marker appearance in the chart.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLChart -Title 'Incidents Reported vs Solved' -TitleAlignment center {
    New-ChartMarker -Size 30 -Color red -Shape square -StrokeColors yellow
}
```

## PARAMETERS

### -Color
Sets the fill color(s) of the marker point.

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

### -FillOpacity
Specifies the opacity of the marker fill color.

```yaml
Type: Int32[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HoverSize
Specifies the fixed size of the marker when it is active.

```yaml
Type: Int32[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HoverSizeOffset
Unlike the fixed size, this option takes the original marker size and increases/decreases the value based on it. For example, if markers.size is 6 and markers.hover.sizeOffset is 3, the marker's size will be 9 when hovered.

```yaml
Type: Int32[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -OffsetX
Sets the left offset of the marker.

```yaml
Type: Int32[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -OffsetY
Sets the top offset of the marker.

```yaml
Type: Int32[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Radius
Specifies the radius of the marker (applies to square shape).

```yaml
Type: Int32[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Shape
Defines the shape of the marker. Available options for shape are circle or square.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: circle, square

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ShowNullDataPoints
Determines whether to show markers for null values in a line/area chart. If disabled, any null values present in line/area charts will not be visible.

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

### -Size
Specifies the size of the marker point.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -StrokeColors
Specifies the stroke color of the marker. Accepts a single color or an array of colors in a multi-series chart.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -StrokeDashArray
Defines the dashes in the border around the marker. A higher number creates more space between dashes in the border.

```yaml
Type: Int32[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -StrokeOpacity
Specifies the opacity of the border around the marker.

```yaml
Type: Int32[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -StrokeWidth
Sets the stroke size of the marker.

```yaml
Type: Int32[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

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

