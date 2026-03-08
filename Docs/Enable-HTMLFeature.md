---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# Enable-HTMLFeature
## SYNOPSIS
Provides a way to enable existing feature or extending PSWriteHTML

## SYNTAX
### __AllParameterSets
```powershell
Enable-HTMLFeature [[-Feature] <string[]>] [[-Configuration] <IDictionary>] [<CommonParameters>]
```

## DESCRIPTION
Provides a way to enable existing feature or extending PSWriteHTML

## EXAMPLES

### EXAMPLE 1
```powershell
Enable-HTMLFeature -Feature Raphael, Mapael, Jquery, JQueryMouseWheel, "MapaelMaps_$Map"
```

## PARAMETERS

### -Configuration
Provide hashtable with configuration of libraries

```yaml
Type: IDictionary
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Feature
Choose one of the existing features or define them via extension

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

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

