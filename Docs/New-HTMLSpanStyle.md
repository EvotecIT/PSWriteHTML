---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLSpanStyle
## SYNOPSIS
Creates an HTML <span> element with specified styling.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLSpanStyle [[-Content] <scriptblock>] [[-Color] <string>] [[-BackGroundColor] <string>] [[-FontSize] <Object>] [[-LineHeight] <string>] [[-FontWeight] <string>] [[-FontStyle] <string>] [[-FontVariant] <string>] [[-FontFamily] <string>] [[-Alignment] <string>] [[-TextDecoration] <string>] [[-TextTransform] <string>] [[-Direction] <string>] [[-Display] <string>] [[-Opacity] <double>] [-LineBreak] [<CommonParameters>]
```

## DESCRIPTION
The New-HTMLSpanStyle function generates an HTML <span> element with customizable styling options such as color, background color, font size, font weight, font style, alignment, text decoration, text transformation, and more.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLSpanStyle -Content { "Hello, World!" } -Color 'red' -FontSize '12px' -FontWeight 'bold' -Alignment 'center'
Creates a <span> element with red text, font size of 12 pixels, bold weight, and centered alignment containing the text "Hello, World!".
```

### EXAMPLE 2
```powershell
New-HTMLSpanStyle -Content { "This is underlined text" } -Color 'blue' -TextDecoration 'underline'
Creates a <span> element with blue text and underlined decoration containing the text "This is underlined text".
```

## PARAMETERS

### -Alignment
The alignment of the text within the <span> element.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: left, center, right, justify

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BackGroundColor
The background color of the <span> element.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Color
The color of the text.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Content
The content to be placed within the <span> element.

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

### -Direction
The direction of the text.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: rtl

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Display
The display style of the <span> element.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: none, inline, block, inline-block, contents, flex, grid, inline-flex, inline-grid, inline-table, list-item, run-in, table, table-caption, table-column-group, table-header-group, table-footer-group, table-row-group, table-cell, table-column, table-row

Required: False
Position: 13
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontFamily
The font family to be used.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontSize
The font size of the text.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontStyle
The style of the font.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, italic, oblique

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontVariant
The variant of the font.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, small-caps

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontWeight
The weight of the font.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, bold, bolder, lighter, 100, 200, 300, 400, 500, 600, 700, 800, 900

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -LineBreak
Indicates whether to allow line breaks within the <span> element.

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

### -LineHeight
The height of each line of text.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Opacity
The opacity of the <span> element.

```yaml
Type: Double
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 14
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextDecoration
The decoration to be applied to the text.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: none, line-through, overline, underline

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextTransform
The transformation to be applied to the text.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: uppercase, lowercase, capitalize

Required: False
Position: 11
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

