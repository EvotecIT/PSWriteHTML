---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLChart
## SYNOPSIS
Creates a new HTML chart with customizable settings.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLChart [[-ChartSettings] <scriptblock>] [[-Title] <string>] [[-TitleAlignment] <string>] [[-TitleMargin] <int>] [[-TitleOffsetX] <int>] [[-TitleOffsetY] <int>] [[-TitleFloating] <int>] [[-TitleFontSize] <Object>] [[-TitleFontWeight] <string>] [[-TitleFontFamily] <string>] [[-TitleColor] <string>] [[-SubTitle] <string>] [[-SubTitleAlignment] <string>] [[-SubTitleMargin] <int>] [[-SubTitleOffsetX] <int>] [[-SubTitleOffsetY] <int>] [[-SubTitleFloating] <int>] [[-SubTitleFontSize] <Object>] [[-SubTitleFontWeight] <string>] [[-SubTitleFontFamily] <string>] [[-SubTitleColor] <string>] [[-Height] <Object>] [[-Width] <Object>] [[-Id] <string>] [[-Group] <string>] [-Gradient] [-Patterned] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new HTML chart with customizable settings such as title, subtitle, dimensions, colors, and more.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLChart -Title "Sales Data" -ChartSettings {
    // Chart configuration settings here
}
```

Creates a new HTML chart with the title "Sales Data" and custom chart settings.

### EXAMPLE 2
```powershell
New-HTMLChart -Title "Sales Data" -SubTitle "Quarterly Sales" -Height 400 -Width 600 -Gradient -Id "SalesChart"
```

Creates a new HTML chart with the title "Sales Data", subtitle "Quarterly Sales", height of 400, width of 600, gradient colors, and specified ID.

## PARAMETERS

### -ChartSettings
Specifies the settings for the chart. This should be a ScriptBlock containing the chart configuration.

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

### -Gradient
Indicates whether to use gradient colors in the chart.

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: GradientColors
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -Group
Specifies the group to which the chart belongs.

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

### -Height
Specifies the height of the chart. Default is 350.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 21
Default value: 350
Accept pipeline input: False
Accept wildcard characters: True
```

### -Id
Specifies the ID of the chart. If not provided, a random ID will be generated.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 23
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Patterned
Indicates whether to use patterned colors in the chart.

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: PatternedColors
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -SubTitle
Specifies the subtitle of the chart.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -SubTitleAlignment
Specifies the alignment of the chart subtitle. Valid values are 'center', 'left', or 'right'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: center, left, right

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -SubTitleColor
Specifies the color of the chart subtitle.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 20
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -SubTitleFloating
Specifies whether the chart subtitle should float.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 16
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -SubTitleFontFamily
Specifies the font family of the chart subtitle.

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

### -SubTitleFontSize
Specifies the font size of the chart subtitle.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 17
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -SubTitleFontWeight
Specifies the font weight of the chart subtitle. Valid values are 'normal', 'bold', 'bolder', 'lighter', or numeric values from '100' to '900'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, bold, bolder, lighter, 100, 200, 300, 400, 500, 600, 700, 800, 900

Required: False
Position: 18
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -SubTitleMargin
Specifies the margin of the chart subtitle.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 13
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -SubTitleOffsetX
Specifies the horizontal offset of the chart subtitle.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -SubTitleOffsetY
Specifies the vertical offset of the chart subtitle.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 15
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Title
Specifies the title of the chart.

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

### -TitleAlignment
Specifies the alignment of the chart title. Valid values are 'center', 'left', or 'right'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: center, left, right

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TitleColor
Specifies the color of the chart title.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TitleFloating
Specifies whether the chart title should float.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TitleFontFamily
Specifies the font family of the chart title.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TitleFontSize
Specifies the font size of the chart title.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TitleFontWeight
Specifies the font weight of the chart title. Valid values are 'normal', 'bold', 'bolder', 'lighter', or numeric values from '100' to '900'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, bold, bolder, lighter, 100, 200, 300, 400, 500, 600, 700, 800, 900

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TitleMargin
Specifies the margin of the chart title.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TitleOffsetX
Specifies the horizontal offset of the chart title.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TitleOffsetY
Specifies the vertical offset of the chart title.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Width
Specifies the width of the chart.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 22
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

