---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLAccordion
## SYNOPSIS
Creates a new HTML accordion element with customizable options.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLAccordion [[-AccordionItem] <scriptblock>] [[-Duration] <int>] [-CollapseOnClick] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new HTML accordion element with the specified accordion item content, duration of animation, and option to collapse on click.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLAccordion -AccordionItem { "Accordion Content Here" } -Duration 500 -CollapseOnClick
Creates a new HTML accordion with the specified content, animation duration of 500 milliseconds, and collapses on click.
```

## PARAMETERS

### -AccordionItem
Specifies the content of the accordion item as a script block.

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

### -CollapseOnClick
Indicates whether the accordion should collapse when clicked.

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

### -Duration
Specifies the duration of the accordion animation in milliseconds.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: 0
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

