---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLListItem
## SYNOPSIS
Creates a new HTML list item with customizable styling options.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLListItem [[-NestedListItems] <scriptblock>] [[-Text] <string[]>] [[-Color] <string[]>] [[-BackGroundColor] <string[]>] [-FontSize <Object[]>] [-FontWeight <string[]>] [-FontStyle <string[]>] [-FontVariant <string[]>] [-FontFamily <string[]>] [-Alignment <string[]>] [-TextDecoration <string[]>] [-TextTransform <string[]>] [-Direction <string[]>] [-LineBreak] [<CommonParameters>]
```

## DESCRIPTION
The New-HTMLListItem function generates an HTML list item with various styling options such as text color, background color, font size, font weight, alignment, and more.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLListItem -Text 'Item 1' -Color 'blue' -FontSize '12px' -FontWeight 'bold' -Alignment 'center'
Creates an HTML list item with the text 'Item 1' in blue color, font size of 12 pixels, bold font weight, and centered alignment.
```

### EXAMPLE 2
```powershell
New-HTMLListItem -Text 'Item 2' -FontFamily 'Arial' -TextDecoration 'underline' -Direction 'rtl'
Creates an HTML list item with the text 'Item 2' in Arial font family, underlined text decoration, and right-to-left direction.
```

## PARAMETERS

### -Alignment
Specifies the alignment of the text within the list item. Valid values are 'left', 'center', 'right', and 'justify'.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: left, center, right, justify

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -BackGroundColor
Specifies the background color of the list item.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -Color
Specifies the color of the text in the list item.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -Direction
Specifies the direction of the text. Valid value is 'rtl' (right-to-left).

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: rtl

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontFamily
Specifies the font family for the text in the list item.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontSize
Specifies the font size of the text in the list item.

```yaml
Type: Object[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontStyle
Specifies the style of the font. Valid values are 'normal', 'italic', and 'oblique'.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, italic, oblique

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontVariant
Specifies the variant of the font. Valid values are 'normal' and 'small-caps'.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, small-caps

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontWeight
Specifies the weight of the font. Valid values include 'normal', 'bold', 'bolder', 'lighter', and numeric values from 100 to 900.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, bold, bolder, lighter, 100, 200, 300, 400, 500, 600, 700, 800, 900

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -LineBreak
Indicates whether to include a line break after the list item.

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

### -NestedListItems
Specifies the nested list items to be included within the current list item.

```yaml
Type: ScriptBlock
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Text
Specifies the text content of the list item.

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

### -TextDecoration
Specifies the decoration of the text. Valid values are 'none', 'line-through', 'overline', and 'underline'.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: none, line-through, overline, underline

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextTransform
Specifies the transformation of the text. Valid values are 'uppercase', 'lowercase', and 'capitalize'.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: uppercase, lowercase, capitalize

Required: False
Position: named
Default value: @()
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

