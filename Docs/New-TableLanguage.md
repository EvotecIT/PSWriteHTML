---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-TableLanguage
## SYNOPSIS
Provides ability to overwrite texts available in the table.

## SYNTAX
### __AllParameterSets
```powershell
New-TableLanguage [[-Info] <string>] [[-InfoFiltered] <string>] [[-Search] <string>] [[-EmptyTable] <string>] [[-ZeroRecords] <string>] [[-PaginateFirst] <string>] [[-PaginateLast] <string>] [[-PaginateNext] <string>] [[-PaginatePrevious] <string>] [<CommonParameters>]
```

## DESCRIPTION
Provides ability to overwrite texts available in the table. This is useful for translating to different languages or choosing different naming.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTML -TitleText "Example41 - Table" -FilePath "$PSScriptRoot\Example41.html" {
    New-HTMLSection -HeaderText "Testing" -HeaderTextAlignment center -Content {
        New-HTMLTable -DataTable $Values {
            New-TableLanguage -Search 'Find' -PaginateFirst 'First Option' -EmptyTable 'No data in the table'
            New-HTMLTableConditionGroup {
                New-HTMLTableCondition -Name 'Test1' -Value 1 -ComparisonType number
                New-HTMLTableCondition -Name 'Test2' -Value 2 -ComparisonType number
            } -BackgroundColor Salmon -FailBackgroundColor Goldenrod -Logic OR -HighlightHeaders 'Test1', 'Test2', 'DisplayName', 'DomainName'
        } -DataStore JavaScript
    }
} -ShowHTML -Online
```

## PARAMETERS

### -EmptyTable
Overwrites the text when the table is empty. Default value is: "No data available in table"

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

### -Info
Overwrites information about the table. Default value is: "Showing _START_ to _END_ of _TOTAL_ entries"

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

### -InfoFiltered
Overwrites information about the table when filtered. Default value is: "(filtered from _MAX_ total entries)"

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

### -PaginateFirst
Overwrites the text for the first page button. Default value is: "First"

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -PaginateLast
Overwrites the text for the last page button. Default value is: "Last"

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -PaginateNext
Overwrites the text for the next page button. Default value is: "Next"

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -PaginatePrevious
Overwrites the text for the previous page button. Default value is: "Previous"

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Search
Overwrites the search text. Default value is: "Search:"

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

### -ZeroRecords
Overwrites the text when no records match the search. Default value is: "No matching records found"

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

