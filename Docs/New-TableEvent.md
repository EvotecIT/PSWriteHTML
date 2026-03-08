---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-TableEvent
## SYNOPSIS
Creates a new table event object.

## SYNTAX
### __AllParameterSets
```powershell
New-TableEvent [[-TableID] <string>] [[-SourceColumnName] <string>] [[-TargetColumnID] <int>] [[-SourceColumnID] <int>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new table event object with the specified parameters.

## EXAMPLES

### EXAMPLE 1
```powershell
New-TableEvent -TableID "Table1" -SourceColumnName "Column1" -TargetColumnID 1 -SourceColumnID 2
```

Creates a new table event object for Table1 with SourceColumnName "Column1", TargetColumnID 1, and SourceColumnID 2.

## PARAMETERS

### -SourceColumnID
Specifies the ID of the source column.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -SourceColumnName
Specifies the name of the source column.

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

### -TableID
Specifies the ID of the table.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: ID
Possible values: 

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TargetColumnID
Specifies the ID of the target column.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
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

