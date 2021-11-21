---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version:
schema: 2.0.0
---

# New-DiagramNode

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

### Shape (Default)
```
New-DiagramNode [-HtmlTextBox <ScriptBlock>] [-Id <String>] [-Label <String>] [-Title <String>]
 [-To <String[]>] [-ArrowsToEnabled] [-ArrowsMiddleEnabled] [-ArrowsFromEnabled] [-LinkColor <String>]
 [-Shape <String>] [-BorderWidth <Int32>] [-BorderWidthSelected <Int32>] [-Chosen <Boolean>]
 [-ColorBorder <String>] [-ColorBackground <String>] [-ColorHighlightBorder <String>]
 [-ColorHighlightBackground <String>] [-ColorHoverBorder <String>] [-ColorHoverBackground <String>]
 [-FixedX <Boolean>] [-FixedY <Boolean>] [-FontColor <String>] [-FontSize <Int32>] [-FontName <String>]
 [-FontBackground <String>] [-FontStrokeWidth <Int32>] [-FontStrokeColor <String>] [-FontAlign <String>]
 [-FontMulti <String>] [-FontVAdjust <Int32>] [-Size <Int32>] [-X <Int32>] [-Y <Int32>] [-Level <Int32>]
 [-HeightConstraintMinimum <Int32>] [-HeightConstraintVAlign <String>] [-WidthConstraintMinimum <Int32>]
 [-WidthConstraintMaximum <Int32>] [<CommonParameters>]
```

### Image
```
New-DiagramNode [-HtmlTextBox <ScriptBlock>] [-Id <String>] [-Label <String>] [-Title <String>]
 [-To <String[]>] [-ArrowsToEnabled] [-ArrowsMiddleEnabled] [-ArrowsFromEnabled] [-LinkColor <String>]
 [-ImageType <String>] [-Image <Uri>] [-BorderWidth <Int32>] [-BorderWidthSelected <Int32>]
 [-BrokenImages <String>] [-Chosen <Boolean>] [-ColorBorder <String>] [-ColorBackground <String>]
 [-ColorHighlightBorder <String>] [-ColorHighlightBackground <String>] [-ColorHoverBorder <String>]
 [-ColorHoverBackground <String>] [-FixedX <Boolean>] [-FixedY <Boolean>] [-FontColor <String>]
 [-FontSize <Int32>] [-FontName <String>] [-FontBackground <String>] [-FontStrokeWidth <Int32>]
 [-FontStrokeColor <String>] [-FontAlign <String>] [-FontMulti <String>] [-FontVAdjust <Int32>] [-Size <Int32>]
 [-X <Int32>] [-Y <Int32>] [-Level <Int32>] [-HeightConstraintMinimum <Int32>]
 [-HeightConstraintVAlign <String>] [-WidthConstraintMinimum <Int32>] [-WidthConstraintMaximum <Int32>]
 [<CommonParameters>]
```

### FontAwesomeSolid
```
New-DiagramNode [-HtmlTextBox <ScriptBlock>] [-Id <String>] [-Label <String>] [-Title <String>]
 [-To <String[]>] [-ArrowsToEnabled] [-ArrowsMiddleEnabled] [-ArrowsFromEnabled] [-LinkColor <String>]
 [-BorderWidth <Int32>] [-BorderWidthSelected <Int32>] [-Chosen <Boolean>] [-FixedX <Boolean>]
 [-FixedY <Boolean>] [-FontColor <String>] [-FontSize <Int32>] [-FontName <String>] [-FontBackground <String>]
 [-FontStrokeWidth <Int32>] [-FontStrokeColor <String>] [-FontAlign <String>] [-FontMulti <String>]
 [-FontVAdjust <Int32>] [-Size <Int32>] [-X <Int32>] [-Y <Int32>] [-IconAsImage] [-IconColor <String>]
 [-IconSolid <String>] [-Level <Int32>] [-HeightConstraintMinimum <Int32>] [-HeightConstraintVAlign <String>]
 [-WidthConstraintMinimum <Int32>] [-WidthConstraintMaximum <Int32>] [<CommonParameters>]
```

### FontAwesomeRegular
```
New-DiagramNode [-HtmlTextBox <ScriptBlock>] [-Id <String>] [-Label <String>] [-Title <String>]
 [-To <String[]>] [-ArrowsToEnabled] [-ArrowsMiddleEnabled] [-ArrowsFromEnabled] [-LinkColor <String>]
 [-BorderWidth <Int32>] [-BorderWidthSelected <Int32>] [-Chosen <Boolean>] [-FixedX <Boolean>]
 [-FixedY <Boolean>] [-FontColor <String>] [-FontSize <Int32>] [-FontName <String>] [-FontBackground <String>]
 [-FontStrokeWidth <Int32>] [-FontStrokeColor <String>] [-FontAlign <String>] [-FontMulti <String>]
 [-FontVAdjust <Int32>] [-Size <Int32>] [-X <Int32>] [-Y <Int32>] [-IconAsImage] [-IconColor <String>]
 [-IconRegular <String>] [-Level <Int32>] [-HeightConstraintMinimum <Int32>] [-HeightConstraintVAlign <String>]
 [-WidthConstraintMinimum <Int32>] [-WidthConstraintMaximum <Int32>] [<CommonParameters>]
```

### FontAwesomeBrands
```
New-DiagramNode [-HtmlTextBox <ScriptBlock>] [-Id <String>] [-Label <String>] [-Title <String>]
 [-To <String[]>] [-ArrowsToEnabled] [-ArrowsMiddleEnabled] [-ArrowsFromEnabled] [-LinkColor <String>]
 [-BorderWidth <Int32>] [-BorderWidthSelected <Int32>] [-Chosen <Boolean>] [-FixedX <Boolean>]
 [-FixedY <Boolean>] [-FontColor <String>] [-FontSize <Int32>] [-FontName <String>] [-FontBackground <String>]
 [-FontStrokeWidth <Int32>] [-FontStrokeColor <String>] [-FontAlign <String>] [-FontMulti <String>]
 [-FontVAdjust <Int32>] [-Size <Int32>] [-X <Int32>] [-Y <Int32>] [-IconAsImage] [-IconColor <String>]
 [-IconBrands <String>] [-Level <Int32>] [-HeightConstraintMinimum <Int32>] [-HeightConstraintVAlign <String>]
 [-WidthConstraintMinimum <Int32>] [-WidthConstraintMaximum <Int32>] [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -HtmlTextBox
Experimental TextBox to put HTML instead of Image using SVG

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id
{{ Fill Id Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Label
{{ Fill Label Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Title
Label that shows up when hovering over node

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -To
{{ Fill To Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ArrowsToEnabled
{{ Fill ArrowsToEnabled Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ArrowsMiddleEnabled
{{ Fill ArrowsMiddleEnabled Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ArrowsFromEnabled
{{ Fill ArrowsFromEnabled Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LinkColor
{{ Fill LinkColor Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases: EdgeColor

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Shape
{{ Fill Shape Description }}

```yaml
Type: String
Parameter Sets: Shape
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ImageType
{{ Fill ImageType Description }}

```yaml
Type: String
Parameter Sets: Image
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Image
{{ Fill Image Description }}

```yaml
Type: Uri
Parameter Sets: Image
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BorderWidth
{{ Fill BorderWidth Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BorderWidthSelected
{{ Fill BorderWidthSelected Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BrokenImages
{{ Fill BrokenImages Description }}

```yaml
Type: String
Parameter Sets: Image
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Chosen
{{ Fill Chosen Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ColorBorder
{{ Fill ColorBorder Description }}

```yaml
Type: String
Parameter Sets: Shape, Image
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ColorBackground
{{ Fill ColorBackground Description }}

```yaml
Type: String
Parameter Sets: Shape, Image
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ColorHighlightBorder
{{ Fill ColorHighlightBorder Description }}

```yaml
Type: String
Parameter Sets: Shape, Image
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ColorHighlightBackground
{{ Fill ColorHighlightBackground Description }}

```yaml
Type: String
Parameter Sets: Shape, Image
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ColorHoverBorder
{{ Fill ColorHoverBorder Description }}

```yaml
Type: String
Parameter Sets: Shape, Image
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ColorHoverBackground
{{ Fill ColorHoverBackground Description }}

```yaml
Type: String
Parameter Sets: Shape, Image
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FixedX
{{ Fill FixedX Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FixedY
{{ Fill FixedY Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FontColor
{{ Fill FontColor Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FontSize
{{ Fill FontSize Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FontName
{{ Fill FontName Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FontBackground
{{ Fill FontBackground Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FontStrokeWidth
{{ Fill FontStrokeWidth Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FontStrokeColor
{{ Fill FontStrokeColor Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FontAlign
{{ Fill FontAlign Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FontMulti
{{ Fill FontMulti Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FontVAdjust
{{ Fill FontVAdjust Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Size
{{ Fill Size Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -X
{{ Fill X Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Y
{{ Fill Y Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IconAsImage
{{ Fill IconAsImage Description }}

```yaml
Type: SwitchParameter
Parameter Sets: FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IconColor
{{ Fill IconColor Description }}

```yaml
Type: String
Parameter Sets: FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IconBrands
{{ Fill IconBrands Description }}

```yaml
Type: String
Parameter Sets: FontAwesomeBrands
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IconRegular
{{ Fill IconRegular Description }}

```yaml
Type: String
Parameter Sets: FontAwesomeRegular
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IconSolid
{{ Fill IconSolid Description }}

```yaml
Type: String
Parameter Sets: FontAwesomeSolid
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Level
{{ Fill Level Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HeightConstraintMinimum
{{ Fill HeightConstraintMinimum Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HeightConstraintVAlign
{{ Fill HeightConstraintVAlign Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WidthConstraintMinimum
{{ Fill WidthConstraintMinimum Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WidthConstraintMaximum
{{ Fill WidthConstraintMaximum Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
