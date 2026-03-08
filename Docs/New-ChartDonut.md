---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-ChartDonut
## SYNOPSIS
Creates a new donut chart object with specified name, value, and color.

## SYNTAX
### __AllParameterSets
```powershell
New-ChartDonut [[-Name] <string>] [[-Value] <Object>] [[-Color] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new donut chart object with the provided name, value, and color. The name is used as the identifier for the donut, the value represents the data to be displayed, and the color determines the color of the donut.

## EXAMPLES

### EXAMPLE 1
```powershell
New-ChartDonut -Name 'Sales' -Value 1000 -Color 'blue'
```

Creates a new donut chart object named 'Sales' with a value of 1000 and a blue color.

### EXAMPLE 2
```powershell
New-ChartDonut -Name 'Expenses' -Value 750 -Color 'red'
```

Creates a new donut chart object named 'Expenses' with a value of 750 and a red color.

## PARAMETERS

### -Color
The color of the donut. If not specified, a default color will be used.

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
The name of the donut chart object.

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

### -Value
The value or data to be displayed in the donut chart.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
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

