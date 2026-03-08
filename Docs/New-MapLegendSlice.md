---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-MapLegendSlice
## SYNOPSIS
Creates a new map legend slice.

## SYNTAX
### __AllParameterSets
```powershell
New-MapLegendSlice [-Type] <Object> [[-Label] <string>] [[-FillColor] <string>] [[-HoverFillColor] <string>] [[-StrokeWidth] <int>] [[-Transform] <string>] [[-HoverTransform] <string>] [[-HoverStrokeWidth] <int>] [[-MinimumValue] <float>] [[-MaximumValue] <float>] [[-Value] <float>] [[-DisplayInLegend] <bool>] [[-InitializeClicked] <bool>] [[-Size] <int>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new map legend slice with specified parameters.

## EXAMPLES

### EXAMPLE 1
```powershell
New-MapLegendSlice -Label "Slice 1" -FillColor "Blue" -MinimumValue 0 -MaximumValue 100 -DisplayInLegend $true
```

## PARAMETERS

### -DisplayInLegend
Specifies whether to display the slice in the legend. Default is true.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FillColor
The color to fill the slice with.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: SliceColor
Possible values: 

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HoverFillColor
{{ Fill HoverFillColor Description }}

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: HoverSliceColor
Possible values: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HoverStrokeWidth
{{ Fill HoverStrokeWidth Description }}

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

### -HoverTransform
{{ Fill HoverTransform Description }}

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -InitializeClicked
Set to true to initialize the legend item in the 'clicked' state on map load. Default is false.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Label
The label of the slice for the legend.

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

### -MaximumValue
The maximum value for the interval defining the slice.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -MinimumValue
The minimum value for the interval defining the slice.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Size
{{ Fill Size Description }}

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 13
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -StrokeWidth
{{ Fill StrokeWidth Description }}

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

### -Transform
{{ Fill Transform Description }}

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

### -Type
{{ Fill Type Description }}

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

### -Value
The fixed value for the slice. Use this instead of 'MinimumValue' and 'MaximumValue' to set a specific value.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 10
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

