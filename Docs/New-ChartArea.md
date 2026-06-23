---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-ChartArea
## SYNOPSIS
Adds an area series to a chart.

## SYNTAX
### __AllParameterSets
```powershell
New-ChartArea [-Name] <string> [-Value] <Object> [[-Color] <string>] [[-Curve] <Object>] [[-Width] <int>] [[-Cap] <string>] [[-Dash] <int>] [<CommonParameters>]
```

## DESCRIPTION
Adds an ApexCharts area series. Use New-ChartAxisX to provide categories,
datetime values, or numeric axis settings when needed.

## EXAMPLES

### EXAMPLE 1
```powershell
PS > New-ChartArea -Name 'Revenue' -Value 10, 20, 18 -Color Blue -Curve smooth
```


## PARAMETERS

### -Cap
Stroke cap style.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases:
Possible values: butt, square, round

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Color
Series color.

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

### -Curve
Stroke curve style.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases:
Possible values: straight, smooth, stepline

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Dash
Stroke dash spacing.

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

### -Name
Name of the area series.

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

### -Value
Values to display in the area series.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases:
Possible values:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Width
Stroke width.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None
