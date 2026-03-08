---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-TableButtonCSV
## SYNOPSIS
Creates a new table button for exporting data to CSV with customizable options.

## SYNTAX
### __AllParameterSets
```powershell
New-TableButtonCSV [[-Title] <string>] [[-ButtonName] <string>] [[-Extension] <string>] [[-FileName] <string>] [[-FieldSeparator] <string>] [[-FieldBoundary] <string>] [-DisableBOM] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new table button for exporting data to CSV with customizable options. It allows users to specify the button title, file name, and other settings for CSV export.

## EXAMPLES

### EXAMPLE 1
```powershell
New-TableButtonCSV -Title "Export to CSV" -FileName "data" -FieldSeparator "," -FieldBoundary "'"
```

Description
-----------
Creates a new table button with the title "Export to CSV", exports data to a CSV file named "data.csv" with comma as the field separator and single quote as the field boundary.

## PARAMETERS

### -ButtonName
The text to be displayed on the button. Default value is 'CSV'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: CSV
Accept pipeline input: False
Accept wildcard characters: True
```

### -DisableBOM
Switch to disable Byte Order Mark (BOM) in the exported CSV file.

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

### -Extension
The file extension for the exported CSV file. Default value is '.csv'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
Default value: .csv
Accept pipeline input: False
Accept wildcard characters: True
```

### -FieldBoundary
The character used to enclose fields in the CSV file. Default value is '"'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: "
Accept pipeline input: False
Accept wildcard characters: True
```

### -FieldSeparator
The separator character for fields in the CSV file. Default value is ';'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 4
Default value: ;
Accept pipeline input: False
Accept wildcard characters: True
```

### -FileName
The name of the exported CSV file.

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

### -Title
The title to be displayed when hovering over the button.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

