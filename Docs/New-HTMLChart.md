---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version:
schema: 2.0.0
---

# New-HTMLChart

## SYNOPSIS
{{Fill in the Synopsis}}

## SYNTAX

```
New-HTMLChart [[-ChartSettings] <ScriptBlock>] [[-Title] <String>] [[-TitleAlignment] <String>]
 [[-TitleMargin] <Int32>] [[-TitleOffsetX] <Int32>] [[-TitleOffsetY] <Int32>] [[-TitleFloating] <Int32>]
 [[-TitleFontSize] <Object>] [[-TitleFontWeight] <String>] [[-TitleFontFamily] <String>]
 [[-TitleColor] <String>] [[-SubTitle] <String>] [[-SubTitleAlignment] <String>] [[-SubTitleMargin] <Int32>]
 [[-SubTitleOffsetX] <Int32>] [[-SubTitleOffsetY] <Int32>] [[-SubTitleFloating] <Int32>]
 [[-SubTitleFontSize] <Object>] [[-SubTitleFontWeight] <String>] [[-SubTitleFontFamily] <String>]
 [[-SubTitleColor] <String>] [[-Height] <Object>] [[-Width] <Object>] [-Gradient] [-Patterned] [[-Id] <String>]
 [[-Group] <String>] [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -ChartSettings
{{ Fill ChartSettings Description }}

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

### -Gradient
{{ Fill Gradient Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: GradientColors

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Group
{{ Fill Group Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 24
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Height
{{Fill Height Description}}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 21
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id
{{ Fill Id Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 23
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Patterned
{{ Fill Patterned Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: PatternedColors

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SubTitle
{{ Fill SubTitle Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SubTitleAlignment
{{ Fill SubTitleAlignment Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: center, left, right

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SubTitleColor
{{ Fill SubTitleColor Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 20
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SubTitleFloating
{{ Fill SubTitleFloating Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 16
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SubTitleFontFamily
{{ Fill SubTitleFontFamily Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 19
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SubTitleFontSize
{{ Fill SubTitleFontSize Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 17
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SubTitleFontWeight
{{ Fill SubTitleFontWeight Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: normal, bold, bolder, lighter, 100, 200, 300, 400, 500, 600, 700, 800, 900

Required: False
Position: 18
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SubTitleMargin
{{ Fill SubTitleMargin Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SubTitleOffsetX
{{ Fill SubTitleOffsetX Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SubTitleOffsetY
{{ Fill SubTitleOffsetY Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 15
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Title
{{ Fill Title Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TitleAlignment
{{Fill TitleAlignment Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: center, left, right

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TitleColor
{{ Fill TitleColor Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TitleFloating
{{ Fill TitleFloating Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TitleFontFamily
{{ Fill TitleFontFamily Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TitleFontSize
{{ Fill TitleFontSize Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TitleFontWeight
{{ Fill TitleFontWeight Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: normal, bold, bolder, lighter, 100, 200, 300, 400, 500, 600, 700, 800, 900

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TitleMargin
{{ Fill TitleMargin Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TitleOffsetX
{{ Fill TitleOffsetX Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TitleOffsetY
{{ Fill TitleOffsetY Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Width
{{Fill Width Description}}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 22
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
