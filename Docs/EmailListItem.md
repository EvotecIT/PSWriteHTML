---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# EmailListItem
## SYNOPSIS
Creates an HTML list item with customizable text styling.

## SYNTAX
### __AllParameterSets
```powershell
EmailListItem [[-Text] <string[]>] [[-Color] <string[]>] [[-BackGroundColor] <string[]>] [[-FontSize] <int[]>] [[-FontWeight] <string[]>] [[-FontStyle] <string[]>] [[-FontVariant] <string[]>] [[-FontFamily] <string[]>] [[-Alignment] <string[]>] [[-TextDecoration] <string[]>] [[-TextTransform] <string[]>] [[-Direction] <string[]>] [-LineBreak] [<CommonParameters>]
```

## DESCRIPTION
The EmailListItem function generates an HTML list item with customizable text styling options such as color, font size, font weight, font style, alignment, text decoration, text transformation, and more.

## EXAMPLES

### EXAMPLE 1
```powershell
EmailListItem -Text "Example Text" -Color "red" -FontSize 14 -FontWeight "bold" -Alignment "center"
Creates an HTML list item with the text "Example Text" in red color, font size 14, bold font weight, and centered alignment.
```

## PARAMETERS

### -Alignment
Specifies the alignment of the text. Valid values are 'left', 'center', 'right', 'justify'. Default is an empty array.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: left, center, right, justify

Required: False
Position: 8
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -BackGroundColor
Specifies the background color of the list item. Default is an empty array.

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

### -Color
Specifies the color of the text. Default is an empty array.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -Direction
Specifies the direction of the text. Valid value is 'rtl'. Default is an empty array.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: rtl

Required: False
Position: 11
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontFamily
Specifies the font family of the text. Default is an empty array.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 7
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontSize
Specifies the font size of the text. Default is an empty array.

```yaml
Type: Int32[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontStyle
Specifies the font style of the text. Valid values are 'normal', 'italic', 'oblique'. Default is an empty array.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, italic, oblique

Required: False
Position: 5
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontVariant
Specifies the font variant of the text. Valid values are 'normal', 'small-caps'. Default is an empty array.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, small-caps

Required: False
Position: 6
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontWeight
Specifies the font weight of the text. Valid values are 'normal', 'bold', 'bolder', 'lighter', and numeric values from 100 to 900. Default is an empty array.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, bold, bolder, lighter, 100, 200, 300, 400, 500, 600, 700, 800, 900

Required: False
Position: 4
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -LineBreak
Indicates whether a line break should be added after the list item.

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

### -Text
Specifies the text content of the list item.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextDecoration
Specifies the text decoration of the text. Valid values are 'none', 'line-through', 'overline', 'underline'. Default is an empty array.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: none, line-through, overline, underline

Required: False
Position: 9
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextTransform
Specifies the text transformation of the text. Valid values are 'uppercase', 'lowercase', 'capitalize'. Default is an empty array.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: uppercase, lowercase, capitalize

Required: False
Position: 10
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

