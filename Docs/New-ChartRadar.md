---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-ChartRadar
## SYNOPSIS
Adds a radar series to a chart.

## SYNTAX
### __AllParameterSets
```powershell
New-ChartRadar [-Name] <string> [-Value] <Object> [[-Color] <string>] [<CommonParameters>]
```

## DESCRIPTION
Adds an ApexCharts radar series. Use New-ChartAxisX to provide spoke labels.

## EXAMPLES

### EXAMPLE 1
```powershell
PS > New-ChartRadar -Name 'Coverage' -Value 70, 85, 62 -Color Green
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
Position: 2
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

### -Value
{{ Fill Value Description }}

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None
