---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-ChartSpark
## SYNOPSIS
Creates a new spark chart object.

## SYNTAX
### __AllParameterSets
```powershell
New-ChartSpark [[-Name] <string>] [[-Value] <Object>] [[-Color] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new spark chart object with the specified Name, Value, and Color.

## EXAMPLES

### EXAMPLE 1
```powershell
New-ChartSpark -Name "Spark1" -Value 100 -Color "Green"
Creates a new spark chart object named "Spark1" with a value of 100 and a green color.
```

### EXAMPLE 2
```powershell
New-ChartSpark -Name "Spark2" -Value 50
Creates a new spark chart object named "Spark2" with a value of 50 using the default color.
```

## PARAMETERS

### -Color
Specifies the color of the spark chart.

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
Specifies the name of the spark chart.

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
Specifies the value of the spark chart.

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

