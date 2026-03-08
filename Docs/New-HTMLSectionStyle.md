---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLSectionStyle
## SYNOPSIS
Creates a new HTML section style with customizable options.

## SYNTAX
### Manual
```powershell
New-HTMLSectionStyle [-BorderRadius <string>] [-RemoveShadow] [-HeaderTextColor <string>] [-HeaderTextAlignment <string>] [-HeaderBackGroundColor <string>] [-HeaderRemovePadding] [-Wrap <string>] [-Direction <string>] [-Align <string>] [-AlignItems <string>] [-Justify <string>] [-Rotate <string>] [-BackgroundColorContent <string>] [-WrapContent <string>] [-DirectionContent <string>] [-AlignContent <string>] [-AlignItemsContent <string>] [-JustifyContent <string>] [-WritingMode <string>] [-TextOrientation <string>] [-RequestConfiguration] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new HTML section style with various styling options such as border radius, text color, alignment, background color, and more.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLSectionStyle -BorderRadius '10px' -HeaderTextColor 'blue' -HeaderTextAlignment 'center' -HeaderBackGroundColor 'lightgray' -Wrap 'wrap' -Direction 'row' -Align 'center' -AlignItems 'flex-start' -Justify 'space-between' -Rotate '90deg' -BackgroundColorContent 'white' -WrapContent 'wrap' -DirectionContent 'column' -AlignContent 'flex-end' -AlignItemsContent 'center' -JustifyContent 'flex-start' -WritingMode 'horizontal-tb' -TextOrientation 'upright' -RequestConfiguration
Creates a new HTML section style with specified options.
```

## PARAMETERS

### -Align
Specifies the alignment of the section.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: flex-start, flex-end, center, space-between, space-around, stretch

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -AlignContent
Specifies the alignment of the section content.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: flex-start, flex-end, center, space-between, space-around, stretch

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -AlignItems
Specifies the alignment of the items within the section.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: stretch, flex-start, flex-end, center, baseline

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -AlignItemsContent
Specifies the alignment of the items within the section content.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: stretch, flex-start, flex-end, center, baseline

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BackgroundColorContent
Specifies the background color of the section content.

```yaml
Type: String
Parameter Sets: Manual
Aliases: BackgroundShade
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderRadius
Specifies the border radius of the section.

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

### -Direction
Specifies the direction of the section layout.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: row, row-reverse, column, column-reverse

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -DirectionContent
Specifies the direction of the section content layout.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: row, row-reverse, column, column-reverse

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HeaderBackGroundColor
Specifies the background color of the section header.

```yaml
Type: String
Parameter Sets: Manual
Aliases: TextBackGroundColor
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HeaderRemovePadding
{{ Fill HeaderRemovePadding Description }}

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

### -HeaderTextAlignment
Specifies the text alignment of the section header.

```yaml
Type: String
Parameter Sets: Manual
Aliases: TextAlignment
Possible values: center, left, right, justify

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HeaderTextColor
Specifies the text color of the section header.

```yaml
Type: String
Parameter Sets: Manual
Aliases: TextColor
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Justify
Specifies the justification of the section.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: flex-start, flex-end, center

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -JustifyContent
Specifies the justification of the section content.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: flex-start, flex-end, center

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -RemoveShadow
{{ Fill RemoveShadow Description }}

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

### -RequestConfiguration
Indicates whether to request configuration for the section styling.

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

### -Rotate
Specifies the rotation angle of the section.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: -180deg, -90deg, 90deg, 180deg

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextOrientation
Specifies the text orientation of the section.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: mixed, upright

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Wrap
Specifies the wrapping behavior of the section.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: wrap, nowrap, wrap-reverse

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -WrapContent
Specifies the wrapping behavior of the section content.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: wrap, nowrap, wrap-reverse

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -WritingMode
Specifies the writing mode of the section.

```yaml
Type: String
Parameter Sets: Manual
Aliases: 
Possible values: vertical-rl, vertical-lr, horizontal-tb

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

