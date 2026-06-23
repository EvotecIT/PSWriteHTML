---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-ChartLabel
## SYNOPSIS
Overrides chart labels for charts that support top-level ApexCharts labels.

## SYNTAX
### __AllParameterSets
```powershell
New-ChartLabel [-Names] <string[]> [<CommonParameters>]
```

## DESCRIPTION
Provides a friendly way to set labels, especially for pie and donut charts
when labels should be supplied separately from the value commands.

## EXAMPLES

### EXAMPLE 1
```powershell
PS > New-ChartLabel -Name 'Passed', 'Failed', 'Skipped'
```


## PARAMETERS

### -Names
{{ Fill Names Description }}

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: Name
Possible values:

Required: True
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
