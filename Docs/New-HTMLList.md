---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLList
## SYNOPSIS
Creates an HTML list with customizable styling options.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLList [[-ListItems] <scriptblock>] [-Type <string>] [-Color <string>] [-BackGroundColor <string>] [-FontSize <Object>] [-FontWeight <string>] [-FontStyle <string>] [-FontVariant <string>] [-FontFamily <string>] [-Alignment <string>] [-TextDecoration <string>] [-TextTransform <string>] [-Direction <string>] [-LineBreak] [-Reversed] [<CommonParameters>]
```

## DESCRIPTION
The New-HTMLList function generates an HTML list with various styling options such as color, font size, font weight, alignment, and more.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLList -ListItems { 'Item 1', 'Item 2', 'Item 3' } -Type Unordered -Color 'blue' -FontSize 12 -FontWeight 'bold' -Alignment 'center'
```

Creates an unordered HTML list with three items ('Item 1', 'Item 2', 'Item 3') displayed in blue color, font size 12, bold font weight, and centered alignment.

### EXAMPLE 2
```powershell
New-HTMLList -ListItems { 'Apple', 'Banana', 'Cherry' } -Type Ordered -FontFamily 'Arial' -TextDecoration 'underline' -Direction 'rtl'
```

Creates an ordered HTML list with three items ('Apple', 'Banana', 'Cherry') using Arial font family, underlined text decoration, and right-to-left text direction.

## PARAMETERS

### -Alignment
Specifies the alignment of the text within the list. Valid values are 'left', 'center', 'right', and 'justify'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: left, center, right, justify

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BackGroundColor
Specifies the background color of the list.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Color
Specifies the color of the text in the list.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Direction
Specifies the direction of the text. Valid value is 'rtl' (right-to-left).

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: rtl

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontFamily
Specifies the font family for the text in the list.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontSize
Specifies the font size of the text in the list.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontStyle
Specifies the style of the font. Valid values are 'normal', 'italic', and 'oblique'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, italic, oblique

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontVariant
Specifies the variant of the font. Valid values are 'normal' and 'small-caps'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, small-caps

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontWeight
Specifies the weight of the font. Valid values include 'normal', 'bold', 'bolder', 'lighter', and numeric values from 100 to 900.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, bold, bolder, lighter, 100, 200, 300, 400, 500, 600, 700, 800, 900

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -LineBreak
Indicates whether to include line breaks between list items.

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

### -ListItems
Specifies the list items to be included in the HTML list.

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

### -Reversed
Indicates whether the list should be displayed in reverse order.

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

### -TextDecoration
Specifies the decoration of the text. Valid values are 'none', 'line-through', 'overline', and 'underline'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: none, line-through, overline, underline

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextTransform
Specifies the transformation of the text. Valid values are 'uppercase', 'lowercase', and 'capitalize'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: uppercase, lowercase, capitalize

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Type
Specifies the type of list to create. Valid values are 'Unordered' (default) and 'Ordered'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: Unordered, Ordered

Required: False
Position: named
Default value: Unordered
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

