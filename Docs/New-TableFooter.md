---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-TableFooter
## SYNOPSIS
Creates a static table footer row.

## SYNTAX
### __AllParameterSets
```powershell
New-TableFooter [[-Values] <Object[]>] [[-ValueByColumn] <IDictionary>] [[-Color] <string>] [[-BackGroundColor] <string>] [[-FontSize] <Object>] [[-FontWeight] <string>] [[-FontStyle] <string>] [[-FontVariant] <string>] [[-FontFamily] <string>] [[-Alignment] <string>] [[-TextDecoration] <string>] [[-TextTransform] <string>] [[-Direction] <string>] [[-VerticalAlignment] <string>] [[-BorderStyle] <string>] [[-BorderWidth] <Object>] [[-BorderColor] <string>] [<CommonParameters>]
```

## DESCRIPTION
Creates a footer row for New-HTMLTable. Use Values when the footer follows the rendered column order, or ValueByColumn when footer values should be assigned by column name.

## EXAMPLES

### EXAMPLE 1
```powershell
PS > New-HTMLTable -DataTable $Data {
    New-TableFooter -ValueByColumn @{ Name = 'Total'; Amount = 42 } -FontWeight bold
}
```


## PARAMETERS

### -Alignment
Provide new text alignment.

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
Pick one of the 800 colors or provide a hex color code.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases:
Possible values:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderColor
{{ Fill BorderColor Description }}

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases:
Possible values:

Required: False
Position: 16
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderStyle
{{ Fill BorderStyle Description }}

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases:
Possible values: none, hidden, dotted, dashed, solid, double, groove, ridge, inset, outset

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BorderWidth
{{ Fill BorderWidth Description }}

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases:
Possible values:

Required: False
Position: 15
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Color
Pick one of the 800 colors or provide a hex color code.

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

### -Direction
{{ Fill Direction Description }}

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases:
Possible values: rtl, ltr

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontFamily
{{ Fill FontFamily Description }}

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
Provide new font size.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases:
Possible values:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontStyle
{{ Fill FontStyle Description }}

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
{{ Fill FontVariant Description }}

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
Provide new font weight.

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

### -TextDecoration
{{ Fill TextDecoration Description }}

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
{{ Fill TextTransform Description }}

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

### -ValueByColumn
Footer cell values keyed by rendered column name.

```yaml
Type: IDictionary
Parameter Sets: __AllParameterSets
Aliases:
Possible values:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Values
Footer cell values in rendered column order.

```yaml
Type: Object[]
Parameter Sets: __AllParameterSets
Aliases:
Possible values:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -VerticalAlignment
{{ Fill VerticalAlignment Description }}

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases:
Possible values: baseline, sub, super, text-top, text-bottom, middle, top, bottom

Required: False
Position: 13
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
