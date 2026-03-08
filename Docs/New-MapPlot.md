---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-MapPlot
## SYNOPSIS
Creates a new MapPlot object with specified latitude, longitude, and other optional parameters.

## SYNTAX
### __AllParameterSets
```powershell
New-MapPlot [-Plot] <string> [-Latitude] <double> [-Longitude] <double> [[-Href] <string>] [-Value] <string> [[-TooltipContent] <scriptblock>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new MapPlot object with the provided latitude, longitude, and other optional parameters like href, value, and tooltip content.

## EXAMPLES

### EXAMPLE 1
```powershell
New-MapPlot -Plot "Sample Plot" -Latitude 40.7128 -Longitude -74.0060 -Href "https://example.com" -Value "Sample Value" -TooltipContent { "This is a sample tooltip." }
```

Creates a new MapPlot object named "Sample Plot" with latitude 40.7128, longitude -74.0060, a hyperlink reference to "https://example.com", a value of "Sample Value", and a tooltip content of "This is a sample tooltip."

## PARAMETERS

### -Href
Specifies the hyperlink reference for the plot.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Latitude
Specifies the latitude coordinate for the plot.

```yaml
Type: Double
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: True
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -Longitude
Specifies the longitude coordinate for the plot.

```yaml
Type: Double
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: True
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -Plot
Specifies the name of the plot.

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

### -TooltipContent
Specifies the content of the tooltip associated with the plot.

```yaml
Type: ScriptBlock
Parameter Sets: __AllParameterSets
Aliases: Tooltip
Possible values: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Value
Specifies the value associated with the plot.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: True
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

