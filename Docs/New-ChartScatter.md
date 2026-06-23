---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-ChartScatter
## SYNOPSIS
Adds a scatter series to a chart.

## SYNTAX
### __AllParameterSets
```powershell
New-ChartScatter [-Name] <string> [[-X] <Object[]>] [[-Y] <Object[]>] [[-Data] <Object>] [[-Color] <string>] [<CommonParameters>]
```

## DESCRIPTION
Adds an ApexCharts scatter series. Provide X and Y arrays for the common case,
or pass raw ApexCharts-compatible points through Data.

## EXAMPLES

### EXAMPLE 1
```powershell
PS > New-ChartScatter -Name 'Samples' -X 1, 2, 3 -Y 10, 25, 18 -Color Purple
```


## PARAMETERS

### -Color
{{ Fill Color Description }}

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

### -Data
{{ Fill Data Description }}

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

### -Name
{{ Fill Name Description }}

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

### -X
{{ Fill X Description }}

```yaml
Type: Object[]
Parameter Sets: __AllParameterSets
Aliases:
Possible values:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Y
{{ Fill Y Description }}

```yaml
Type: Object[]
Parameter Sets: __AllParameterSets
Aliases:
Possible values:

Required: False
Position: 2
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
