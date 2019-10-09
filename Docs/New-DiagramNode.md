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
New-DiagramNode [-Id <String>] [-Label <String>] [-To <String[]>] [-Shape <String>] [-BorderWidth <Int32>]
 [-BorderWidthSelected <Int32>] [-Chosen <Boolean>] [-ColorBorder <RGBColors>] [-ColorBackground <RGBColors>]
 [-ColorHighlightBorder <RGBColors>] [-ColorHighlightBackground <RGBColors>] [-ColorHoverBorder <RGBColors>]
 [-ColorHoverBackground <RGBColors>] [-FixedX <Boolean>] [-FixedY <Boolean>] [-FontColor <RGBColors>]
 [-FontSize <Int32>] [-FontName <String>] [-FontBackground <RGBColors>] [-FontStrokeWidth <Int32>]
 [-FontStrokeColor <RGBColors>] [-FontAlign <String>] [-FontMulti <String>] [-FontVAdjust <Int32>]
 [-Size <Int32>] [-WidthConstraint <Boolean>] [-X <Int32>] [-Y <Int32>] [<CommonParameters>]
```

### Image
```
New-DiagramNode [-Id <String>] [-Label <String>] [-To <String[]>] [-ImageType <String>] [-Image <Uri>]
 [-BorderWidth <Int32>] [-BorderWidthSelected <Int32>] [-BrokenImages <String>] [-Chosen <Boolean>]
 [-ColorBorder <RGBColors>] [-ColorBackground <RGBColors>] [-ColorHighlightBorder <RGBColors>]
 [-ColorHighlightBackground <RGBColors>] [-ColorHoverBorder <RGBColors>] [-ColorHoverBackground <RGBColors>]
 [-FixedX <Boolean>] [-FixedY <Boolean>] [-FontColor <RGBColors>] [-FontSize <Int32>] [-FontName <String>]
 [-FontBackground <RGBColors>] [-FontStrokeWidth <Int32>] [-FontStrokeColor <RGBColors>] [-FontAlign <String>]
 [-FontMulti <String>] [-FontVAdjust <Int32>] [-Size <Int32>] [-WidthConstraint <Boolean>] [-X <Int32>]
 [-Y <Int32>] [<CommonParameters>]
```

### FontAwesomeSolid
```
New-DiagramNode [-Id <String>] [-Label <String>] [-To <String[]>] [-BorderWidth <Int32>]
 [-BorderWidthSelected <Int32>] [-Chosen <Boolean>] [-FixedX <Boolean>] [-FixedY <Boolean>]
 [-FontColor <RGBColors>] [-FontSize <Int32>] [-FontName <String>] [-FontBackground <RGBColors>]
 [-FontStrokeWidth <Int32>] [-FontStrokeColor <RGBColors>] [-FontAlign <String>] [-FontMulti <String>]
 [-FontVAdjust <Int32>] [-Size <Int32>] [-WidthConstraint <Boolean>] [-X <Int32>] [-Y <Int32>] [-IconAsImage]
 [-IconColor <RGBColors>] [-IconSolid <String>] [<CommonParameters>]
```

### FontAwesomeRegular
```
New-DiagramNode [-Id <String>] [-Label <String>] [-To <String[]>] [-BorderWidth <Int32>]
 [-BorderWidthSelected <Int32>] [-Chosen <Boolean>] [-FixedX <Boolean>] [-FixedY <Boolean>]
 [-FontColor <RGBColors>] [-FontSize <Int32>] [-FontName <String>] [-FontBackground <RGBColors>]
 [-FontStrokeWidth <Int32>] [-FontStrokeColor <RGBColors>] [-FontAlign <String>] [-FontMulti <String>]
 [-FontVAdjust <Int32>] [-Size <Int32>] [-WidthConstraint <Boolean>] [-X <Int32>] [-Y <Int32>] [-IconAsImage]
 [-IconColor <RGBColors>] [-IconRegular <String>] [<CommonParameters>]
```

### FontAwesomeBrands
```
New-DiagramNode [-Id <String>] [-Label <String>] [-To <String[]>] [-BorderWidth <Int32>]
 [-BorderWidthSelected <Int32>] [-Chosen <Boolean>] [-FixedX <Boolean>] [-FixedY <Boolean>]
 [-FontColor <RGBColors>] [-FontSize <Int32>] [-FontName <String>] [-FontBackground <RGBColors>]
 [-FontStrokeWidth <Int32>] [-FontStrokeColor <RGBColors>] [-FontAlign <String>] [-FontMulti <String>]
 [-FontVAdjust <Int32>] [-Size <Int32>] [-WidthConstraint <Boolean>] [-X <Int32>] [-Y <Int32>] [-IconAsImage]
 [-IconColor <RGBColors>] [-IconBrands <String>] [<CommonParameters>]
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

### -ColorBackground
{{ Fill ColorBackground Description }}

```yaml
Type: RGBColors
Parameter Sets: Shape, Image
Aliases:
Accepted values: None, Black, Navy, DarkBlue, MediumBlue, Blue, DarkGreen, Green, Teal, DarkCyan, DeepSkyBlue, DarkTurquoise, MediumSpringGreen, Lime, SpringGreen, Aqua, Cyan, MidnightBlue, DodgerBlue, LightSeaGreen, ForestGreen, SeaGreen, DarkSlateGray, DarkSlateGrey, LimeGreen, MediumSeaGreen, Turquoise, RoyalBlue, SteelBlue, DarkSlateBlue, MediumTurquoise, Indigo, DarkOliveGreen, CadetBlue, CornflowerBlue, MediumAquamarine, DimGray, DimGrey, SlateBlue, OliveDrab, SlateGray, SlateGrey, LightSlateGray, LightSlateGrey, MediumSlateBlue, LawnGreen, Chartreuse, Aquamarine, Maroon, Purple, Olive, Grey, Gray, SkyBlue, LightSkyBlue, BlueViolet, DarkRed, DarkMagenta, SaddleBrown, DarkSeaGreen, LightGreen, MediumPurple, DarkViolet, PaleGreen, DarkOrchid, YellowGreen, Sienna, Brown, DarkGray, DarkGrey, LightBlue, GreenYellow, PaleTurquoise, LightSteelBlue, PowderBlue, FireBrick, DarkGoldenrod, MediumOrchid, RosyBrown, DarkKhaki, Silver, MediumVioletRed, IndianRed, Peru, Chocolate, Tan, LightGray, LightGrey, Thistle, Orchid, Goldenrod, PaleVioletRed, Crimson, Gainsboro, Plum, BurlyWood, LightCyan, Lavender, DarkSalmon, Violet, PaleGoldenrod, LightCoral, Khaki, AliceBlue, Honeydew, Azure, SandyBrown, Wheat, Beige, WhiteSmoke, MintCream, GhostWhite, Salmon, AntiqueWhite, Linen, LightGoldenrodYellow, OldLace, Red, Fuchsia, Magenta, DeepPink, OrangeRed, Tomato, HotPink, Coral, DarkOrange, LightSalmon, Orange, LightPink, Pink, Gold, PeachPuff, NavajoWhite, Moccasin, Bisque, MistyRose, BlanchedAlmond, PapayaWhip, LavenderBlush, Seashell, Cornsilk, LemonChiffon, FloralWhite, Snow, Yellow, LightYellow, Ivory, White

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ColorBorder
{{ Fill ColorBorder Description }}

```yaml
Type: RGBColors
Parameter Sets: Shape, Image
Aliases:
Accepted values: None, Black, Navy, DarkBlue, MediumBlue, Blue, DarkGreen, Green, Teal, DarkCyan, DeepSkyBlue, DarkTurquoise, MediumSpringGreen, Lime, SpringGreen, Aqua, Cyan, MidnightBlue, DodgerBlue, LightSeaGreen, ForestGreen, SeaGreen, DarkSlateGray, DarkSlateGrey, LimeGreen, MediumSeaGreen, Turquoise, RoyalBlue, SteelBlue, DarkSlateBlue, MediumTurquoise, Indigo, DarkOliveGreen, CadetBlue, CornflowerBlue, MediumAquamarine, DimGray, DimGrey, SlateBlue, OliveDrab, SlateGray, SlateGrey, LightSlateGray, LightSlateGrey, MediumSlateBlue, LawnGreen, Chartreuse, Aquamarine, Maroon, Purple, Olive, Grey, Gray, SkyBlue, LightSkyBlue, BlueViolet, DarkRed, DarkMagenta, SaddleBrown, DarkSeaGreen, LightGreen, MediumPurple, DarkViolet, PaleGreen, DarkOrchid, YellowGreen, Sienna, Brown, DarkGray, DarkGrey, LightBlue, GreenYellow, PaleTurquoise, LightSteelBlue, PowderBlue, FireBrick, DarkGoldenrod, MediumOrchid, RosyBrown, DarkKhaki, Silver, MediumVioletRed, IndianRed, Peru, Chocolate, Tan, LightGray, LightGrey, Thistle, Orchid, Goldenrod, PaleVioletRed, Crimson, Gainsboro, Plum, BurlyWood, LightCyan, Lavender, DarkSalmon, Violet, PaleGoldenrod, LightCoral, Khaki, AliceBlue, Honeydew, Azure, SandyBrown, Wheat, Beige, WhiteSmoke, MintCream, GhostWhite, Salmon, AntiqueWhite, Linen, LightGoldenrodYellow, OldLace, Red, Fuchsia, Magenta, DeepPink, OrangeRed, Tomato, HotPink, Coral, DarkOrange, LightSalmon, Orange, LightPink, Pink, Gold, PeachPuff, NavajoWhite, Moccasin, Bisque, MistyRose, BlanchedAlmond, PapayaWhip, LavenderBlush, Seashell, Cornsilk, LemonChiffon, FloralWhite, Snow, Yellow, LightYellow, Ivory, White

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ColorHighlightBackground
{{ Fill ColorHighlightBackground Description }}

```yaml
Type: RGBColors
Parameter Sets: Shape, Image
Aliases:
Accepted values: None, Black, Navy, DarkBlue, MediumBlue, Blue, DarkGreen, Green, Teal, DarkCyan, DeepSkyBlue, DarkTurquoise, MediumSpringGreen, Lime, SpringGreen, Aqua, Cyan, MidnightBlue, DodgerBlue, LightSeaGreen, ForestGreen, SeaGreen, DarkSlateGray, DarkSlateGrey, LimeGreen, MediumSeaGreen, Turquoise, RoyalBlue, SteelBlue, DarkSlateBlue, MediumTurquoise, Indigo, DarkOliveGreen, CadetBlue, CornflowerBlue, MediumAquamarine, DimGray, DimGrey, SlateBlue, OliveDrab, SlateGray, SlateGrey, LightSlateGray, LightSlateGrey, MediumSlateBlue, LawnGreen, Chartreuse, Aquamarine, Maroon, Purple, Olive, Grey, Gray, SkyBlue, LightSkyBlue, BlueViolet, DarkRed, DarkMagenta, SaddleBrown, DarkSeaGreen, LightGreen, MediumPurple, DarkViolet, PaleGreen, DarkOrchid, YellowGreen, Sienna, Brown, DarkGray, DarkGrey, LightBlue, GreenYellow, PaleTurquoise, LightSteelBlue, PowderBlue, FireBrick, DarkGoldenrod, MediumOrchid, RosyBrown, DarkKhaki, Silver, MediumVioletRed, IndianRed, Peru, Chocolate, Tan, LightGray, LightGrey, Thistle, Orchid, Goldenrod, PaleVioletRed, Crimson, Gainsboro, Plum, BurlyWood, LightCyan, Lavender, DarkSalmon, Violet, PaleGoldenrod, LightCoral, Khaki, AliceBlue, Honeydew, Azure, SandyBrown, Wheat, Beige, WhiteSmoke, MintCream, GhostWhite, Salmon, AntiqueWhite, Linen, LightGoldenrodYellow, OldLace, Red, Fuchsia, Magenta, DeepPink, OrangeRed, Tomato, HotPink, Coral, DarkOrange, LightSalmon, Orange, LightPink, Pink, Gold, PeachPuff, NavajoWhite, Moccasin, Bisque, MistyRose, BlanchedAlmond, PapayaWhip, LavenderBlush, Seashell, Cornsilk, LemonChiffon, FloralWhite, Snow, Yellow, LightYellow, Ivory, White

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ColorHighlightBorder
{{ Fill ColorHighlightBorder Description }}

```yaml
Type: RGBColors
Parameter Sets: Shape, Image
Aliases:
Accepted values: None, Black, Navy, DarkBlue, MediumBlue, Blue, DarkGreen, Green, Teal, DarkCyan, DeepSkyBlue, DarkTurquoise, MediumSpringGreen, Lime, SpringGreen, Aqua, Cyan, MidnightBlue, DodgerBlue, LightSeaGreen, ForestGreen, SeaGreen, DarkSlateGray, DarkSlateGrey, LimeGreen, MediumSeaGreen, Turquoise, RoyalBlue, SteelBlue, DarkSlateBlue, MediumTurquoise, Indigo, DarkOliveGreen, CadetBlue, CornflowerBlue, MediumAquamarine, DimGray, DimGrey, SlateBlue, OliveDrab, SlateGray, SlateGrey, LightSlateGray, LightSlateGrey, MediumSlateBlue, LawnGreen, Chartreuse, Aquamarine, Maroon, Purple, Olive, Grey, Gray, SkyBlue, LightSkyBlue, BlueViolet, DarkRed, DarkMagenta, SaddleBrown, DarkSeaGreen, LightGreen, MediumPurple, DarkViolet, PaleGreen, DarkOrchid, YellowGreen, Sienna, Brown, DarkGray, DarkGrey, LightBlue, GreenYellow, PaleTurquoise, LightSteelBlue, PowderBlue, FireBrick, DarkGoldenrod, MediumOrchid, RosyBrown, DarkKhaki, Silver, MediumVioletRed, IndianRed, Peru, Chocolate, Tan, LightGray, LightGrey, Thistle, Orchid, Goldenrod, PaleVioletRed, Crimson, Gainsboro, Plum, BurlyWood, LightCyan, Lavender, DarkSalmon, Violet, PaleGoldenrod, LightCoral, Khaki, AliceBlue, Honeydew, Azure, SandyBrown, Wheat, Beige, WhiteSmoke, MintCream, GhostWhite, Salmon, AntiqueWhite, Linen, LightGoldenrodYellow, OldLace, Red, Fuchsia, Magenta, DeepPink, OrangeRed, Tomato, HotPink, Coral, DarkOrange, LightSalmon, Orange, LightPink, Pink, Gold, PeachPuff, NavajoWhite, Moccasin, Bisque, MistyRose, BlanchedAlmond, PapayaWhip, LavenderBlush, Seashell, Cornsilk, LemonChiffon, FloralWhite, Snow, Yellow, LightYellow, Ivory, White

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ColorHoverBackground
{{ Fill ColorHoverBackground Description }}

```yaml
Type: RGBColors
Parameter Sets: Shape, Image
Aliases:
Accepted values: None, Black, Navy, DarkBlue, MediumBlue, Blue, DarkGreen, Green, Teal, DarkCyan, DeepSkyBlue, DarkTurquoise, MediumSpringGreen, Lime, SpringGreen, Aqua, Cyan, MidnightBlue, DodgerBlue, LightSeaGreen, ForestGreen, SeaGreen, DarkSlateGray, DarkSlateGrey, LimeGreen, MediumSeaGreen, Turquoise, RoyalBlue, SteelBlue, DarkSlateBlue, MediumTurquoise, Indigo, DarkOliveGreen, CadetBlue, CornflowerBlue, MediumAquamarine, DimGray, DimGrey, SlateBlue, OliveDrab, SlateGray, SlateGrey, LightSlateGray, LightSlateGrey, MediumSlateBlue, LawnGreen, Chartreuse, Aquamarine, Maroon, Purple, Olive, Grey, Gray, SkyBlue, LightSkyBlue, BlueViolet, DarkRed, DarkMagenta, SaddleBrown, DarkSeaGreen, LightGreen, MediumPurple, DarkViolet, PaleGreen, DarkOrchid, YellowGreen, Sienna, Brown, DarkGray, DarkGrey, LightBlue, GreenYellow, PaleTurquoise, LightSteelBlue, PowderBlue, FireBrick, DarkGoldenrod, MediumOrchid, RosyBrown, DarkKhaki, Silver, MediumVioletRed, IndianRed, Peru, Chocolate, Tan, LightGray, LightGrey, Thistle, Orchid, Goldenrod, PaleVioletRed, Crimson, Gainsboro, Plum, BurlyWood, LightCyan, Lavender, DarkSalmon, Violet, PaleGoldenrod, LightCoral, Khaki, AliceBlue, Honeydew, Azure, SandyBrown, Wheat, Beige, WhiteSmoke, MintCream, GhostWhite, Salmon, AntiqueWhite, Linen, LightGoldenrodYellow, OldLace, Red, Fuchsia, Magenta, DeepPink, OrangeRed, Tomato, HotPink, Coral, DarkOrange, LightSalmon, Orange, LightPink, Pink, Gold, PeachPuff, NavajoWhite, Moccasin, Bisque, MistyRose, BlanchedAlmond, PapayaWhip, LavenderBlush, Seashell, Cornsilk, LemonChiffon, FloralWhite, Snow, Yellow, LightYellow, Ivory, White

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ColorHoverBorder
{{ Fill ColorHoverBorder Description }}

```yaml
Type: RGBColors
Parameter Sets: Shape, Image
Aliases:
Accepted values: None, Black, Navy, DarkBlue, MediumBlue, Blue, DarkGreen, Green, Teal, DarkCyan, DeepSkyBlue, DarkTurquoise, MediumSpringGreen, Lime, SpringGreen, Aqua, Cyan, MidnightBlue, DodgerBlue, LightSeaGreen, ForestGreen, SeaGreen, DarkSlateGray, DarkSlateGrey, LimeGreen, MediumSeaGreen, Turquoise, RoyalBlue, SteelBlue, DarkSlateBlue, MediumTurquoise, Indigo, DarkOliveGreen, CadetBlue, CornflowerBlue, MediumAquamarine, DimGray, DimGrey, SlateBlue, OliveDrab, SlateGray, SlateGrey, LightSlateGray, LightSlateGrey, MediumSlateBlue, LawnGreen, Chartreuse, Aquamarine, Maroon, Purple, Olive, Grey, Gray, SkyBlue, LightSkyBlue, BlueViolet, DarkRed, DarkMagenta, SaddleBrown, DarkSeaGreen, LightGreen, MediumPurple, DarkViolet, PaleGreen, DarkOrchid, YellowGreen, Sienna, Brown, DarkGray, DarkGrey, LightBlue, GreenYellow, PaleTurquoise, LightSteelBlue, PowderBlue, FireBrick, DarkGoldenrod, MediumOrchid, RosyBrown, DarkKhaki, Silver, MediumVioletRed, IndianRed, Peru, Chocolate, Tan, LightGray, LightGrey, Thistle, Orchid, Goldenrod, PaleVioletRed, Crimson, Gainsboro, Plum, BurlyWood, LightCyan, Lavender, DarkSalmon, Violet, PaleGoldenrod, LightCoral, Khaki, AliceBlue, Honeydew, Azure, SandyBrown, Wheat, Beige, WhiteSmoke, MintCream, GhostWhite, Salmon, AntiqueWhite, Linen, LightGoldenrodYellow, OldLace, Red, Fuchsia, Magenta, DeepPink, OrangeRed, Tomato, HotPink, Coral, DarkOrange, LightSalmon, Orange, LightPink, Pink, Gold, PeachPuff, NavajoWhite, Moccasin, Bisque, MistyRose, BlanchedAlmond, PapayaWhip, LavenderBlush, Seashell, Cornsilk, LemonChiffon, FloralWhite, Snow, Yellow, LightYellow, Ivory, White

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

### -FontAlign
{{ Fill FontAlign Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: center, left

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FontBackground
{{ Fill FontBackground Description }}

```yaml
Type: RGBColors
Parameter Sets: (All)
Aliases:
Accepted values: None, Black, Navy, DarkBlue, MediumBlue, Blue, DarkGreen, Green, Teal, DarkCyan, DeepSkyBlue, DarkTurquoise, MediumSpringGreen, Lime, SpringGreen, Aqua, Cyan, MidnightBlue, DodgerBlue, LightSeaGreen, ForestGreen, SeaGreen, DarkSlateGray, DarkSlateGrey, LimeGreen, MediumSeaGreen, Turquoise, RoyalBlue, SteelBlue, DarkSlateBlue, MediumTurquoise, Indigo, DarkOliveGreen, CadetBlue, CornflowerBlue, MediumAquamarine, DimGray, DimGrey, SlateBlue, OliveDrab, SlateGray, SlateGrey, LightSlateGray, LightSlateGrey, MediumSlateBlue, LawnGreen, Chartreuse, Aquamarine, Maroon, Purple, Olive, Grey, Gray, SkyBlue, LightSkyBlue, BlueViolet, DarkRed, DarkMagenta, SaddleBrown, DarkSeaGreen, LightGreen, MediumPurple, DarkViolet, PaleGreen, DarkOrchid, YellowGreen, Sienna, Brown, DarkGray, DarkGrey, LightBlue, GreenYellow, PaleTurquoise, LightSteelBlue, PowderBlue, FireBrick, DarkGoldenrod, MediumOrchid, RosyBrown, DarkKhaki, Silver, MediumVioletRed, IndianRed, Peru, Chocolate, Tan, LightGray, LightGrey, Thistle, Orchid, Goldenrod, PaleVioletRed, Crimson, Gainsboro, Plum, BurlyWood, LightCyan, Lavender, DarkSalmon, Violet, PaleGoldenrod, LightCoral, Khaki, AliceBlue, Honeydew, Azure, SandyBrown, Wheat, Beige, WhiteSmoke, MintCream, GhostWhite, Salmon, AntiqueWhite, Linen, LightGoldenrodYellow, OldLace, Red, Fuchsia, Magenta, DeepPink, OrangeRed, Tomato, HotPink, Coral, DarkOrange, LightSalmon, Orange, LightPink, Pink, Gold, PeachPuff, NavajoWhite, Moccasin, Bisque, MistyRose, BlanchedAlmond, PapayaWhip, LavenderBlush, Seashell, Cornsilk, LemonChiffon, FloralWhite, Snow, Yellow, LightYellow, Ivory, White

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FontColor
{{ Fill FontColor Description }}

```yaml
Type: RGBColors
Parameter Sets: (All)
Aliases:
Accepted values: None, Black, Navy, DarkBlue, MediumBlue, Blue, DarkGreen, Green, Teal, DarkCyan, DeepSkyBlue, DarkTurquoise, MediumSpringGreen, Lime, SpringGreen, Aqua, Cyan, MidnightBlue, DodgerBlue, LightSeaGreen, ForestGreen, SeaGreen, DarkSlateGray, DarkSlateGrey, LimeGreen, MediumSeaGreen, Turquoise, RoyalBlue, SteelBlue, DarkSlateBlue, MediumTurquoise, Indigo, DarkOliveGreen, CadetBlue, CornflowerBlue, MediumAquamarine, DimGray, DimGrey, SlateBlue, OliveDrab, SlateGray, SlateGrey, LightSlateGray, LightSlateGrey, MediumSlateBlue, LawnGreen, Chartreuse, Aquamarine, Maroon, Purple, Olive, Grey, Gray, SkyBlue, LightSkyBlue, BlueViolet, DarkRed, DarkMagenta, SaddleBrown, DarkSeaGreen, LightGreen, MediumPurple, DarkViolet, PaleGreen, DarkOrchid, YellowGreen, Sienna, Brown, DarkGray, DarkGrey, LightBlue, GreenYellow, PaleTurquoise, LightSteelBlue, PowderBlue, FireBrick, DarkGoldenrod, MediumOrchid, RosyBrown, DarkKhaki, Silver, MediumVioletRed, IndianRed, Peru, Chocolate, Tan, LightGray, LightGrey, Thistle, Orchid, Goldenrod, PaleVioletRed, Crimson, Gainsboro, Plum, BurlyWood, LightCyan, Lavender, DarkSalmon, Violet, PaleGoldenrod, LightCoral, Khaki, AliceBlue, Honeydew, Azure, SandyBrown, Wheat, Beige, WhiteSmoke, MintCream, GhostWhite, Salmon, AntiqueWhite, Linen, LightGoldenrodYellow, OldLace, Red, Fuchsia, Magenta, DeepPink, OrangeRed, Tomato, HotPink, Coral, DarkOrange, LightSalmon, Orange, LightPink, Pink, Gold, PeachPuff, NavajoWhite, Moccasin, Bisque, MistyRose, BlanchedAlmond, PapayaWhip, LavenderBlush, Seashell, Cornsilk, LemonChiffon, FloralWhite, Snow, Yellow, LightYellow, Ivory, White

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
Accepted values: false, true, markdown, html

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

### -FontStrokeColor
{{ Fill FontStrokeColor Description }}

```yaml
Type: RGBColors
Parameter Sets: (All)
Aliases:
Accepted values: None, Black, Navy, DarkBlue, MediumBlue, Blue, DarkGreen, Green, Teal, DarkCyan, DeepSkyBlue, DarkTurquoise, MediumSpringGreen, Lime, SpringGreen, Aqua, Cyan, MidnightBlue, DodgerBlue, LightSeaGreen, ForestGreen, SeaGreen, DarkSlateGray, DarkSlateGrey, LimeGreen, MediumSeaGreen, Turquoise, RoyalBlue, SteelBlue, DarkSlateBlue, MediumTurquoise, Indigo, DarkOliveGreen, CadetBlue, CornflowerBlue, MediumAquamarine, DimGray, DimGrey, SlateBlue, OliveDrab, SlateGray, SlateGrey, LightSlateGray, LightSlateGrey, MediumSlateBlue, LawnGreen, Chartreuse, Aquamarine, Maroon, Purple, Olive, Grey, Gray, SkyBlue, LightSkyBlue, BlueViolet, DarkRed, DarkMagenta, SaddleBrown, DarkSeaGreen, LightGreen, MediumPurple, DarkViolet, PaleGreen, DarkOrchid, YellowGreen, Sienna, Brown, DarkGray, DarkGrey, LightBlue, GreenYellow, PaleTurquoise, LightSteelBlue, PowderBlue, FireBrick, DarkGoldenrod, MediumOrchid, RosyBrown, DarkKhaki, Silver, MediumVioletRed, IndianRed, Peru, Chocolate, Tan, LightGray, LightGrey, Thistle, Orchid, Goldenrod, PaleVioletRed, Crimson, Gainsboro, Plum, BurlyWood, LightCyan, Lavender, DarkSalmon, Violet, PaleGoldenrod, LightCoral, Khaki, AliceBlue, Honeydew, Azure, SandyBrown, Wheat, Beige, WhiteSmoke, MintCream, GhostWhite, Salmon, AntiqueWhite, Linen, LightGoldenrodYellow, OldLace, Red, Fuchsia, Magenta, DeepPink, OrangeRed, Tomato, HotPink, Coral, DarkOrange, LightSalmon, Orange, LightPink, Pink, Gold, PeachPuff, NavajoWhite, Moccasin, Bisque, MistyRose, BlanchedAlmond, PapayaWhip, LavenderBlush, Seashell, Cornsilk, LemonChiffon, FloralWhite, Snow, Yellow, LightYellow, Ivory, White

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

### -IconColor
{{ Fill IconColor Description }}

```yaml
Type: RGBColors
Parameter Sets: FontAwesomeSolid, FontAwesomeRegular, FontAwesomeBrands
Aliases:
Accepted values: None, Black, Navy, DarkBlue, MediumBlue, Blue, DarkGreen, Green, Teal, DarkCyan, DeepSkyBlue, DarkTurquoise, MediumSpringGreen, Lime, SpringGreen, Aqua, Cyan, MidnightBlue, DodgerBlue, LightSeaGreen, ForestGreen, SeaGreen, DarkSlateGray, DarkSlateGrey, LimeGreen, MediumSeaGreen, Turquoise, RoyalBlue, SteelBlue, DarkSlateBlue, MediumTurquoise, Indigo, DarkOliveGreen, CadetBlue, CornflowerBlue, MediumAquamarine, DimGray, DimGrey, SlateBlue, OliveDrab, SlateGray, SlateGrey, LightSlateGray, LightSlateGrey, MediumSlateBlue, LawnGreen, Chartreuse, Aquamarine, Maroon, Purple, Olive, Grey, Gray, SkyBlue, LightSkyBlue, BlueViolet, DarkRed, DarkMagenta, SaddleBrown, DarkSeaGreen, LightGreen, MediumPurple, DarkViolet, PaleGreen, DarkOrchid, YellowGreen, Sienna, Brown, DarkGray, DarkGrey, LightBlue, GreenYellow, PaleTurquoise, LightSteelBlue, PowderBlue, FireBrick, DarkGoldenrod, MediumOrchid, RosyBrown, DarkKhaki, Silver, MediumVioletRed, IndianRed, Peru, Chocolate, Tan, LightGray, LightGrey, Thistle, Orchid, Goldenrod, PaleVioletRed, Crimson, Gainsboro, Plum, BurlyWood, LightCyan, Lavender, DarkSalmon, Violet, PaleGoldenrod, LightCoral, Khaki, AliceBlue, Honeydew, Azure, SandyBrown, Wheat, Beige, WhiteSmoke, MintCream, GhostWhite, Salmon, AntiqueWhite, Linen, LightGoldenrodYellow, OldLace, Red, Fuchsia, Magenta, DeepPink, OrangeRed, Tomato, HotPink, Coral, DarkOrange, LightSalmon, Orange, LightPink, Pink, Gold, PeachPuff, NavajoWhite, Moccasin, Bisque, MistyRose, BlanchedAlmond, PapayaWhip, LavenderBlush, Seashell, Cornsilk, LemonChiffon, FloralWhite, Snow, Yellow, LightYellow, Ivory, White

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

### -ImageType
{{ Fill ImageType Description }}

```yaml
Type: String
Parameter Sets: Image
Aliases:
Accepted values: squareImage, circularImage

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

### -Shape
{{ Fill Shape Description }}

```yaml
Type: String
Parameter Sets: Shape
Aliases:
Accepted values: circle, dot, diamond, ellipse, database, box, square, triangle, triangleDown, text, star, hexagon

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

### -WidthConstraint
{{ Fill WidthConstraint Description }}

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
