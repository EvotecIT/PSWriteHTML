---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-DiagramLink
## SYNOPSIS
Creates a new diagram link between two nodes.

## SYNTAX
### __AllParameterSets
```powershell
New-DiagramLink [[-From] <string[]>] [[-To] <string[]>] [[-Label] <string>] [[-ArrowsToScaleFacto] <int>] [[-ArrowsToType] <string>] [[-ArrowsMiddleScaleFactor] <int>] [[-ArrowsMiddleType] <string>] [[-ArrowsFromScaleFactor] <int>] [[-ArrowsFromType] <string>] [[-Color] <string>] [[-ColorHighlight] <string>] [[-ColorHover] <string>] [[-ColorInherit] <string>] [[-ColorOpacity] <double>] [[-Length] <string>] [[-FontColor] <string>] [[-FontSize] <Object>] [[-FontName] <string>] [[-FontBackground] <string>] [[-FontStrokeWidth] <Object>] [[-FontStrokeColor] <string>] [[-FontAlign] <string>] [[-FontMulti] <string>] [[-FontVAdjust] <int>] [[-WidthConstraint] <int>] [[-SmoothType] <string>] [[-SmoothForceDirection] <string>] [[-SmoothRoundness] <string>] [-ArrowsToEnabled] [-ArrowsMiddleEnabled] [-ArrowsFromEnabled] [-ArrowStrikethrough] [-Chosen] [-Dashes] [<CommonParameters>]
```

## DESCRIPTION
Creates a new diagram link connecting two nodes in a visual representation.

## EXAMPLES

### EXAMPLE 1
```powershell
An example of creating a new diagram link.
```

## PARAMETERS

### -ArrowsFromEnabled
Switch parameter to enable arrows at the start of the link.

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

### -ArrowsFromScaleFactor
Specifies the scale factor for the arrows at the start of the link.

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

### -ArrowsFromType
Specifies the type of arrows at the start of the link. Valid values are 'arrow', 'bar', or 'circle'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: arrow, bar, circle

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ArrowsMiddleEnabled
Switch parameter to enable arrows in the middle of the link.

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

### -ArrowsMiddleScaleFactor
Specifies the scale factor for the arrows in the middle of the link.

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

### -ArrowsMiddleType
Specifies the type of arrows in the middle of the link. Valid values are 'arrow', 'bar', or 'circle'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: arrow, bar, circle

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ArrowsToEnabled
Switch parameter to enable arrows at the end of the link.

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

### -ArrowsToScaleFacto
{{ Fill ArrowsToScaleFacto Description }}

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ArrowsToType
Specifies the type of arrows at the end of the link. Valid values are 'arrow', 'bar', or 'circle'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: arrow, bar, circle

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ArrowStrikethrough
Switch parameter to enable a strikethrough effect for the link.

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

### -Chosen
Switch parameter to mark the link as chosen.

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

### -Color
Specifies the color of the link.

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

### -ColorHighlight
Specifies the highlight color of the link.

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

### -ColorHover
Specifies the hover color of the link.

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

### -ColorInherit
Specifies how the link color should inherit. Valid values are 'true', 'false', 'from', 'to', or 'both'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: true, false, from, to, both

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ColorOpacity
Specifies the opacity of the link color. Range between 0 and 1.

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

### -Dashes
Switch parameter to enable dashed line style for the link.

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

### -FontAlign
Possible options: 'horizontal','top','middle','bottom'.
The alignment determines how the label is aligned over the edge.
The default value horizontal aligns the label horizontally, regardless of the orientation of the edge.
When an option other than horizontal is chosen, the label will align itself according to the edge.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: horizontal, top, middle, bottom

Required: False
Position: 21
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontBackground
Specifies the background color for the font.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 18
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontColor
Specifies the font color for the label.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 15
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontMulti
Specifies whether the label supports multiple lines or markdown/html formatting.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: false, true, markdown, html

Required: False
Position: 22
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontName
Specifies the font name for the label.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 17
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontSize
Specifies the font size for the label.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 16
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontStrokeColor
Specifies the stroke color for the font.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 20
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontStrokeWidth
Specifies the stroke width for the font. (in pixels)

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 19
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontVAdjust
Specifies the vertical adjustment for the label.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 23
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -From
Specifies the starting node of the link.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Label
Specifies the label text for the link.

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

### -Length
Specifies the length of the link.

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

### -SmoothForceDirection
Accepted options: ['horizontal', 'vertical', 'none'].
This options is only used with the cubicBezier curves.
When true, horizontal is chosen, when false, the direction that is larger (x distance between nodes vs y distance between nodes) is used.
If the x distance is larger, horizontal. This is ment to be used with hierarchical layouts.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: horizontal, vertical, none

Required: False
Position: 26
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -SmoothRoundness
Accepted range: 0 .. 1.0. This parameter tweaks the roundness of the smooth curves for all types EXCEPT dynamic.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 27
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -SmoothType
Possible options: 'dynamic', 'continuous', 'discrete', 'diagonalCross', 'straightCross', 'horizontal', 'vertical', 'curvedCW', 'curvedCCW', 'cubicBezier'.
Take a look at this example to see what these look like and pick the one that you like best! When using dynamic, the edges will have an invisible support node guiding the shape.
This node is part of the physics simulation.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: dynamic, continuous, discrete, diagonalCross, straightCross, horizontal, vertical, curvedCW, curvedCCW, cubicBezier

Required: False
Position: 25
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -To
Specifies the ending node of the link.

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

### -WidthConstraint
Specifies the width constraint for the link.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 24
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

