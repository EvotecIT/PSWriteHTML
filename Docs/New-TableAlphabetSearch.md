---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-TableAlphabetSearch
## SYNOPSIS
Creates a custom object for Table Alphabet Search with specified parameters.

## SYNTAX
### ID (Default)
```powershell
New-TableAlphabetSearch -ColumnID <int> [-AddNumbers] [-CaseSensitive] [<CommonParameters>]
```

### Name
```powershell
New-TableAlphabetSearch -ColumnName <string> [-AddNumbers] [-CaseSensitive] [<CommonParameters>]
```

## DESCRIPTION
This function creates a custom object for Table Alphabet Search with the specified parameters. It allows for customization of the search behavior by enabling case sensitivity and adding numbers to the search.

## EXAMPLES

### EXAMPLE 1
```powershell
New-TableAlphabetSearch -ColumnID 1 -ColumnName "Name" -AddNumbers -CaseSensitive
Creates a Table Alphabet Search object for column ID 1 with the name "Name", including numbers in the search and performing a case-sensitive search.
```

### EXAMPLE 2
```powershell
New-TableAlphabetSearch -ColumnID 2 -ColumnName "ID" -CaseSensitive
Creates a Table Alphabet Search object for column ID 2 with the name "ID", performing a case-sensitive search.
```

## PARAMETERS

### -AddNumbers
Switch parameter to include numbers in the search.

```yaml
Type: SwitchParameter
Parameter Sets: ID, Name
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -CaseSensitive
Switch parameter to perform a case-sensitive search.

```yaml
Type: SwitchParameter
Parameter Sets: ID, Name
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -ColumnID
Specifies the ID of the column to search.

```yaml
Type: Int32
Parameter Sets: ID
Aliases: 
Possible values: 

Required: True
Position: named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -ColumnName
Specifies the name of the column to search.

```yaml
Type: String
Parameter Sets: Name
Aliases: 
Possible values: 

Required: True
Position: named
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

