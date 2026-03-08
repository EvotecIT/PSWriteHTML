---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-CarouselSlide
## SYNOPSIS
Creates a new carousel slide with specified content, background color, and height.

## SYNTAX
### __AllParameterSets
```powershell
New-CarouselSlide [[-SlideContent] <scriptblock>] [[-BackgroundColor] <string>] [[-Height] <Object>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new carousel slide with the provided content, background color, and height. The slide content is specified using a script block, the background color is a string representing a color, and the height is a numerical value.

## EXAMPLES

### EXAMPLE 1
```powershell
New-CarouselSlide -SlideContent { "This is the content of the slide" } -BackgroundColor 'blue' -Height 200
```

Creates a new carousel slide with the specified content, background color 'blue', and height of 200 pixels.

## PARAMETERS

### -BackgroundColor
The background color of the slide specified as a string.

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

### -Height
The height of the slide.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -SlideContent
The script block containing the content to be displayed on the slide.

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

