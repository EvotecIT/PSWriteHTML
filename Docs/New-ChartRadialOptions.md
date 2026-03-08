---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-ChartRadialOptions
## SYNOPSIS
Creates customizable options for a radial chart.

## SYNTAX
### CircleType
```powershell
New-ChartRadialOptions [-CircleType <Object>] [-HollowBackGroundColor <string>] [-HollowMargin <string>] [-HollowSize <string>] [-TrackDropShadow <string>] [-TrackDropShadowTop <string>] [-TrackDropShadowLeft <string>] [-TrackDropShadowBlur <string>] [-TrackDropShadowOpacity <string>] [-DataLabelNameOffsetY <string>] [-DataLabelNameColor <string>] [-DataLabelNameFontSize <string>] [-DataLabelValueShow] [-DataLabelValueColor <string>] [-DataLabelValueFontSize <string>] [-FillType <string>] [-GradientShade <string>] [-GradientType <string>] [-GradientToColors <string>] [-GraidentStops <array>] [-StrokeLineCap <string>] [-Labels <string[]>] [<CommonParameters>]
```

### CustomAngle
```powershell
New-ChartRadialOptions [-StartAngle <int>] [-EndAngle <int>] [-HollowBackGroundColor <string>] [-HollowMargin <string>] [-HollowSize <string>] [-TrackDropShadow <string>] [-TrackDropShadowTop <string>] [-TrackDropShadowLeft <string>] [-TrackDropShadowBlur <string>] [-TrackDropShadowOpacity <string>] [-DataLabelNameOffsetY <string>] [-DataLabelNameColor <string>] [-DataLabelNameFontSize <string>] [-DataLabelValueShow] [-DataLabelValueColor <string>] [-DataLabelValueFontSize <string>] [-FillType <string>] [-GradientShade <string>] [-GradientType <string>] [-GradientToColors <string>] [-GraidentStops <array>] [-StrokeLineCap <string>] [-Labels <string[]>] [<CommonParameters>]
```

## DESCRIPTION
This function defines various customizable options for a radial chart, such as circle type, angles, colors, shadows, labels, gradients, and more.

## EXAMPLES

### EXAMPLE 1
```powershell
New-ChartRadialOptions -CircleType 'FullCircleTop' -StartAngle 0 -EndAngle 180 -HollowBackGroundColor 'white' -HollowMargin '10px' -HollowSize '50%' -TrackDropShadow 'black' -TrackDropShadowTop '2px' -TrackDropShadowLeft '2px' -TrackDropShadowBlur '5px' -TrackDropShadowOpacity '0.5' -DataLabelNameOffsetY '20px' -DataLabelNameColor 'black' -DataLabelNameFontSize '12px' -DataLabelValueShow -DataLabelValueColor 'red' -DataLabelValueFontSize '14px' -FillType 'solid' -GradientShade 'dark' -GradientType 'vertical' -GradientToColors @('red', 'blue') -GraidentStops @('0%', '100%') -StrokeLineCap 'round' -Labels @('Label1', 'Label2')
```

Creates customizable options for a radial chart with specified parameters.

## PARAMETERS

### -CircleType
Specifies the type of circle for the radial chart. Valid values are 'FullCircleTop', 'FullCircleBottom', 'FullCircleBottomLeft', 'FullCircleLeft', 'Speedometer', 'SemiCircleGauge'.

```yaml
Type: Object
Parameter Sets: CircleType
Aliases: 
Possible values: FullCircleTop, FullCircleBottom, FullCircleBottomLeft, FullCircleLeft, Speedometer, SemiCircleGauge

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -DataLabelNameColor
Specifies the color for the data label name in the radial chart.

```yaml
Type: String
Parameter Sets: CircleType, CustomAngle
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -DataLabelNameFontSize
Specifies the font size for the data label name in the radial chart.

```yaml
Type: String
Parameter Sets: CircleType, CustomAngle
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -DataLabelNameOffsetY
Specifies the Y-axis offset for the data label name in the radial chart.

```yaml
Type: String
Parameter Sets: CircleType, CustomAngle
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -DataLabelValueColor
Specifies the color for the data label value in the radial chart.

```yaml
Type: String
Parameter Sets: CircleType, CustomAngle
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -DataLabelValueFontSize
Specifies the font size for the data label value in the radial chart.

```yaml
Type: String
Parameter Sets: CircleType, CustomAngle
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -DataLabelValueShow
Indicates whether to show the data label value in the radial chart.

```yaml
Type: SwitchParameter
Parameter Sets: CircleType, CustomAngle
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -EndAngle
Specifies the ending angle for the radial chart.

```yaml
Type: Nullable`1
Parameter Sets: CustomAngle
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FillType
Specifies the fill type for the radial chart.

```yaml
Type: String
Parameter Sets: CircleType, CustomAngle
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -GradientShade
Specifies the shade for the gradient in the radial chart.

```yaml
Type: String
Parameter Sets: CircleType, CustomAngle
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -GradientToColors
Specifies the colors for the gradient in the radial chart.

```yaml
Type: String
Parameter Sets: CircleType, CustomAngle
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -GradientType
Specifies the type of gradient for the radial chart.

```yaml
Type: String
Parameter Sets: CircleType, CustomAngle
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -GraidentStops
Specifies the gradient stops for the radial chart.

```yaml
Type: Array
Parameter Sets: CircleType, CustomAngle
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HollowBackGroundColor
Specifies the color for the hollow background of the radial chart.

```yaml
Type: String
Parameter Sets: CircleType, CustomAngle
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HollowMargin
Specifies the margin for the hollow area of the radial chart.

```yaml
Type: String
Parameter Sets: CircleType, CustomAngle
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HollowSize
Specifies the size of the hollow area in the radial chart.

```yaml
Type: String
Parameter Sets: CircleType, CustomAngle
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Labels
Specifies an array of labels for the radial chart.

```yaml
Type: String[]
Parameter Sets: CircleType, CustomAngle
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -StartAngle
Specifies the starting angle for the radial chart.

```yaml
Type: Nullable`1
Parameter Sets: CustomAngle
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -StrokeLineCap
Specifies the line cap for the stroke in the radial chart.

```yaml
Type: String
Parameter Sets: CircleType, CustomAngle
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TrackDropShadow
Specifies the drop shadow for the track of the radial chart.

```yaml
Type: String
Parameter Sets: CircleType, CustomAngle
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TrackDropShadowBlur
Specifies the blur effect for the drop shadow of the track in the radial chart.

```yaml
Type: String
Parameter Sets: CircleType, CustomAngle
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TrackDropShadowLeft
Specifies the left shadow for the track of the radial chart.

```yaml
Type: String
Parameter Sets: CircleType, CustomAngle
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TrackDropShadowOpacity
Specifies the opacity of the drop shadow for the track in the radial chart.

```yaml
Type: String
Parameter Sets: CircleType, CustomAngle
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TrackDropShadowTop
Specifies the top shadow for the track of the radial chart.

```yaml
Type: String
Parameter Sets: CircleType, CustomAngle
Aliases: 
Possible values: 

Required: False
Position: named
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

