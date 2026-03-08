---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-DiagramOptionsNodes
## SYNOPSIS
Creates a custom object representing options for diagram nodes.

## SYNTAX
### Shape
```powershell
New-DiagramOptionsNodes [-BorderWidth <int>] [-BorderWidthSelected <int>] [-BrokenImage <string>] [-Chosen <bool>] [-ColorBorder <string>] [-ColorBackground <string>] [-ColorHighlightBorder <string>] [-ColorHighlightBackground <string>] [-ColorHoverBorder <string>] [-ColorHoverBackground <string>] [-FixedX <bool>] [-FixedY <bool>] [-FontColor <string>] [-FontSize <int>] [-FontName <string>] [-FontBackground <string>] [-FontStrokeWidth <int>] [-FontStrokeColor <string>] [-FontAlign <string>] [-FontMulti <string>] [-FontVAdjust <int>] [-Size <int>] [-Shape <string>] [-HeightConstraintMinimum <int>] [-HeightConstraintVAlign <string>] [-WidthConstraintMinimum <int>] [-WidthConstraintMaximum <int>] [-Margin <int>] [-MarginTop <int>] [-MarginRight <int>] [-MarginBottom <int>] [-MarginLeft <int>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a custom object with various settings for diagram nodes, such as border width, colors, font styles, shape, constraints, and margins.

## EXAMPLES

### EXAMPLE 1
```powershell
New-DiagramOptionsNodes -BorderWidth 1 -BorderWidthSelected 2 -ColorBorder '#2B7CE9' -ColorBackground '#97C2FC' -Shape 'circle' -Size 50
Creates a new diagram node with specified border widths, colors, shape, and size.
```

### EXAMPLE 2
```powershell
New-DiagramOptionsNodes -FontColor '#000000' -FontSize 12 -FontName 'Arial' -Shape 'square' -Size 30
Creates a new diagram node with specified font color, size, font family, shape, and size.
```

## PARAMETERS

### -BorderWidth
Specifies the width of the border around the node.

```yaml
Type: Nullable`1
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderWidthSelected
Specifies the width of the border around the node when selected.

```yaml
Type: Nullable`1
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BrokenImage
Specifies the image to display if the node image is broken.

```yaml
Type: String
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Chosen
Indicates whether the node is chosen.

```yaml
Type: Nullable`1
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ColorBackground
Specifies the background color of the node.

```yaml
Type: String
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ColorBorder
Specifies the color of the node border.

```yaml
Type: String
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ColorHighlightBackground
Specifies the background color of the node when highlighted.

```yaml
Type: String
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ColorHighlightBorder
Specifies the color of the node border when highlighted.

```yaml
Type: String
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ColorHoverBackground
Specifies the background color of the node when hovered over.

```yaml
Type: String
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ColorHoverBorder
Specifies the color of the node border when hovered over.

```yaml
Type: String
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FixedX
Indicates whether the node's X position is fixed.

```yaml
Type: Nullable`1
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FixedY
Indicates whether the node's Y position is fixed.

```yaml
Type: Nullable`1
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontAlign
Specifies the alignment of the node's text (center or left).

```yaml
Type: String
Parameter Sets: Shape
Aliases: 
Possible values: center, left

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontBackground
Specifies the background color of the node's font.

```yaml
Type: String
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontColor
Specifies the color of the node's font.

```yaml
Type: String
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontMulti
Specifies the multi-line mode for the node's text (false, true, markdown, html).

```yaml
Type: String
Parameter Sets: Shape
Aliases: 
Possible values: false, true, markdown, html

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontName
Specifies the font family of the node text.

```yaml
Type: String
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontSize
Specifies the font size of the node text in pixels.

```yaml
Type: Nullable`1
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontStrokeColor
Specifies the stroke color of the node's font.

```yaml
Type: String
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontStrokeWidth
Specifies the stroke width of the node's font.

```yaml
Type: Nullable`1
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontVAdjust
Specifies the vertical adjustment of the node's text.

```yaml
Type: Nullable`1
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HeightConstraintMinimum
Specifies the minimum height constraint for the node.

```yaml
Type: Nullable`1
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HeightConstraintVAlign
Specifies the vertical alignment of the node within its height constraint (top, middle, bottom).

```yaml
Type: String
Parameter Sets: Shape
Aliases: 
Possible values: top, middle, bottom

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Margin
Specifies the margin around the node on all sides.

```yaml
Type: Nullable`1
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -MarginBottom
Specifies the bottom margin around the node.

```yaml
Type: Nullable`1
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -MarginLeft
Specifies the left margin around the node.

```yaml
Type: Nullable`1
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -MarginRight
Specifies the right margin around the node.

```yaml
Type: Nullable`1
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -MarginTop
Specifies the top margin around the node.

```yaml
Type: Nullable`1
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Shape
Specifies the shape of the node (circle, dot, diamond, ellipse, database, box, square, triangle, triangleDown, text, star, hexagon).

```yaml
Type: String
Parameter Sets: Shape
Aliases: 
Possible values: circle, dot, diamond, ellipse, database, box, square, triangle, triangleDown, text, star, hexagon

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Size
Specifies the size of the node.

```yaml
Type: Nullable`1
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -WidthConstraintMaximum
Specifies the maximum width constraint for the node.

```yaml
Type: Nullable`1
Parameter Sets: Shape
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -WidthConstraintMinimum
Specifies the minimum width constraint for the node.

```yaml
Type: Nullable`1
Parameter Sets: Shape
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

