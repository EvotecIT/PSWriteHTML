---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLTabStyle
## SYNOPSIS
Creates a new HTML tab style with customizable options.

## SYNTAX
### Manual (Default)
```powershell
New-HTMLTabStyle [-FontSize <string>] [-FontSizeActive <string>] [-TextColor <string>] [-TextColorActive <string>] [-FontWeight <string>] [-FontWeightActive <string>] [-FontStyle <string>] [-FontStyleActive <string>] [-FontVariant <string>] [-FontVariantActive <string>] [-FontFamily <string>] [-FontFamilyActive <string>] [-TextDecoration <string>] [-TextDecorationActive <string>] [-BackgroundColor <string>] [-BackgroundColorActive <string>] [-BackgroundColorActiveTarget <string>] [-BorderRadius <string>] [-TextTransform <string>] [-TextTransformActive <string>] [-SlimTabs] [-Transition] [-LinearGradient] [-RemoveShadow] [-BorderStyle <string>] [-BorderColor <string>] [-BorderBottomWidth <string>] [-BorderBottomStyle <string>] [-BorderBottomColor <string>] [-BorderBottomWidthActive <string>] [-BorderBottomStyleActive <string>] [-BorderBottomColorActive <string>] [-Align <string>] [-Wrap <string>] [-Direction <string>] [-AlignContent <string>] [-AlignItems <string>] [-JustifyContent <string>] [-RowElements <int>] [<CommonParameters>]
```

### Styled
```powershell
New-HTMLTabStyle [-Style <string>] [-Align <string>] [-Wrap <string>] [-Direction <string>] [-AlignContent <string>] [-AlignItems <string>] [-JustifyContent <string>] [-RowElements <int>] [<CommonParameters>]
```

## DESCRIPTION
This function allows you to define various styling options for HTML tabs, such as font size, color, weight, style, background color, border properties, and more.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLTabStyle -FontSize "14px" -FontSizeActive "16px" -TextColor "black" -TextColorActive "blue" -FontWeight "normal" -FontWeightActive "bold" -FontStyle "normal" -FontStyleActive "italic" -FontVariant "normal" -FontVariantActive "small-caps" -FontFamily "Arial" -FontFamilyActive "Verdana" -TextDecoration "none" -TextDecorationActive "underline" -BackgroundColor "#f0f0f0" -BackgroundColorActive "#e0e0e0" -BackgroundColorActiveTarget "#d0d0d0" -BorderRadius "5px" -TextTransform "uppercase" -TextTransformActive "lowercase" -SlimTabs -Transition -LinearGradient -RemoveShadow -BorderStyle "solid" -BorderColor "gray" -BorderBottomWidth "1px" -BorderBottomStyle "solid" -BorderBottomColor "gray" -BorderBottomWidthActive "2px" -BorderBottomStyleActive "dashed" -BorderBottomColorActive "blue" -Style "custom" -Align "center" -Wrap "wrap" -Direction "row"
Creates a new HTML tab style with specified options.
```

### EXAMPLE 2
```powershell
New-HTMLTabStyle -FontSize "12px" -FontSizeActive "14px" -TextColor "gray" -TextColorActive "black" -FontWeight "bold" -FontWeightActive "bolder" -FontStyle "italic" -FontStyleActive "oblique" -FontVariant "small-caps" -FontVariantActive "normal" -FontFamily "Verdana" -FontFamilyActive "Arial" -TextDecoration "underline" -TextDecorationActive "none" -BackgroundColor "#e0e0e0" -BackgroundColorActive "#f0f0f0" -BackgroundColorActiveTarget "#d0d0d0" -BorderRadius "10px" -TextTransform "capitalize" -TextTransformActive "uppercase" -SlimTabs -Transition -LinearGradient -RemoveShadow -BorderStyle "dotted" -BorderColor "black" -BorderBottomWidth "2px" -BorderBottomStyle "dashed" -BorderBottomColor "blue" -BorderBottomWidthActive "1px" -BorderBottomStyleActive "solid" -BorderBottomColorActive "gray" -Style "default" -Align "left" -Wrap "nowrap" -Direction "column"
Creates another HTML tab style with different options.
```

## PARAMETERS

### -Align
Specifies the alignment of the tabs.

```yaml
Type: String
Parameter Sets: Manual, Styled
Aliases: AlignTabs
Possible values: left, right, center, justify

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -AlignContent
{{ Fill AlignContent Description }}

```yaml
Type: String
Parameter Sets: Manual, Styled
Aliases: 
Possible values: flex-start, flex-end, center, space-between, space-around, stretch

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -AlignItems
{{ Fill AlignItems Description }}

```yaml
Type: String
Parameter Sets: Manual, Styled
Aliases: 
Possible values: stretch, flex-start, flex-end, center, baseline

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BackgroundColor
Specifies the background color for the tabs.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BackgroundColorActive
Specifies the background color for the active tab.

```yaml
Type: String
Parameter Sets: Manual
Aliases: SelectorColor
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BackgroundColorActiveTarget
Specifies the background color for the active tab target.

```yaml
Type: String
Parameter Sets: Manual
Aliases: SelectorColorTarget
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderBottomColor
Specifies the bottom border color for the tabs.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderBottomColorActive
Specifies the bottom border color for the active tab.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderBottomStyle
Specifies the bottom border style for the tabs.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: none, hidden, dotted, dashed, solid, double, groove, ridge, inset, outset

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderBottomStyleActive
Specifies the bottom border style for the active tab.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: none, hidden, dotted, dashed, solid, double, groove, ridge, inset, outset

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderBottomWidth
Specifies the bottom border width for the tabs.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: medium, thin, thick

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderBottomWidthActive
Specifies the bottom border width for the active tab.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: medium, thin, thick

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderColor
Specifies the border color for the tabs.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderRadius
Specifies the border radius for the tabs.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: 0px, 5px, 10px, 15px, 20px, 25px

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderStyle
Specifies the border style for the tabs.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: none, hidden, dotted, dashed, solid, double, groove, ridge, inset, outset

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Direction
Specifies the direction of the tabs.

```yaml
Type: String
Parameter Sets: Manual, Styled
Aliases: 
Possible values: row, row-reverse, column, column-reverse

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontFamily
Specifies the font family for the tabs.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontFamilyActive
Specifies the font family for the active tab.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontSize
Specifies the font size for the tabs.

```yaml
Type: String
Parameter Sets: Manual
Aliases: TextSize
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontSizeActive
Specifies the font size for the active tab.

```yaml
Type: String
Parameter Sets: Manual
Aliases: TextSizeActive
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontStyle
Specifies the font style for the tabs.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: normal, italic, oblique

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontStyleActive
Specifies the font style for the active tab.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: normal, italic, oblique

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontVariant
Specifies the font variant for the tabs.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: normal, small-caps

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontVariantActive
Specifies the font variant for the active tab.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: normal, small-caps

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontWeight
Specifies the font weight for the tabs.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: normal, bold, bolder, lighter, 100, 200, 300, 400, 500, 600, 700, 800, 900

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontWeightActive
Specifies the font weight for the active tab.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: normal, bold, bolder, lighter, 100, 200, 300, 400, 500, 600, 700, 800, 900

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -JustifyContent
{{ Fill JustifyContent Description }}

```yaml
Type: String
Parameter Sets: Manual, Styled
Aliases: 
Possible values: flex-start, flex-end, center

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -LinearGradient
Indicates whether to use linear gradients.

```yaml
Type: SwitchParameter
Parameter Sets: Manual
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -RemoveShadow
Indicates whether to remove shadows.

```yaml
Type: SwitchParameter
Parameter Sets: Manual
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -RowElements
{{ Fill RowElements Description }}

```yaml
Type: Int32
Parameter Sets: Manual, Styled
Aliases: 
Possible values: 

Required: False
Position: named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -SlimTabs
Indicates whether to use slim tabs.

```yaml
Type: SwitchParameter
Parameter Sets: Manual
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -Style
Specifies a custom style for the tabs.

```yaml
Type: String
Parameter Sets: Styled
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextColor
Specifies the text color for the tabs.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextColorActive
Specifies the text color for the active tab.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextDecoration
Specifies the text decoration for the tabs.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: none, line-through, overline, underline

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextDecorationActive
Specifies the text decoration for the active tab.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: none, line-through, overline, underline

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextTransform
Specifies the text transformation for the tabs.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: uppercase, lowercase, capitalize

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextTransformActive
Specifies the text transformation for the active tab.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: uppercase, lowercase, capitalize

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Transition
Indicates whether to apply transitions.

```yaml
Type: SwitchParameter
Parameter Sets: Manual
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -Wrap
Specifies the wrapping behavior of the tabs.

```yaml
Type: String
Parameter Sets: Manual, Styled
Aliases: 
Possible values: wrap, nowrap, wrap-reverse

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

