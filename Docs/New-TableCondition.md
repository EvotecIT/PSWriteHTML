---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-TableCondition
## SYNOPSIS
Creates a new table condition with specified parameters and styling options for pass and fail conditions.

## SYNTAX
### __AllParameterSets
```powershell
New-TableCondition [-Name] <string> [[-HighlightHeaders] <string[]>] [[-ComparisonType] <string>] [[-Operator] <string>] [[-Value] <Object>] [[-DateTimeFormat] <string>] [[-ChildRowFill] <string>] [[-Color] <string>] [[-BackgroundColor] <string>] [[-FontSize] <Object>] [[-FontWeight] <string>] [[-FontStyle] <string>] [[-FontVariant] <string>] [[-FontFamily] <string>] [[-Alignment] <string>] [[-TextDecoration] <string>] [[-TextTransform] <string>] [[-Direction] <string>] [[-FailColor] <string>] [[-FailBackgroundColor] <string>] [[-FailFontSize] <Object>] [[-FailFontWeight] <string>] [[-FailFontStyle] <string>] [[-FailFontVariant] <string>] [[-FailFontFamily] <string>] [[-FailAlignment] <string>] [[-FailTextDecoration] <string>] [[-FailTextTransform] <string>] [[-FailDirection] <string>] [-Row] [-Inline] [-CaseSensitive] [-ReverseCondition] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new table condition with the specified parameters and allows customization of the styling options for both pass and fail conditions.

## EXAMPLES

### EXAMPLE 1
```powershell
New-TableCondition -Name 'Policies_Go' -ComparisonType number -Operator le -Value 0.2 -Color SeaGreen -FailColor FireBrick
```

Uses a PowerShell numeric literal with a dot decimal separator.

### EXAMPLE 2
```powershell
New-TableCondition -Name 'Policies_Go' -ComparisonType number -Operator le -Value '0,2' -Color SeaGreen -FailColor FireBrick
```

Uses a quoted locale-formatted decimal string. Avoid bare -Value 0,2 because PowerShell treats it as an array.

## PARAMETERS

### -Alignment
Specifies the alignment for pass conditions.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: left, center, right, justify

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BackgroundColor
Specifies the background color for pass conditions.

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

### -CaseSensitive
Switch parameter to indicate if the comparison should be case-sensitive.

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

### -ChildRowFill
Child row fill for responsive lists

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: Parent, Both

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Color
Specifies the text color for pass conditions.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ComparisonType
Specifies the type of comparison to be performed. Valid values are 'number', 'string', 'bool', or 'date'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: Type
Possible values: number, string, bool, date

Required: False
Position: 2
Default value: string
Accept pipeline input: False
Accept wildcard characters: True
```

### -DateTimeFormat
Specifies the format for date and time comparisons.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Direction
Specifies the text direction for pass conditions.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: rtl

Required: False
Position: 17
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FailAlignment
Specifies the alignment for fail conditions.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: left, center, right, justify

Required: False
Position: 25
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FailBackgroundColor
Specifies the background color for fail conditions.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 19
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FailColor
Specifies the text color for fail conditions.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 18
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FailDirection
Specifies the text direction for fail conditions.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: rtl

Required: False
Position: 28
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FailFontFamily
Specifies the font family for fail conditions.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 24
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FailFontSize
Specifies the font size for fail conditions.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 20
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FailFontStyle
Specifies the font style for fail conditions.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, italic, oblique

Required: False
Position: 22
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FailFontVariant
Specifies the font variant for fail conditions.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, small-caps

Required: False
Position: 23
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FailFontWeight
Specifies the font weight for fail conditions.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, bold, bolder, lighter, 100, 200, 300, 400, 500, 600, 700, 800, 900

Required: False
Position: 21
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FailTextDecoration
Specifies the text decoration for fail conditions.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: none, line-through, overline, underline

Required: False
Position: 26
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FailTextTransform
Specifies the text transformation for fail conditions.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: uppercase, lowercase, capitalize

Required: False
Position: 27
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontFamily
Specifies the font family for pass conditions.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 13
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontSize
Specifies the font size for pass conditions.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontStyle
Specifies the font style for pass conditions.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, italic, oblique

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontVariant
Specifies the font variant for pass conditions.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, small-caps

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontWeight
Specifies the font weight for pass conditions.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, bold, bolder, lighter, 100, 200, 300, 400, 500, 600, 700, 800, 900

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HighlightHeaders
Specifies an array of headers to highlight based on the condition.

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

### -Inline
Switch parameter to indicate if the styling should be applied inline.

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

### -Name
Specifies the name of the condition.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: ColumnName
Possible values: 

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Operator
Specifies the comparison operator to be used.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: lt, le, eq, ge, gt, ne, contains, like, notlike, notcontains, between, betweenInclusive, in, notin

Required: False
Position: 3
Default value: eq
Accept pipeline input: False
Accept wildcard characters: True
```

### -ReverseCondition
Switch parameter to reverse the comparison logic.

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

### -Row
Switch parameter to indicate if the styling should be applied to the entire row.

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
Specifies the text decoration for pass conditions.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: none, line-through, overline, underline

Required: False
Position: 15
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextTransform
Specifies the text transformation for pass conditions.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: uppercase, lowercase, capitalize

Required: False
Position: 16
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Value
Specifies the value to compare against. In PowerShell decimal literals use a dot, for example 0.2.
If you want to pass locale-formatted text such as 0,2, quote it as a string. Bare 0,2 is parsed by
PowerShell as an array containing 0 and 2 before PSWriteHTML receives it.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

