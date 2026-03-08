---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLImage
## SYNOPSIS
Creates IMG tag with image link or image bundled inline

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLImage [[-Source] <string>] [[-UrlLink] <uri>] [[-AlternativeText] <string>] [[-Class] <string>] [[-Target] <string>] [[-Width] <Object>] [[-Height] <Object>] [-Inline] [-DisableCache] [<CommonParameters>]
```

## DESCRIPTION
Creates IMG tag with image link or image bundled inline

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLImage -Source 'https://evotec.pl/image.png' -UrlLink 'https://evotec.pl/' -AlternativeText 'My other text' -Class 'otehr' -Width '100%'
```

## PARAMETERS

### -AlternativeText
Specifies an alternate text for the image, if the image for some reason cannot be displayed

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

### -Class
Overwrites default CSS settings for links

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: logo
Accept pipeline input: False
Accept wildcard characters: True
```

### -DisableCache
{{ Fill DisableCache Description }}

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

### -Height
Height of an image (optional)

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Inline
Inserts given Image URL/File directly into HTML

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

### -Source
Link to an image or file path to an image

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

### -Target
The target attribute specifies where to open the linked document.

- _blank	Opens the linked document in a new window or tab
- _self	Opens the linked document in the same frame as it was clicked (this is default)
- _parent	Opens the linked document in the parent frame
- _top	Opens the linked document in the full body of the window

Additionally framename can be given. Default is _blank

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 4
Default value: _blank
Accept pipeline input: False
Accept wildcard characters: True
```

### -UrlLink
Specifies the URL of the page the link goes to when user clicks an image

```yaml
Type: Uri
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Width
Width of an image (optional)

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
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

