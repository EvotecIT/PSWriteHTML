---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-ChartTimeLine
## SYNOPSIS
Creates a new time series chart object.

## SYNTAX
### __AllParameterSets
```powershell
New-ChartTimeLine [-Name] <string> [[-DateFrom] <datetime>] [[-DateTo] <datetime>] [[-Color] <string>] [[-TimeZoneOffset] <string>] [[-DateFormatPattern] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new time series chart object with the specified Name, DateFrom, DateTo, Color, TimeZoneOffset, and DateFormatPattern. It allows customization of the time series chart appearance.

## EXAMPLES

### EXAMPLE 1
```powershell
New-ChartTimeLine -Name "TimeSeries1" -DateFrom (Get-Date) -DateTo (Get-Date).AddDays(7) -Color "Blue" -TimeZoneOffset "+3" -DateFormatPattern "MM/dd/yyyy HH:mm:ss"
Creates a new time series chart object named "TimeSeries1" with a date range from the current date to 7 days ahead, colored in blue, with a time zone offset of +3, and using the date format pattern "MM/dd/yyyy HH:mm:ss".
```

### EXAMPLE 2
```powershell
New-ChartTimeLine -Name "TimeSeries2" -DateFrom (Get-Date) -DateTo (Get-Date).AddDays(14) -Color "Green" -TimeZoneOffset "-5"
Creates a new time series chart object named "TimeSeries2" with a date range from the current date to 14 days ahead, colored in green, with a time zone offset of -5, using the default date format pattern.
```

## PARAMETERS

### -Color
Specifies the color of the time series chart.

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

### -DateFormatPattern
Specifies the date format pattern for the time series chart. Default is "yyyy-MM-dd HH:mm:ss".

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: yyyy-MM-dd HH:mm:ss
Accept pipeline input: False
Accept wildcard characters: True
```

### -DateFrom
Specifies the starting date for the time series chart.

```yaml
Type: DateTime
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -DateTo
Specifies the ending date for the time series chart.

```yaml
Type: DateTime
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Name
Specifies the name of the time series chart.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TimeZoneOffset
Specifies the time zone offset for the time series chart.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

