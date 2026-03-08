---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLSummary
## SYNOPSIS
Creates a new HTML summary section with customizable content.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLSummary [[-SummaryItems] <scriptblock>] [[-Title] <string>] [[-TitleRight] <string>] [<CommonParameters>]
```

## DESCRIPTION
The New-HTMLSummary function creates an HTML summary section with customizable content. It allows you to display a summary with a title, additional information, and summary items.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLSummary -SummaryItems {
    "Summary Item 1"
    "Summary Item 2"
} -Title "Summary Title" -TitleRight "Additional Info"
```

Creates a new HTML summary section with the title "Summary Title", displaying "Summary Item 1" and "Summary Item 2" as summary items, and additional information "Additional Info" on the right side of the title.

## PARAMETERS

### -SummaryItems
Specifies the script block containing the summary items to be displayed within the summary section.

```yaml
Type: ScriptBlock
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Title
Specifies the title of the summary section.

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

### -TitleRight
Specifies the additional information to be displayed on the right side of the title.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

