---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-ChartEvent
## SYNOPSIS
Creates a new chart event for a specified DataTable.

## SYNTAX
### __AllParameterSets
```powershell
New-ChartEvent [-DataTableID] <string> [-ColumnID] <int> [-EscapeRegex] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new chart event for a specified DataTable. It allows for defining events like click, data point selection, and marker click for the chart.

## EXAMPLES

### EXAMPLE 1
```powershell
New-ChartEvent -DataTableID "table1" -ColumnID 1 -EscapeRegex
Creates a new chart event for DataTable with ID "table1" on column 1 with regular expression escaping enabled.
```

### EXAMPLE 2
```powershell
New-ChartEvent -DataTableID "table2" -ColumnID 2
Creates a new chart event for DataTable with ID "table2" on column 2 without regular expression escaping.
```

## PARAMETERS

### -ColumnID
Specifies the ID of the column in the DataTable for which the chart event is being created.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: True
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -DataTableID
Specifies the ID of the DataTable for which the chart event is being created.

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

### -EscapeRegex
Indicates whether to escape regular expressions in the chart event.

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

