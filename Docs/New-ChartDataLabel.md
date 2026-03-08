---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-ChartDataLabel
## SYNOPSIS
Configures DataLabels for Charts

## SYNTAX
### __AllParameterSets
```powershell
New-ChartDataLabel [[-TextAnchor] <string>] [[-OffsetX] <int>] [[-OffsetY] <int>] [[-FontSize] <Object>] [[-FontFamily] <string>] [[-FontColor] <string[]>] [-Enabled] [-Distributed] [<CommonParameters>]
```

## DESCRIPTION
Configures DataLabels for Charts

## EXAMPLES

### EXAMPLE 1
```powershell
An example
```

## PARAMETERS

### -Distributed
Similar to plotOptions.bar.distributed, this option makes each data-label discrete. So, when you provide an array of colors in datalabels.style.colors, the index in the colors array correlates with individual data-label index of all series.

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

### -Enabled
To determine whether to show dataLabels or not

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

### -FontColor
FontColors for the dataLabels. Accepts an array of string colors. Each index in the array corresponds to the series

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: DataLabelsColor
Possible values: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontFamily
FontFamily for the label

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

### -FontSize
FontSize for the label

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: DataLabelsFontSize
Possible values: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -OffsetX
Sets the left offset for dataLabels

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: DataLabelsOffsetX
Possible values: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -OffsetY
Sets the top offset for dataLabels

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextAnchor
The alignment of text relative to dataLabel’s drawing position. Accepted values: start, middle, end

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: start, middle, end

Required: False
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

