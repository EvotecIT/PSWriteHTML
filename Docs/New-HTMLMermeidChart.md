---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLMermeidChart
## SYNOPSIS
Creates a new HTML Mermaid chart.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLMermeidChart [[-Markdown] <scriptblock>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new HTML Mermaid chart based on the provided Markdown scriptblock.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLMermeidChart -Markdown { @"
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
"@ }
```

This example creates a simple flowchart with nodes A, B, C, and D connected by arrows.

## PARAMETERS

### -Markdown
The Markdown scriptblock containing the Mermaid chart definition.

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

