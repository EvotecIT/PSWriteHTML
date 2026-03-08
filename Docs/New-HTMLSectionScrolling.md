---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLSectionScrolling
## SYNOPSIS
Creates a new HTML section with scrolling functionality.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLSectionScrolling [[-Content] <scriptblock>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new HTML section with scrolling functionality. It takes a script block as input, executes the script block, and generates HTML output for each SectionScrollingItem.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLSectionScrolling -Content {
    [PSCustomObject]@{
        Type = 'SectionScrollingItem'
        HTMLOutput = '<p>Section 1</p>'
        ListEntry = 'Section 1'
    }
    [PSCustomObject]@{
        Type = 'SectionScrollingItem'
        HTMLOutput = '<p>Section 2</p>'
        ListEntry = 'Section 2'
    }
}
```

## PARAMETERS

### -Content
The script block containing the content to be displayed in the HTML section.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

