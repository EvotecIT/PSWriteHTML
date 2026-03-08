---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-MapArea
## SYNOPSIS
Creates a new MapArea object with specified parameters.

## SYNTAX
### __AllParameterSets
```powershell
New-MapArea [-Area] <string> [[-Href] <string>] [-Value] <string> [[-TooltipContent] <scriptblock>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new MapArea object with the specified area, href, value, and optional tooltip content.

## EXAMPLES

### EXAMPLE 1
```powershell
New-MapArea -Area "North" -Href "north.html" -Value "North Region" -Tooltip { "This is the North region." }
```

Creates a new MapArea object for the North region with the specified href, value, and tooltip content.

### EXAMPLE 2
```powershell
New-MapArea -Area "South" -Href "south.html" -Value "South Region"
```

Creates a new MapArea object for the South region with the specified href and value.

## PARAMETERS

### -Area
Specifies the area for the MapArea object. This parameter is mandatory.

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

### -Href
Specifies the href attribute for the MapArea object.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TooltipContent
{{ Fill TooltipContent Description }}

```yaml
Type: ScriptBlock
Parameter Sets: __AllParameterSets
Aliases: Tooltip
Possible values: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Value
Specifies the value attribute for the MapArea object. This parameter is mandatory.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: True
Position: 2
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

