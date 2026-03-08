---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLTreeChildCounter
## SYNOPSIS
Creates a new HTML tree child counter object with specified options.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLTreeChildCounter [-Deep] [-HideZero] [-HideExpanded] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new HTML tree child counter object with the ability to customize its behavior using the provided parameters.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLTreeChildCounter -Deep
Creates a new HTML tree child counter object that counts child elements recursively.
```

### EXAMPLE 2
```powershell
New-HTMLTreeChildCounter -HideZero -HideExpanded
Creates a new HTML tree child counter object that hides counters for child elements with a count of zero and expanded child elements.
```

## PARAMETERS

### -Deep
Indicates whether to count child elements recursively.

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

### -HideExpanded
Indicates whether to hide counters for expanded child elements.

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

### -HideZero
Indicates whether to hide counters for child elements with a count of zero.

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

