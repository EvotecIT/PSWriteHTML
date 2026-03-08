---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLTimeline
## SYNOPSIS
Creates a new HTML timeline with customizable content.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLTimeline [[-Content] <scriptblock>] [<CommonParameters>]
```

## DESCRIPTION
This function creates an HTML timeline with the specified content. The timeline can be used to display a sequence of events or steps in a visually appealing manner.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLTimeline -Content {
    New-HTMLTag -Tag 'div' -Attributes @{ class = 'event' } -Value { "Event 1" }
    New-HTMLTag -Tag 'div' -Attributes @{ class = 'event' } -Value { "Event 2" }
    New-HTMLTag -Tag 'div' -Attributes @{ class = 'event' } -Value { "Event 3" }
}
```

Creates an HTML timeline with three events.

## PARAMETERS

### -Content
Specifies the content of the HTML timeline as a script block.

```yaml
Type: ScriptBlock
Parameter Sets: __AllParameterSets
Aliases: TimeLineItems
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

