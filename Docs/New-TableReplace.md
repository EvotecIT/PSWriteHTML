---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-TableReplace
## SYNOPSIS
Replaces values in a specified field of a table.

## SYNTAX
### __AllParameterSets
```powershell
New-TableReplace [[-FieldName] <string>] [[-Replacements] <string[]>] [<CommonParameters>]
```

## DESCRIPTION
This function replaces values in a specified field of a table with the provided replacements.

## EXAMPLES

### EXAMPLE 1
```powershell
New-TableReplace -FieldName "Status" -Replacements @("Active", "Inactive")
```

Description:
Replaces values in the "Status" field with "Active" or "Inactive".

### EXAMPLE 2
```powershell
New-TableReplace -FieldName "Priority" -Replacements @("High", "Medium", "Low")
```

Description:
Replaces values in the "Priority" field with "High", "Medium", or "Low".

## PARAMETERS

### -FieldName
The name of the field in the table where replacements will be made.

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

### -Replacements
An array of strings containing the values to replace in the specified field.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
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

