---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-ChartAxisY
## SYNOPSIS
Creates a new Y-axis for a chart with customizable parameters.

## SYNTAX
### __AllParameterSets
```powershell
New-ChartAxisY [[-TitleText] <string>] [[-TitleRotate] <string>] [[-TitleOffsetX] <int>] [[-TitleOffsetY] <int>] [[-TitleFontWeight] <string>] [[-TitleColor] <string>] [[-TitleFontSize] <int>] [[-TitleFontFamily] <string>] [[-MinValue] <int>] [[-MaxValue] <int>] [[-LabelMinWidth] <int>] [[-LabelMaxWidth] <int>] [[-LabelAlign] <string>] [[-LabelFontSize] <Object>] [[-LabelFontFamily] <string>] [[-LabelFontWeight] <string>] [[-LabelFontColor] <string[]>] [[-SeriesName] <string>] [-Show] [-ShowAlways] [-Reversed] [-Opposite] [-Logarithmic] [-ForceNiceScale] [-Floating] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new Y-axis for a chart with the provided parameters. It allows customization of the axis visibility, title, labels, range, style, and other options.

## EXAMPLES

### EXAMPLE 1
```powershell
New-ChartAxisY -Show -TitleText 'Sales' -MinValue 0 -MaxValue 1000 -LabelAlign 'center'
```

Creates a new Y-axis with the title 'Sales', range from 0 to 1000, and center-aligned labels.

### EXAMPLE 2
```powershell
New-ChartAxisY -Show -ShowAlways -TitleText 'Temperature' -TitleColor 'red' -LabelAlign 'right'
```

Creates a new Y-axis with the title 'Temperature', always visible, red-colored title, and right-aligned labels.

## PARAMETERS

### -Floating
Indicates whether the Y-axis should be floating.

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

### -ForceNiceScale
Indicates whether the Y-axis should have a nice scale.

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

### -LabelAlign
The alignment of the Y-axis labels. Accepted values are 'left', 'center', or 'right'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: left, center, right

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -LabelFontColor
The color of the Y-axis labels.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 16
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -LabelFontFamily
The font family of the Y-axis labels.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -LabelFontSize
The font size of the Y-axis labels.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 13
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -LabelFontWeight
The font weight of the Y-axis labels.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, bold, bolder, lighter, 100, 200, 300, 400, 500, 600, 700, 800, 900

Required: False
Position: 15
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -LabelMaxWidth
The maximum width of the Y-axis labels.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 11
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -LabelMinWidth
The minimum width of the Y-axis labels.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 10
Default value: -1
Accept pipeline input: False
Accept wildcard characters: True
```

### -Logarithmic
Indicates whether the Y-axis should have a logarithmic scale.

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

### -MaxValue
The maximum value of the Y-axis.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 9
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -MinValue
The minimum value of the Y-axis.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 8
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -Opposite
Indicates whether the Y-axis should be positioned on the opposite side.

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

### -Reversed
Indicates whether the Y-axis should be reversed.

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

### -SeriesName
The name of the series associated with the Y-axis.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 17
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Show
Indicates whether the Y-axis should be displayed.

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

### -ShowAlways
Indicates whether the Y-axis should always be visible.

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

### -TitleColor
The color of the Y-axis title.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: TitleStyleColor
Possible values: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TitleFontFamily
The font family of the Y-axis title.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: TitleStyleFontFamily
Possible values: 

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TitleFontSize
The font size of the Y-axis title.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: TitleStyleFontSize
Possible values: 

Required: False
Position: 6
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -TitleFontWeight
The font weight of the Y-axis title.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, bold, bolder, lighter, 100, 200, 300, 400, 500, 600, 700, 800, 900

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TitleOffsetX
The horizontal offset of the Y-axis title.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -TitleOffsetY
The vertical offset of the Y-axis title.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -TitleRotate
The rotation angle of the Y-axis title. Accepted values are '90' or '270'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 90, 270

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TitleText
The text to be displayed as the title of the Y-axis.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 0
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

