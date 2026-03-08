---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-GageSector
## SYNOPSIS
Creates a new gauge sector with specified color, minimum value, and maximum value.

## SYNTAX
### __AllParameterSets
```powershell
New-GageSector [[-Color] <string>] [[-Min] <int>] [[-Max] <int>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new gauge sector with the provided color, minimum value, and maximum value. It is useful for visualizing data within a specific range.

## EXAMPLES

### EXAMPLE 1
```powershell
$sector = New-GageSector -Color 'red' -Min 0 -Max 100
Creates a new gauge sector with a red color, minimum value of 0, and maximum value of 100.
```

## PARAMETERS

### -Color
Specifies the color of the gauge sector.

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

### -Max
Specifies the maximum value of the gauge sector.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -Min
Specifies the minimum value of the gauge sector.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: 0
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

