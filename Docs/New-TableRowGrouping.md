---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-TableRowGrouping
## SYNOPSIS
Creates a new table row grouping object with specified attributes.

## SYNTAX
### __AllParameterSets
```powershell
New-TableRowGrouping [[-Name] <string>] [[-ColumnID] <int>] [[-SortOrder] <string>] [[-Color] <string>] [[-BackgroundColor] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new table row grouping object with the provided attributes. It enables the feature for DataTablesRowGrouping in the HTML schema.

## EXAMPLES

### EXAMPLE 1
```powershell
New-TableRowGrouping -Name "Group A" -ColumnID 1 -SortOrder 'Ascending' -Color 'Red' -BackgroundColor 'LightGray'
Creates a new table row grouping object for Group A, grouping by column ID 1 in ascending order with red text and light gray background.
```

### EXAMPLE 2
```powershell
New-TableRowGrouping -Name "Group B" -ColumnID 2 -SortOrder 'Descending' -Color 'Blue' -BackgroundColor 'White'
Creates a new table row grouping object for Group B, grouping by column ID 2 in descending order with blue text and white background.
```

## PARAMETERS

### -BackgroundColor
Specifies the background color for the row grouping.

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

### -Color
Specifies the color for the row grouping.

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

### -ColumnID
Specifies the ID of the column to group rows by. Default value is -1.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: -1
Accept pipeline input: False
Accept wildcard characters: True
```

### -Name
Specifies the name of the row grouping.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: ColumnName
Possible values: 

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -SortOrder
Specifies the sort order for the grouped rows. Valid values are 'Ascending' or 'Descending'. Default is 'Ascending'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: Ascending, Descending

Required: False
Position: 2
Default value: Ascending
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

