---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLSectionScrollingItem
## SYNOPSIS
Creates a new HTML section with scrolling functionality.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLSectionScrollingItem [[-Content] <scriptblock>] [[-SectionTitle] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new HTML section with scrolling functionality. It allows you to define the content and title of the section.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLSectionScrollingItem -SectionTitle "Introduction" -Content {
    "This is the introduction section."
}
Creates a new HTML section with the title "Introduction" and the content "This is the introduction section."
```

## PARAMETERS

### -Content
The script block containing the content to be displayed within the section.

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

### -SectionTitle
The title of the section.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

