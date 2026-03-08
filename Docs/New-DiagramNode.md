---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-DiagramNode
## SYNOPSIS
Creates nodes on a diagram

## SYNTAX
### Shape (Default)
```powershell
New-DiagramNode [-HtmlTextBox <scriptblock>] [-Id <string>] [-Label <string>] [-Title <string>] [-To <string[]>] [-ArrowsToEnabled] [-ArrowsMiddleEnabled] [-ArrowsFromEnabled] [-LinkColor <string>] [-Shape <string>] [-BorderWidth <int>] [-BorderWidthSelected <int>] [-Chosen <bool>] [-ColorBorder <string>] [-ColorBackground <string>] [-ColorHighlightBorder <string>] [-ColorHighlightBackground <string>] [-ColorHoverBorder <string>] [-ColorHoverBackground <string>] [-FixedX <bool>] [-FixedY <bool>] [-FontColor <string>] [-FontSize <int>] [-FontName <string>] [-FontBackground <string>] [-FontStrokeWidth <int>] [-FontStrokeColor <string>] [-FontAlign <string>] [-FontMulti <string>] [-FontVAdjust <int>] [-Size <int>] [-X <int>] [-Y <int>] [-Level <int>] [-HeightConstraintMinimum <int>] [-HeightConstraintVAlign <string>] [-WidthConstraintMinimum <int>] [-WidthConstraintMaximum <int>] [<CommonParameters>]
```

### Image
```powershell
New-DiagramNode [-HtmlTextBox <scriptblock>] [-Id <string>] [-Label <string>] [-Title <string>] [-To <string[]>] [-ArrowsToEnabled] [-ArrowsMiddleEnabled] [-ArrowsFromEnabled] [-LinkColor <string>] [-ImageType <string>] [-Image <uri>] [-BorderWidth <int>] [-BorderWidthSelected <int>] [-BrokenImages <string>] [-Chosen <bool>] [-ColorBorder <string>] [-ColorBackground <string>] [-ColorHighlightBorder <string>] [-ColorHighlightBackground <string>] [-ColorHoverBorder <string>] [-ColorHoverBackground <string>] [-FixedX <bool>] [-FixedY <bool>] [-FontColor <string>] [-FontSize <int>] [-FontName <string>] [-FontBackground <string>] [-FontStrokeWidth <int>] [-FontStrokeColor <string>] [-FontAlign <string>] [-FontMulti <string>] [-FontVAdjust <int>] [-Size <int>] [-X <int>] [-Y <int>] [-Level <int>] [-HeightConstraintMinimum <int>] [-HeightConstraintVAlign <string>] [-WidthConstraintMinimum <int>] [-WidthConstraintMaximum <int>] [<CommonParameters>]
```

### FontAwesomeSolid
```powershell
New-DiagramNode [-HtmlTextBox <scriptblock>] [-Id <string>] [-Label <string>] [-Title <string>] [-To <string[]>] [-ArrowsToEnabled] [-ArrowsMiddleEnabled] [-ArrowsFromEnabled] [-LinkColor <string>] [-BorderWidth <int>] [-BorderWidthSelected <int>] [-Chosen <bool>] [-FixedX <bool>] [-FixedY <bool>] [-FontColor <string>] [-FontSize <int>] [-FontName <string>] [-FontBackground <string>] [-FontStrokeWidth <int>] [-FontStrokeColor <string>] [-FontAlign <string>] [-FontMulti <string>] [-FontVAdjust <int>] [-Size <int>] [-X <int>] [-Y <int>] [-IconAsImage] [-IconColor <string>] [-IconSolid <string>] [-Level <int>] [-HeightConstraintMinimum <int>] [-HeightConstraintVAlign <string>] [-WidthConstraintMinimum <int>] [-WidthConstraintMaximum <int>] [<CommonParameters>]
```

### FontAwesomeRegular
```powershell
New-DiagramNode [-HtmlTextBox <scriptblock>] [-Id <string>] [-Label <string>] [-Title <string>] [-To <string[]>] [-ArrowsToEnabled] [-ArrowsMiddleEnabled] [-ArrowsFromEnabled] [-LinkColor <string>] [-BorderWidth <int>] [-BorderWidthSelected <int>] [-Chosen <bool>] [-FixedX <bool>] [-FixedY <bool>] [-FontColor <string>] [-FontSize <int>] [-FontName <string>] [-FontBackground <string>] [-FontStrokeWidth <int>] [-FontStrokeColor <string>] [-FontAlign <string>] [-FontMulti <string>] [-FontVAdjust <int>] [-Size <int>] [-X <int>] [-Y <int>] [-IconAsImage] [-IconColor <string>] [-IconRegular <string>] [-Level <int>] [-HeightConstraintMinimum <int>] [-HeightConstraintVAlign <string>] [-WidthConstraintMinimum <int>] [-WidthConstraintMaximum <int>] [<CommonParameters>]
```

### FontAwesomeBrands
```powershell
New-DiagramNode [-HtmlTextBox <scriptblock>] [-Id <string>] [-Label <string>] [-Title <string>] [-To <string[]>] [-ArrowsToEnabled] [-ArrowsMiddleEnabled] [-ArrowsFromEnabled] [-LinkColor <string>] [-BorderWidth <int>] [-BorderWidthSelected <int>] [-Chosen <bool>] [-FixedX <bool>] [-FixedY <bool>] [-FontColor <string>] [-FontSize <int>] [-FontName <string>] [-FontBackground <string>] [-FontStrokeWidth <int>] [-FontStrokeColor <string>] [-FontAlign <string>] [-FontMulti <string>] [-FontVAdjust <int>] [-Size <int>] [-X <int>] [-Y <int>] [-IconAsImage] [-IconColor <string>] [-IconBrands <string>] [-Level <int>] [-HeightConstraintMinimum <int>] [-HeightConstraintVAlign <string>] [-WidthConstraintMinimum <int>] [-WidthConstraintMaximum <int>] [<CommonParameters>]
```

## DESCRIPTION
Creates nodes on a diagram

## EXAMPLES

### EXAMPLE 1
```powershell
An example
```

## PARAMETERS

### -ArrowsFromEnabled
Parameter description

```yaml
Type: SwitchParameter
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -ArrowsMiddleEnabled
Parameter description

```yaml
Type: SwitchParameter
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -ArrowsToEnabled
Parameter description

```yaml
Type: SwitchParameter
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderWidth
Parameter description

```yaml
Type: Nullable`1
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderWidthSelected
Parameter description

```yaml
Type: Nullable`1
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BrokenImages
Parameter description

```yaml
Type: String
Parameter Sets: Image
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Chosen
Parameter description

```yaml
Type: Nullable`1
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ColorBackground
Parameter description

```yaml
Type: String
Parameter Sets: Shape, Image
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ColorBorder
Parameter description

```yaml
Type: String
Parameter Sets: Shape, Image
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ColorHighlightBackground
Parameter description

```yaml
Type: String
Parameter Sets: Shape, Image
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ColorHighlightBorder
Parameter description

```yaml
Type: String
Parameter Sets: Shape, Image
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ColorHoverBackground
Parameter description

```yaml
Type: String
Parameter Sets: Shape, Image
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ColorHoverBorder
Parameter description

```yaml
Type: String
Parameter Sets: Shape, Image
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FixedX
Parameter description

```yaml
Type: Nullable`1
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FixedY
Parameter description

```yaml
Type: Nullable`1
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontAlign
This can be set to 'left' to make the label left-aligned. Otherwise, defaults to 'center'.

```yaml
Type: String
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: center, left

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontBackground
When not undefined but a color string, a background rectangle will be drawn behind the label in the supplied color.

```yaml
Type: String
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontColor
Color of the label text.

```yaml
Type: String
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontMulti
If false, the label is treated as pure text drawn with the base font.
If true or 'html' the label may be multifonted, with bold, italic and code markup, interpreted as html.
If the value is 'markdown' or 'md' the label may be multifonted, with bold, italic and code markup, interpreted as markdown.
The bold, italic, bold-italic and monospaced fonts may be set up under in the font.bold, font.ital, font.boldital and font.mono properties, respectively.

```yaml
Type: String
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: false, true, markdown, html

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontName
Font face (or font family) of the label text.

```yaml
Type: String
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontSize
Size of the label text.

```yaml
Type: Nullable`1
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontStrokeColor
This is the color of the stroke assuming the value for stroke is higher than 0.

```yaml
Type: String
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontStrokeWidth
As an alternative to the background rectangle, a stroke can be drawn around the text. When a value higher than 0 is supplied, the stroke will be draw

```yaml
Type: Nullable`1
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontVAdjust
Parameter description

```yaml
Type: Nullable`1
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HeightConstraintMinimum
Parameter description

```yaml
Type: Nullable`1
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HeightConstraintVAlign
Parameter description

```yaml
Type: String
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: top, middle, bottom

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HtmlTextBox
Experimental TextBox to put HTML instead of Image using SVG

```yaml
Type: ScriptBlock
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -IconAsImage
Parameter description

```yaml
Type: SwitchParameter
Parameter Sets: FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -IconBrands
Parameter description

```yaml
Type: String
Parameter Sets: FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -IconColor
Parameter description

```yaml
Type: String
Parameter Sets: FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -IconRegular
Parameter description

```yaml
Type: String
Parameter Sets: FontAwesomeRegular
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -IconSolid
Parameter description

```yaml
Type: String
Parameter Sets: FontAwesomeSolid
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Id
Id of a node. If not set, label will be used as Id.

```yaml
Type: String
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Image
Parameter description

```yaml
Type: Uri
Parameter Sets: Image
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ImageType
Parameter description

```yaml
Type: String
Parameter Sets: Image
Aliases: 
Possible values: squareImage, circularImage

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Label
Label for a diagram

```yaml
Type: String
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Level
Parameter description

```yaml
Type: Nullable`1
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -LinkColor
Parameter description

```yaml
Type: String
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: EdgeColor
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Shape
Parameter description

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
The size is used to determine the size of node shapes that do not have the label inside of them.
These shapes are: image, circularImage, diamond, dot, star, triangle, triangleDown, hexagon, square and icon

```yaml
Type: Nullable`1
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Title
Label that shows up when hovering over node

```yaml
Type: String
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -To
Parameter description

```yaml
Type: String[]
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -WidthConstraintMaximum
Parameter description

```yaml
Type: Nullable`1
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -WidthConstraintMinimum
Parameter description

```yaml
Type: Nullable`1
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -X
Parameter description

```yaml
Type: Nullable`1
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Y
Parameter description

```yaml
Type: Nullable`1
Parameter Sets: Shape, Image, FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
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

