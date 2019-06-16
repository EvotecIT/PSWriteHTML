---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version:
schema: 2.0.0
---

# New-HTMLSection

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

```
New-HTMLSection [[-Content] <ScriptBlock>] [-HeaderText <String>] [-HeaderTextColor <RGBColors>]
 [-HeaderTextAlignment <String>] [-HeaderBackGroundColor <RGBColors>] [-BackgroundColor <RGBColors>]
 [-CanCollapse] [-IsHidden] [-Collapsed] [-Height <Int32>] [-Invisible] [<CommonParameters>]
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

### -BackgroundColor
{{ Fill BackgroundColor Description }}

```yaml
Type: RGBColors
Parameter Sets: (All)
Aliases: BackgroundShade
Accepted values: None, Black, Navy, DarkBlue, MediumBlue, Blue, DarkGreen, Green, Teal, DarkCyan, DeepSkyBlue, DarkTurquoise, MediumSpringGreen, Lime, SpringGreen, Aqua, Cyan, MidnightBlue, DodgerBlue, LightSeaGreen, ForestGreen, SeaGreen, DarkSlateGray, DarkSlateGrey, LimeGreen, MediumSeaGreen, Turquoise, RoyalBlue, SteelBlue, DarkSlateBlue, MediumTurquoise, Indigo, DarkOliveGreen, CadetBlue, CornflowerBlue, MediumAquamarine, DimGray, DimGrey, SlateBlue, OliveDrab, SlateGray, SlateGrey, LightSlateGray, LightSlateGrey, MediumSlateBlue, LawnGreen, Chartreuse, Aquamarine, Maroon, Purple, Olive, Grey, Gray, SkyBlue, LightSkyBlue, BlueViolet, DarkRed, DarkMagenta, SaddleBrown, DarkSeaGreen, LightGreen, MediumPurple, DarkViolet, PaleGreen, DarkOrchid, YellowGreen, Sienna, Brown, DarkGray, DarkGrey, LightBlue, GreenYellow, PaleTurquoise, LightSteelBlue, PowderBlue, FireBrick, DarkGoldenrod, MediumOrchid, RosyBrown, DarkKhaki, Silver, MediumVioletRed, IndianRed, Peru, Chocolate, Tan, LightGray, LightGrey, Thistle, Orchid, Goldenrod, PaleVioletRed, Crimson, Gainsboro, Plum, BurlyWood, LightCyan, Lavender, DarkSalmon, Violet, PaleGoldenrod, LightCoral, Khaki, AliceBlue, Honeydew, Azure, SandyBrown, Wheat, Beige, WhiteSmoke, MintCream, GhostWhite, Salmon, AntiqueWhite, Linen, LightGoldenrodYellow, OldLace, Red, Fuchsia, Magenta, DeepPink, OrangeRed, Tomato, HotPink, Coral, DarkOrange, LightSalmon, Orange, LightPink, Pink, Gold, PeachPuff, NavajoWhite, Moccasin, Bisque, MistyRose, BlanchedAlmond, PapayaWhip, LavenderBlush, Seashell, Cornsilk, LemonChiffon, FloralWhite, Snow, Yellow, LightYellow, Ivory, White

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CanCollapse
{{ Fill CanCollapse Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: Collapsable

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Collapsed
{{ Fill Collapsed Description }}

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

### -Content
{{ Fill Content Description }}

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HeaderBackGroundColor
{{ Fill HeaderBackGroundColor Description }}

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

### -HeaderText
{{ Fill HeaderText Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases: Name

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HeaderTextAlignment
{{ Fill HeaderTextAlignment Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: center, left, right, justify

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HeaderTextColor
{{ Fill HeaderTextColor Description }}

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

### -Height
{{ Fill Height Description }}

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

### -Invisible
{{ Fill Invisible Description }}

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

### -IsHidden
{{ Fill IsHidden Description }}

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
