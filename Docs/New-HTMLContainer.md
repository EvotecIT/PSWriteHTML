---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLContainer
## SYNOPSIS
Creates a new HTML container element with customizable options.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLContainer [[-HTML] <scriptblock>] [-Width <Object>] [-Margin <string>] [-Density <string>] [-AnchorName <string>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new HTML container element with the specified options such as content, width, margin, and anchor name.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLContainer -HTML {
    // HTML content here
} -Width '50%' -Margin '10px' -AnchorName 'myAnchor'
```

Creates a new HTML container with custom HTML content, width of 50%, margin of 10px, and anchor name 'myAnchor'.

### EXAMPLE 2
```powershell
New-HTMLContainer -HTML {
    // More HTML content
}
```

Creates a new HTML container with additional HTML content and default width and margin.

## PARAMETERS

### -AnchorName
Specifies the anchor name for the container. If not provided, a random anchor name will be generated.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Density
Specifies the density of the panel. This will automatically enable responsive wrapping for the panel.
The options are: Spacious, Comfortable, Compact, Dense, VeryDense.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: Spacious, Comfortable, Compact, Dense, VeryDense

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HTML
Specifies the content to be placed inside the container as a ScriptBlock.

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

### -Margin
Specifies the margin of the container.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Width
Specifies the width of the container. Default is '100%'.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: 100%
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

