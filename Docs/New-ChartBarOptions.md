---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-ChartBarOptions
## SYNOPSIS
Creates options for a bar chart with customizable parameters.

## SYNTAX
### __AllParameterSets
```powershell
New-ChartBarOptions [[-Type] <Object>] [[-DataLabelsEnabled] <bool>] [[-DataLabelsOffsetX] <int>] [[-DataLabelsFontSize] <string>] [[-DataLabelsColor] <string>] [-Patterned] [-Gradient] [-Distributed] [-Vertical] [<CommonParameters>]
```

## DESCRIPTION
This function creates options for a bar chart with the provided parameters. It allows customization of the bar type, data labels, colors, patterns, gradients, and distribution.

## EXAMPLES

### EXAMPLE 1
```powershell
New-ChartBarOptions -Type 'barStacked' -DataLabelsEnabled $true -DataLabelsOffsetX -6 -DataLabelsFontSize '12px' -DataLabelsColor 'black' -Patterned -Distributed
```

Creates options for a stacked bar chart with data labels enabled, offset of -6, font size '12px', black data labels, patterned colors, and distributed bars.

### EXAMPLE 2
```powershell
New-ChartBarOptions -Type 'bar' -DataLabelsEnabled $false -Gradient -Vertical
```

Creates options for a regular bar chart with data labels disabled, gradient colors, and vertical bars.

## PARAMETERS

### -DataLabelsColor
The color of the data labels.

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

### -DataLabelsEnabled
Indicates whether data labels are enabled. Default is $true.

```yaml
Type: Boolean
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: True
Accept pipeline input: False
Accept wildcard characters: True
```

### -DataLabelsFontSize
The font size of the data labels. Default is '12px'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: 12px
Accept pipeline input: False
Accept wildcard characters: True
```

### -DataLabelsOffsetX
The horizontal offset of the data labels. Default is -6.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
Default value: -6
Accept pipeline input: False
Accept wildcard characters: True
```

### -Distributed
Indicates whether the bars are distributed.

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -Gradient
Indicates whether gradient colors are used.

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: GradientColors
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -Patterned
Indicates whether patterned colors are used.

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: PatternedColors
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -Type
The type of the bar chart. Accepted values are 'bar', 'barStacked', 'barStacked100Percent'. Default is 'bar'.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: bar, barStacked, barStacked100Percent

Required: False
Position: 0
Default value: bar
Accept pipeline input: False
Accept wildcard characters: True
```

### -Vertical
Indicates whether the bars are vertical.

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
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

