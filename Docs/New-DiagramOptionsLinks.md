---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-DiagramOptionsLinks
## SYNOPSIS
Creates a new set of options for diagram edges in a diagram.

## SYNTAX
### __AllParameterSets
```powershell
New-DiagramOptionsLinks [[-ArrowsToEnabled] <bool>] [[-ArrowsToScaleFactor] <int>] [[-ArrowsToType] <string>] [[-ArrowsMiddleEnabled] <bool>] [[-ArrowsMiddleScaleFactor] <int>] [[-ArrowsMiddleType] <string>] [[-ArrowsFromEnabled] <bool>] [[-ArrowsFromScaleFactor] <int>] [[-ArrowsFromType] <string>] [[-ArrowStrikethrough] <bool>] [[-Chosen] <bool>] [[-Color] <string>] [[-ColorHighlight] <string>] [[-ColorHover] <string>] [[-ColorInherit] <string>] [[-ColorOpacity] <double>] [[-Dashes] <bool>] [[-Length] <string>] [[-FontColor] <string>] [[-FontSize] <int>] [[-FontName] <string>] [[-FontBackground] <string>] [[-FontStrokeWidth] <int>] [[-FontStrokeColor] <string>] [[-FontAlign] <string>] [[-FontMulti] <string>] [[-FontVAdjust] <int>] [[-WidthConstraint] <int>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new set of options for diagram edges in a diagram. It allows customization of various properties such as arrows, colors, fonts, and constraints for diagram edges.

## EXAMPLES

### EXAMPLE 1
```powershell
New-DiagramOptionsLinks -ArrowsToEnabled $true -ArrowsToScaleFactor 2 -ArrowsToType 'arrow' -ArrowsMiddleEnabled $false -ArrowsMiddleScaleFactor 1 -ArrowsMiddleType 'bar' -ArrowsFromEnabled $true -ArrowsFromScaleFactor 2 -ArrowsFromType 'circle' -ArrowStrikethrough $false -Chosen $true -Color 'blue' -ColorHighlight 'yellow' -ColorHover 'green' -ColorInherit 'from' -ColorOpacity 0.8 -Dashes $false -Length '100px' -FontColor 'black' -FontSize 12 -FontName 'Arial' -FontBackground 'white' -FontStrokeWidth 1 -FontStrokeColor 'gray' -FontAlign 'center' -FontMulti 'true' -FontVAdjust 0 -WidthConstraint 150
```

Description
-----------
Creates a new set of diagram edge options with specific configurations.

## PARAMETERS

### -ArrowsFromEnabled
Specifies whether arrows pointing from the edge are enabled.

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

### -ArrowsFromScaleFactor
Specifies the scale factor for arrows pointing from the edge.

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
Specifies the type of arrows pointing from the edge. Valid values are 'arrow', 'bar', 'circle'.

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
Specifies whether arrows in the middle of the edge are enabled.

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

### -ArrowsMiddleScaleFactor
Specifies the scale factor for arrows in the middle of the edge.

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

### -ArrowsMiddleType
Specifies the type of arrows in the middle of the edge. Valid values are 'arrow', 'bar', 'circle'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: arrow, bar, circle

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ArrowsToEnabled
Specifies whether arrows pointing to the edge are enabled.

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

### -ArrowsToScaleFactor
Specifies the scale factor for arrows pointing to the edge.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ArrowsToType
Specifies the type of arrows pointing to the edge. Valid values are 'arrow', 'bar', 'circle'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: arrow, bar, circle

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ArrowStrikethrough
Specifies whether the arrow should have a strikethrough effect.

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

### -Chosen
Specifies whether the edge is chosen.

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

### -Color
Specifies the color of the edge.

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

### -ColorHighlight
Specifies the color of the edge when highlighted.

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

### -ColorHover
Specifies the color of the edge when hovered over.

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

### -ColorInherit
Specifies how the color of the edge should inherit. Valid values are 'true', 'false', 'from', 'to', 'both'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: true, false, from, to, both

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ColorOpacity
Specifies the opacity of the color of the edge. Range between 0 and 1.

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

### -Dashes
Specifies whether the edge should be dashed.

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

### -FontAlign
Specifies the alignment of the font. Valid values are 'center', 'left'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: center, left

Required: False
Position: 24
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontBackground
Specifies the background color of the font on the edge.

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

### -FontColor
Specifies the color of the font on the edge.

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

### -FontMulti
Specifies whether the font supports multiline. Valid values are 'false', 'true', 'markdown', 'html'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: false, true, markdown, html

Required: False
Position: 25
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontName
Specifies the font name for the edge.

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

### -FontSize
Specifies the font size in pixels.

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

### -FontStrokeColor
Specifies the stroke color of the font on the edge.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 23
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontStrokeWidth
Specifies the stroke width of the font in pixels.

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

### -FontVAdjust
Specifies the vertical adjustment of the font.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 26
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Length
Specifies the length of the edge.

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

### -WidthConstraint
Specifies the width constraint of the edge.

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

