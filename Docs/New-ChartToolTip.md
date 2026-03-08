---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-ChartToolTip
## SYNOPSIS
Creates a new chart tooltip object with customizable options.

## SYNTAX
### __AllParameterSets
```powershell
New-ChartToolTip [[-Names] <array>] [[-TitleText] <string>] [[-Type] <string>] [[-MinValue] <Object>] [[-MaxValue] <Object>] [[-XAxisFormatPattern] <string>] [[-YAxisFormatPattern] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function defines a chart tooltip object with various options such as names, title text, type, min and max values, X and Y axis format patterns. It allows customization of the tooltip appearance and behavior.

## EXAMPLES

### EXAMPLE 1
```powershell
New-ChartToolTip -Names @("Name1", "Name2") -TitleText "Tooltip Title" -Type 'datetime' -MinValue 0 -MaxValue 100 -XAxisFormatPattern "HH:mm:ss" -YAxisFormatPattern "function (seriesName) { return seriesName + ': ' + value; }"
Creates a new chart tooltip object with names "Name1" and "Name2", title "Tooltip Title", datetime type, min value of 0, max value of 100, X-axis format pattern "HH:mm:ss", and custom Y-axis format pattern.
```

### EXAMPLE 2
```powershell
New-ChartToolTip -Names @("Data1", "Data2", "Data3") -TitleText "Data Tooltip" -Type 'numeric' -MinValue 50 -MaxValue 200 -XAxisFormatPattern "MM/dd/yyyy" -YAxisFormatPattern "function (seriesName) { return seriesName + ': ' + value; }"
Creates a new chart tooltip object with names "Data1", "Data2", and "Data3", title "Data Tooltip", numeric type, min value of 50, max value of 200, X-axis format pattern "MM/dd/yyyy", and custom Y-axis format pattern.
```

## PARAMETERS

### -MaxValue
Specifies the maximum value for the chart tooltip.

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

### -MinValue
Specifies the minimum value for the chart tooltip.

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

### -Names
Specifies an array of names for the chart tooltip.

```yaml
Type: Array
Parameter Sets: __AllParameterSets
Aliases: Name
Possible values: 

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TitleText
Specifies the title text for the chart tooltip.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: Title
Possible values: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Type
Specifies the type of the chart tooltip. Valid values are 'datetime', 'category', or 'numeric'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: datetime, category, numeric

Required: False
Position: 2
Default value: category
Accept pipeline input: False
Accept wildcard characters: True
```

### -XAxisFormatPattern
Specifies the format pattern for the X-axis in the chart tooltip.

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

### -YAxisFormatPattern
Specifies the format pattern for the Y-axis in the chart tooltip. Default is "function (seriesName) { return ''; }".

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 6
Default value: function (seriesName) { return ''; }
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

