---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-ChartPie
## SYNOPSIS
Creates a new pie chart with customizable options.

## SYNTAX
### __AllParameterSets
```powershell
New-ChartPie [[-Name] <string>] [[-Value] <Object>] [[-Color] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new pie chart with the specified name, value, and color. It allows customization of the pie chart appearance.

## EXAMPLES

### EXAMPLE 1
```powershell
New-ChartPie -Name "Slice 1" -Value 30 -Color "red"
Creates a new pie chart segment named "Slice 1" with a value of 30 and colored in red.
```

### EXAMPLE 2
```powershell
New-ChartPie -Name "Slice 2" -Value 20 -Color "blue"
Creates a new pie chart segment named "Slice 2" with a value of 20 and colored in blue.
```

## PARAMETERS

### -Color
Specifies the color of the pie chart segment.

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
Specifies the name of the pie chart.

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
Specifies the value of the pie chart segment.

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

