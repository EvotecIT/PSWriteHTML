---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-ChartRadial
## SYNOPSIS
Creates a new radial chart object.

## SYNTAX
### __AllParameterSets
```powershell
New-ChartRadial [[-Name] <string>] [[-Value] <Object>] [[-Color] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new radial chart object with the specified Name, Value, and Color.

## EXAMPLES

### EXAMPLE 1
```powershell
New-ChartRadial -Name "Chart1" -Value 75 -Color "Blue"
Creates a new radial chart object named "Chart1" with a value of 75 and a blue color.
```

### EXAMPLE 2
```powershell
New-ChartRadial -Name "Chart2" -Value 50
Creates a new radial chart object named "Chart2" with a value of 50 using the default color.
```

## PARAMETERS

### -Color
Specifies the color of the radial chart. If not provided, the default color is used.

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
Specifies the name of the radial chart.

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
Specifies the value of the radial chart.

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

