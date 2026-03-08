---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLTag
## SYNOPSIS
Creates a new HTML tag with specified attributes and content.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLTag [[-Value] <scriptblock>] [-Tag] <string> [-Attributes <IDictionary>] [-SelfClosing] [-NoClosing] [-NewLine] [<CommonParameters>]
```

## DESCRIPTION
The New-HTMLTag function creates a new HTML tag with the specified tag name, attributes, and content. It supports self-closing tags, custom attributes, and new line formatting.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLTag -Tag "div" -Attributes @{ class = "container" } -Value { "Hello, World!" }
```

Creates a <div> tag with the class attribute set to "container" and the content "Hello, World!".

### EXAMPLE 2
```powershell
New-HTMLTag -Tag "img" -Attributes @{ src = "image.jpg"; alt = "Image" } -SelfClosing
```

Creates an <img> tag with the src and alt attributes set and is self-closing.

## PARAMETERS

### -Attributes
Specifies additional attributes for the HTML tag.

```yaml
Type: IDictionary
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -NewLine
Indicates whether a new line should be added after the HTML tag.

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

### -NoClosing
Indicates whether the HTML tag should not have a closing tag.

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

### -SelfClosing
Indicates whether the HTML tag is self-closing.

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

### -Tag
Specifies the name of the HTML tag to create.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Value
Specifies the content of the HTML tag as a script block.

```yaml
Type: ScriptBlock
Parameter Sets: __AllParameterSets
Aliases: Content
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

