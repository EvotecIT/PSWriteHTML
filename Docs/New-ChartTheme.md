---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-ChartTheme
## SYNOPSIS
Creates a new chart theme with customizable options.

## SYNTAX
### __AllParameterSets
```powershell
New-ChartTheme [[-Mode] <string>] [[-Palette] <string>] [[-Color] <string>] [[-ShadeTo] <string>] [[-ShadeIntensity] <double>] [-Monochrome] [<CommonParameters>]
```

## DESCRIPTION
This function defines the properties of a chart theme, such as mode, palette, color, shade, and intensity. It allows customization of the theme appearance in the chart.

## EXAMPLES

### EXAMPLE 1
```powershell
New-ChartTheme -Mode 'dark' -Palette 'palette3' -Monochrome -Color 'Red' -ShadeTo 'dark' -ShadeIntensity 0.8
Creates a new chart theme with dark mode, palette 3, monochrome enabled, red base color, dark shading, and intensity of 0.8.
```

### EXAMPLE 2
```powershell
New-ChartTheme -Mode 'light' -Palette 'palette7' -Color 'Blue' -ShadeTo 'light' -ShadeIntensity 0.6
Creates a new chart theme with light mode, palette 7, blue base color, light shading, and intensity of 0.6.
```

## PARAMETERS

### -Color
Sets the base color for the chart theme.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
Default value: DodgerBlue
Accept pipeline input: False
Accept wildcard characters: True
```

### -Mode
Specifies the mode of the chart theme. Valid values are 'light' or 'dark'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: light, dark

Required: False
Position: 0
Default value: light
Accept pipeline input: False
Accept wildcard characters: True
```

### -Monochrome
Switch parameter to enable monochrome mode for the chart theme.

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

### -Palette
Specifies the color palette for the chart theme. Valid values are 'palette1' through 'palette10'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: palette1, palette2, palette3, palette4, palette5, palette6, palette7, palette8, palette9, palette10

Required: False
Position: 1
Default value: palette1
Accept pipeline input: False
Accept wildcard characters: True
```

### -ShadeIntensity
Specifies the intensity of the shading effect for the chart theme.

```yaml
Type: Double
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 4
Default value: 0.65
Accept pipeline input: False
Accept wildcard characters: True
```

### -ShadeTo
Specifies the shading direction for the chart theme. Valid values are 'light' or 'dark'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: light, dark

Required: False
Position: 3
Default value: light
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

