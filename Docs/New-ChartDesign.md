---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-ChartDesign
## SYNOPSIS
Configures charts gradient, image, pattern and dropShadow options

## SYNTAX
### __AllParameterSets
```powershell
New-ChartDesign [[-GradientShade] <string>] [[-GradientType] <string>] [[-GradientShadeIntensity] <float>] [[-GradientGradientToColors] <string[]>] [[-GradientOpacityFrom] <float[]>] [[-GradientOpacityTo] <float[]>] [[-GradientStops] <Object>] [[-ImageSource] <string[]>] [[-ImageWidth] <string[]>] [[-ImageHeight] <string[]>] [[-PatternStyle] <string>] [[-PatternWidth] <string>] [[-PatternHeight] <string>] [[-PatternStrokeWidth] <string>] [[-DropShadowEnabledOnSries] <array>] [[-DropShadowTop] <int>] [[-DropShadowColor] <string[]>] [[-DropShadowLeft] <int>] [[-DropShadowBlur] <int>] [[-DropShadowOpacity] <float>] [-GradientInverseColors] [-DropShadowEnabled] [<CommonParameters>]
```

## DESCRIPTION
Long description

## EXAMPLES

### EXAMPLE 1
```powershell
An example
```

## PARAMETERS

### -DropShadowBlur
Set blur distance for shadow

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 18
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -DropShadowColor
Give a color to the shadow. If array is provided, each series can have different shadow color

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 16
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -DropShadowEnabled
Enable a dropshadow for paths of the SVG

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

### -DropShadowEnabledOnSries
Provide series index on which the dropshadow should be enabled.

```yaml
Type: Array
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -DropShadowLeft
Set left offset for shadow

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 17
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -DropShadowOpacity
Set the opacity of shadow

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 19
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -DropShadowTop
Set top offset for shadow

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 15
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -GradientGradientToColors
Optional colors that ends the gradient to.
The main colors array becomes the gradientFromColors and this array becomes the end colors of the gradient.
Each index in the array corresponds to the series-index.

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

### -GradientInverseColors
Inverse the start and end colors of the gradient.

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

### -GradientOpacityFrom
Start color's opacity. If you want different opacity for different series, you can pass an array of numbers.

```yaml
Type: Single[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -GradientOpacityTo
End color's opacity. If you want different opacity for different series, you can pass an array of numbers.

```yaml
Type: Single[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -GradientShade
Available options for gradient shade

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: light, dark

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -GradientShadeIntensity
Intensity of the gradient shade

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

### -GradientStops
Stops defines the ramp of colors to use on a gradient

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -GradientType
Available options for gradient type

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: horizontal, vertical, diagonal1, diagonal2

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ImageHeight
Height of each image for all the series

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ImageSource
Accepts an array of image paths which will correspond to each series.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ImageWidth
Width of each image for all the series

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -PatternHeight
Pattern height which will be repeated at this interval

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -PatternStrokeWidth
Pattern lines width indicates the thickness of the stroke of pattern.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 13
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -PatternStyle
Available pattern styles

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: verticalLines, horizontalLines, slantedLines, squares, circles

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -PatternWidth
Pattern width which will be repeated at this interval

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 11
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

