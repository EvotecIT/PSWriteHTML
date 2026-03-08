---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLGage
## SYNOPSIS
Creates a new HTML gauge with customizable options.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLGage [[-GageContent] <scriptblock>] [[-Type] <string>] [[-BackgroundGaugageColor] <string>] [-Value] <decimal> [[-ValueSymbol] <string>] [[-ValueColor] <string>] [[-ValueFont] <string>] [[-MinValue] <int>] [[-MinText] <string>] [[-MaxValue] <int>] [[-MaxText] <string>] [[-DecimalNumbers] <int>] [[-GaugageWidth] <decimal>] [[-Label] <string>] [[-LabelColor] <string>] [[-ShadowOpacity] <decimal>] [[-ShadowSize] <int>] [[-ShadowVerticalOffset] <int>] [[-PointerTopLength] <int>] [[-PointerBottomLength] <int>] [[-PointerBottomWidth] <int>] [[-StrokeColor] <string>] [[-PointerStrokeWidth] <int>] [[-PointerStrokeLinecap] <Object>] [[-PointerColor] <string>] [[-HumanFriendlyDecimal] <int>] [[-SectorColors] <string[]>] [[-Width] <int>] [[-Height] <int>] [[-LevelColors] <string[]>] [[-StartAnimationTime] <int>] [[-StartAnimationType] <string>] [[-RefreshAnimationTime] <int>] [[-RefreshAnimationType] <string>] [[-DonutStartAngle] <int>] [[-ValueMinFontSize] <int>] [[-LabelMinFontSize] <int>] [[-MinLabelMinFontSize] <int>] [[-MaxLabelMinFontSize] <int>] [[-TargetLine] <decimal>] [[-TargetLineColor] <string>] [[-TargetLineWidth] <decimal>] [-Reverse] [-Counter] [-ShowInnerShadow] [-NoGradient] [-Pointer] [-HideValue] [-HideMinMax] [-FormatNumber] [-DisplayRemaining] [-HumanFriendly] [-UseAbsoluteValues] [-Differential] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new HTML gauge with various customizable options such as type, colors, fonts, values, and more.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLGage -Value 75 -Label "Progress" -Type "Donut" -MinValue 0 -MaxValue 100 -SectorColors @("red", "yellow", "green")
```

Creates a new donut gauge with a value of 75, labeled as "Progress", with a range from 0 to 100, and sector colors red, yellow, and green.

### EXAMPLE 2
```powershell
New-HTMLGage -Value 65 -Label "Performance" -MinValue 0 -MaxValue 100 -TargetLine 80 -TargetLineColor "red" -TargetLineWidth 3
```

Creates a gauge with a target line at 80 to show the goal.

## PARAMETERS

### -BackgroundGaugageColor
The background color of the gauge.

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

### -Counter
Indicates whether a counter should be displayed.

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

### -DecimalNumbers
The number of decimal places to display.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 11
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -Differential
Indicates whether the gauge should fill from center rather than from min value.

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

### -DisplayRemaining
Indicates whether the remaining value should be displayed.

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

### -DonutStartAngle
Angle to start from when in donut mode (default: 90).

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 34
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FormatNumber
Indicates whether the number should be formatted.

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

### -GageContent
The content of the gauge.

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

### -GaugageWidth
The width of the gauge.

```yaml
Type: Decimal
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 12
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -Height
The gauge height in pixels.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 28
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HideMinMax
Indicates whether the min/max values should be hidden.

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

### -HideValue
Indicates whether the value should be hidden.

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

### -HumanFriendly
Indicates whether the value should be displayed in a human-friendly format.

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

### -HumanFriendlyDecimal
The number of decimal places to display in human-friendly format.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 25
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -Label
The label to display on the gauge.

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

### -LabelColor
The color of the label.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -LabelMinFontSize
Absolute minimum font size for the label (default: 10).

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 36
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -LevelColors
An array of colors for default gradient sectors (e.g., @("green", "yellow", "red")).

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 29
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -MaxLabelMinFontSize
Absolute minimum font size for the max label (default: 10).

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 38
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -MaxText
The text to display for the maximum value.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -MaxValue
The maximum value of the gauge.

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

### -MinLabelMinFontSize
Absolute minimum font size for the min label (default: 10).

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 37
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -MinText
The text to display for the minimum value.

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

### -MinValue
The minimum value of the gauge.

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

### -NoGradient
Indicates whether gradient should be disabled.

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

### -Pointer
Indicates whether a pointer should be displayed.

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

### -PointerBottomLength
The length of the bottom of the pointer.

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

### -PointerBottomWidth
The width of the bottom of the pointer.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 20
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -PointerColor
The color of the pointer.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 24
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -PointerStrokeLinecap
The linecap style of the pointer stroke. Valid values are 'none', 'square', 'round'.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: none, square, round

Required: False
Position: 23
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -PointerStrokeWidth
The width of the pointer stroke.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 22
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -PointerTopLength
The length of the top of the pointer.

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

### -RefreshAnimationTime
Length of refresh animation in milliseconds (default: 700).

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 32
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -RefreshAnimationType
Type of refresh animation. Valid values are 'linear', '>', '<', '<>', 'bounce'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: linear, >, <, <>, bounce

Required: False
Position: 33
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Reverse
Indicates whether the gauge should be displayed in reverse.

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

### -SectorColors
An array of colors to use for different sectors of the gauge.    .PARAMETER UseAbsoluteValues
Indicates whether to use absolute values for custom sectors.
By default, it uses percentage values.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 26
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ShadowOpacity
The opacity of the shadow.

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

### -ShadowSize
The size of the shadow.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 16
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ShadowVerticalOffset
The vertical offset of the shadow.

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

### -ShowInnerShadow
Indicates whether an inner shadow should be displayed.

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

### -StartAnimationTime
Length of initial animation in milliseconds (default: 700).

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 30
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -StartAnimationType
Type of initial animation. Valid values are 'linear', '>', '<', '<>', 'bounce'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: linear, >, <, <>, bounce

Required: False
Position: 31
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -StrokeColor
The color of the stroke.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 21
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TargetLine
Value where target line will be displayed.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 39
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TargetLineColor
Color of the target line (default: "#000000").

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 40
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TargetLineWidth
Width of the target line (default: 1.5).

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 41
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Type
Specifies the type of gauge to create. Valid values are 'Gage' and 'Donut'. Default is 'Gage'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: Gage, Donut

Required: False
Position: 1
Default value: Gage
Accept pipeline input: False
Accept wildcard characters: True
```

### -UseAbsoluteValues
{{ Fill UseAbsoluteValues Description }}

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

### -Value
The value to display on the gauge. This parameter is mandatory.

```yaml
Type: Decimal
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: True
Position: 3
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -ValueColor
The color of the value displayed on the gauge.

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

### -ValueFont
The font of the value displayed on the gauge.

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

### -ValueMinFontSize
Absolute minimum font size for the value label (default: 16).

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 35
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ValueSymbol
The symbol to display with the value.

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

### -Width
The gauge width in pixels.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 27
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

