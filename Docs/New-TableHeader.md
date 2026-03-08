---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-TableHeader
## SYNOPSIS
Creates a new table header with specified styling options.

## SYNTAX
### __AllParameterSets
```powershell
New-TableHeader [[-Names] <string[]>] [[-Title] <string>] [[-Color] <string>] [[-BackGroundColor] <string>] [[-FontSize] <Object>] [[-FontWeight] <string>] [[-FontStyle] <string>] [[-FontVariant] <string>] [[-FontFamily] <string>] [[-Alignment] <string>] [[-TextDecoration] <string>] [[-TextTransform] <string>] [[-Direction] <string>] [[-ColumnCount] <int>] [[-ResponsiveOperations] <string>] [-AddRow] [<CommonParameters>]
```

## DESCRIPTION
The New-TableHeader function creates a new table header with customizable styling options such as font size, color, alignment, and more.

## EXAMPLES

### EXAMPLE 1
```powershell
New-TableHeader -Names "Name", "Age", "Email" -Title "Employee Information" -Color "black" -BackGroundColor "lightgray" -FontSize 14 -FontWeight "bold" -FontStyle "normal" -FontVariant "normal" -FontFamily "Arial" -Alignment "center" -TextDecoration "none" -TextTransform "uppercase" -Direction "ltr" -AddRow -ColumnCount 3 -Display "all"
Creates a table header with specified column names, title, and styling options.
```

## PARAMETERS

### -AddRow
Switch parameter to add an additional row to the table header.

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

### -Alignment
Specifies the alignment of the table header.

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
Specifies the background color of the table header.

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

### -Color
Specifies the text color of the table header.

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

### -ColumnCount
Specifies the number of columns in the table header.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 13
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -Direction
Specifies the text direction of the table header.

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

### -FontFamily
Specifies the font family of the table header.

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
Specifies the font size of the table header.

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
Specifies the font style of the table header.

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
Specifies the font variant of the table header.

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
Specifies the font weight of the table header.

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

### -Names
Specifies an array of column names for the table header.

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

### -ResponsiveOperations
{{ Fill ResponsiveOperations Description }}

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: all, none, never, desktop, not-desktop, tablet-l, tablet-p, mobile-l, mobile-p, min-desktop, max-desktop, tablet, not-tablet, min-tablet, max-tablet, not-tablet-l, min-tablet-l, max-tablet-l, not-tablet-p, min-tablet-p, max-tablet-p, mobile, not-mobile, min-mobile, max-mobile, not-mobile-l, min-mobile-l, max-mobile-l, not-mobile-p, min-mobile-p, max-mobile-p

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextDecoration
Specifies the text decoration of the table header.

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
Specifies the text transformation of the table header.

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

### -Title
Specifies the title of the table header.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

