---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-TableButtonSearchBuilder
## SYNOPSIS
Creates a configuration object for a table button search builder.

## SYNTAX
### __AllParameterSets
```powershell
New-TableButtonSearchBuilder [[-ButtonName] <string>] [[-DepthLimit] <int>] [[-DefaultLogic] <string>] [-GreyScale] [<CommonParameters>]
```

## DESCRIPTION
This function creates a configuration object for a table button search builder with customizable options.

## EXAMPLES

### EXAMPLE 1
```powershell
New-TableButtonSearchBuilder -ButtonName "Search" -DepthLimit 3 -DefaultLogic "AND" -GreyScale
Creates a search builder button named "Search" with a depth limit of 3, default logic set to "AND", and displayed in greyscale.
```

### EXAMPLE 2
```powershell
New-TableButtonSearchBuilder -ButtonName "Filter" -DefaultLogic "OR"
Creates a search builder button named "Filter" with default logic set to "OR".
```

## PARAMETERS

### -ButtonName
The name of the button to be displayed.

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

### -DefaultLogic
The default logic to be applied.

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

### -DepthLimit
The depth limit for the search builder.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: 2
Accept pipeline input: False
Accept wildcard characters: True
```

### -GreyScale
Indicates if the search builder should be displayed in greyscale.

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

