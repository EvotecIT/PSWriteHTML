---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-ChartAxisX
## SYNOPSIS
Creates a new X-axis for a chart with specified parameters.

## SYNTAX
### __AllParameterSets
```powershell
New-ChartAxisX [[-Names] <array>] [[-TitleText] <string>] [[-Type] <string>] [[-MinValue] <Object>] [[-MaxValue] <Object>] [[-TimeZoneOffset] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new X-axis for a chart with the provided parameters. It allows customization of the axis name, title, type, minimum and maximum values, and timezone offset.

## EXAMPLES

### EXAMPLE 1
```powershell
New-ChartAxisX -Names @('Jan', 'Feb', 'Mar') -TitleText 'Months' -Type 'category'
```

Creates a new X-axis with categories 'Jan', 'Feb', 'Mar' and title 'Months'.

### EXAMPLE 2
```powershell
New-ChartAxisX -Names @('2020-01-01', '2020-02-01', '2020-03-01') -TitleText 'Dates' -Type 'datetime' -MinValue (Get-Date '2020-01-01') -MaxValue (Get-Date '2020-03-01') -TimeZoneOffset '+02:00'
```

Creates a new X-axis with datetime values, title 'Dates', and timezone offset of +2 hours.

## PARAMETERS

### -MaxValue
The maximum value of the X-axis.

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
The minimum value of the X-axis.

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
An array of names for the X-axis categories.

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

### -TimeZoneOffset
The timezone offset to adjust the X-axis values.

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

### -TitleText
The title text to be displayed for the X-axis.

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
The type of the X-axis data. Accepted values are 'datetime', 'category', or 'numeric'. Default is 'category'.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

