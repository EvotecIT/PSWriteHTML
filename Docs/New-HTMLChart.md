---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version:
schema: 2.0.0
---

# New-HTMLChart

## SYNOPSIS
{{Fill in the Synopsis}}

## SYNTAX

```
New-HTMLChart [[-Height] <Int32>] [[-Width] <Int32>] [[-Type] <String>] [[-Horizontal] <Boolean>]
 [[-DataLabelsEnabled] <Boolean>] [[-DataLabelsOffsetX] <Int32>] [[-DataLabelsFontSize] <String>]
 [[-DataLabelsColor] <RGBColors>] [[-Data] <Array>] [[-DataNames] <Array>] [[-DataCategories] <Array>]
 [[-DataCategoriesType] <String>] [[-TitleText] <String>] [[-TitleAlignment] <String>] [[-LineShow] <Boolean>]
 [[-LineCurve] <Object>] [[-LineWidth] <Object>] [[-LineColor] <RGBColors[]>] [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Data
{{Fill Data Description}}

```yaml
Type: Array
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DataCategories
{{Fill DataCategories Description}}

```yaml
Type: Array
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DataCategoriesType
{{Fill DataCategoriesType Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: datetime, category, numeric

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DataLabelsColor
{{Fill DataLabelsColor Description}}

```yaml
Type: RGBColors
Parameter Sets: (All)
Aliases:
Accepted values: Black, Navy, DarkBlue, MediumBlue, Blue, DarkGreen, Green, Teal, DarkCyan, DeepSkyBlue, DarkTurquoise, MediumSpringGreen, Lime, SpringGreen, Aqua, Cyan, MidnightBlue, DodgerBlue, LightSeaGreen, ForestGreen, SeaGreen, DarkSlateGray, DarkSlateGrey, LimeGreen, MediumSeaGreen, Turquoise, RoyalBlue, SteelBlue, DarkSlateBlue, MediumTurquoise, Indigo, DarkOliveGreen, CadetBlue, CornflowerBlue, MediumAquamarine, DimGray, DimGrey, SlateBlue, OliveDrab, SlateGray, SlateGrey, LightSlateGray, LightSlateGrey, MediumSlateBlue, LawnGreen, Chartreuse, Aquamarine, Maroon, Purple, Olive, Grey, Gray, SkyBlue, LightSkyBlue, BlueViolet, DarkRed, DarkMagenta, SaddleBrown, DarkSeaGreen, LightGreen, MediumPurple, DarkViolet, PaleGreen, DarkOrchid, YellowGreen, Sienna, Brown, DarkGray, DarkGrey, LightBlue, GreenYellow, PaleTurquoise, LightSteelBlue, PowderBlue, FireBrick, DarkGoldenrod, MediumOrchid, RosyBrown, DarkKhaki, Silver, MediumVioletRed, IndianRed, Peru, Chocolate, Tan, LightGray, LightGrey, Thistle, Orchid, Goldenrod, PaleVioletRed, Crimson, Gainsboro, Plum, BurlyWood, LightCyan, Lavender, DarkSalmon, Violet, PaleGoldenrod, LightCoral, Khaki, AliceBlue, Honeydew, Azure, SandyBrown, Wheat, Beige, WhiteSmoke, MintCream, GhostWhite, Salmon, AntiqueWhite, Linen, LightGoldenrodYellow, OldLace, Red, Fuchsia, Magenta, DeepPink, OrangeRed, Tomato, HotPink, Coral, DarkOrange, LightSalmon, Orange, LightPink, Pink, Gold, PeachPuff, NavajoWhite, Moccasin, Bisque, MistyRose, BlanchedAlmond, PapayaWhip, LavenderBlush, Seashell, Cornsilk, LemonChiffon, FloralWhite, Snow, Yellow, LightYellow, Ivory, White

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DataLabelsEnabled
{{Fill DataLabelsEnabled Description}}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DataLabelsFontSize
{{Fill DataLabelsFontSize Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DataLabelsOffsetX
{{Fill DataLabelsOffsetX Description}}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DataNames
{{Fill DataNames Description}}

```yaml
Type: Array
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Height
{{Fill Height Description}}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Horizontal
{{Fill Horizontal Description}}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LineColor
{{Fill LineColor Description}}

```yaml
Type: RGBColors[]
Parameter Sets: (All)
Aliases:
Accepted values: Black, Navy, DarkBlue, MediumBlue, Blue, DarkGreen, Green, Teal, DarkCyan, DeepSkyBlue, DarkTurquoise, MediumSpringGreen, Lime, SpringGreen, Aqua, Cyan, MidnightBlue, DodgerBlue, LightSeaGreen, ForestGreen, SeaGreen, DarkSlateGray, DarkSlateGrey, LimeGreen, MediumSeaGreen, Turquoise, RoyalBlue, SteelBlue, DarkSlateBlue, MediumTurquoise, Indigo, DarkOliveGreen, CadetBlue, CornflowerBlue, MediumAquamarine, DimGray, DimGrey, SlateBlue, OliveDrab, SlateGray, SlateGrey, LightSlateGray, LightSlateGrey, MediumSlateBlue, LawnGreen, Chartreuse, Aquamarine, Maroon, Purple, Olive, Grey, Gray, SkyBlue, LightSkyBlue, BlueViolet, DarkRed, DarkMagenta, SaddleBrown, DarkSeaGreen, LightGreen, MediumPurple, DarkViolet, PaleGreen, DarkOrchid, YellowGreen, Sienna, Brown, DarkGray, DarkGrey, LightBlue, GreenYellow, PaleTurquoise, LightSteelBlue, PowderBlue, FireBrick, DarkGoldenrod, MediumOrchid, RosyBrown, DarkKhaki, Silver, MediumVioletRed, IndianRed, Peru, Chocolate, Tan, LightGray, LightGrey, Thistle, Orchid, Goldenrod, PaleVioletRed, Crimson, Gainsboro, Plum, BurlyWood, LightCyan, Lavender, DarkSalmon, Violet, PaleGoldenrod, LightCoral, Khaki, AliceBlue, Honeydew, Azure, SandyBrown, Wheat, Beige, WhiteSmoke, MintCream, GhostWhite, Salmon, AntiqueWhite, Linen, LightGoldenrodYellow, OldLace, Red, Fuchsia, Magenta, DeepPink, OrangeRed, Tomato, HotPink, Coral, DarkOrange, LightSalmon, Orange, LightPink, Pink, Gold, PeachPuff, NavajoWhite, Moccasin, Bisque, MistyRose, BlanchedAlmond, PapayaWhip, LavenderBlush, Seashell, Cornsilk, LemonChiffon, FloralWhite, Snow, Yellow, LightYellow, Ivory, White

Required: False
Position: 17
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LineCurve
{{Fill LineCurve Description}}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:
Accepted values: straight, smooth

Required: False
Position: 15
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LineShow
{{Fill LineShow Description}}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LineWidth
{{Fill LineWidth Description}}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 16
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TitleAlignment
{{Fill TitleAlignment Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: center, left, right, 

Required: False
Position: 13
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TitleText
{{Fill TitleText Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type
{{Fill Type Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Width
{{Fill Width Description}}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
