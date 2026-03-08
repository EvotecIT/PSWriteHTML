---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLMap
## SYNOPSIS
Creates a new HTML map with specified settings.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLMap [[-MapSettings] <scriptblock>] [-Map] <string> [[-AnchorName] <string>] [[-AreaTitle] <string>] [[-PlotTitle] <string>] [[-FillColor] <string>] [[-StrokeColor] <string>] [[-StrokeWidth] <int>] [-ShowAreaLegend] [-ShowPlotLegend] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new HTML map with customizable settings such as map type, legend options, colors, and titles.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLMap -Map 'World_Countries' -AnchorName 'Map1' -ShowAreaLegend -AreaTitle 'Country Population' -PlotTitle 'Population Density' -FillColor 'blue' -StrokeColor 'black' -StrokeWidth 2
```

Creates a new HTML map displaying world countries with area legend showing country population and plot legend showing population density. The map areas are filled with blue color, have black borders, and a border width of 2.

### EXAMPLE 2
```powershell
$CustomSettings = {
    # Custom map settings here
}
New-HTMLMap -Map 'Usa_States' -AnchorName 'Map2' -ShowPlotLegend -PlotTitle 'Economic Data' -FillColor 'green' -StrokeColor 'gray' -StrokeWidth 1 -MapSettings $CustomSettings
```

Creates a new HTML map displaying USA states with plot legend showing economic data. The map areas are filled with green color, have gray borders, and a border width of 1. Custom map settings are applied using the script block $CustomSettings.

## PARAMETERS

### -AnchorName
Specifies the name of the HTML anchor element where the map will be rendered.

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

### -AreaTitle
Specifies the title for the area legend.

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

### -FillColor
Specifies the color to fill the map areas.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: SliceColor
Possible values: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Map
Specifies the type of map to be displayed. Valid values are 'Poland', 'Usa_States', 'World_Countries', or 'European_Union'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: Poland, Usa_States, World_Countries, European_Union

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -MapSettings
A script block containing custom map settings to be applied.

```yaml
Type: ScriptBlock
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -PlotTitle
Specifies the title for the plot legend.

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

### -ShowAreaLegend
Switch parameter to indicate whether to display the area legend on the map.

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

### -ShowPlotLegend
Switch parameter to indicate whether to display the plot legend on the map.

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

### -StrokeColor
Specifies the color of the map area borders.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -StrokeWidth
Specifies the width of the map area borders.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 7
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

