---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# Add-HTMLStyle
## SYNOPSIS
Adds CSS styles to HTML documents.

## SYNTAX
### __AllParameterSets
```powershell
Add-HTMLStyle [[-Placement] <string>] [[-Resource] <IDictionary>] [[-ResourceComment] <string>] [[-Link] <string[]>] [[-Content] <string[]>] [[-FilePath] <string[]>] [[-Css] <IDictionary>] [[-ReplaceData] <IDictionary>] [[-RelType] <string>] [-AddComment] [-SkipTags] [<CommonParameters>]
```

## DESCRIPTION
The Add-HTMLStyle function allows you to add CSS styles to HTML documents in various ways such as inline styles, external stylesheets, and content from files or strings.

## EXAMPLES

### EXAMPLE 1
```powershell
Add-HTMLStyle -Placement 'Header' -Resource 'styles.css' -ResourceComment 'Custom styles' -Link 'https://example.com/styles.css'
```

Adds a linked CSS stylesheet to the header of the HTML document with a custom comment.

### EXAMPLE 2
```powershell
Add-HTMLStyle -Placement 'Inline' -Content 'body { background-color: lightblue; }' -ResourceComment 'Inline styles'
```

Adds inline CSS styles directly to the HTML document body with a custom comment.

### EXAMPLE 3
```powershell
Add-HTMLStyle -Placement 'Footer' -Css @{ 'body' = @{ 'background-color' = 'lightblue' } } -ResourceComment 'Custom CSS'
```

Converts a hashtable of CSS styles to a stylesheet and adds it to the footer of the HTML document with a custom comment.

## PARAMETERS

### -AddComment
Switch parameter to add comments around the added CSS styles.

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

### -Content
Specifies an array of CSS content to be added directly to the HTML document.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Css
Specifies a hashtable of CSS styles to be converted and added to the HTML document.

```yaml
Type: IDictionary
Parameter Sets: __AllParameterSets
Aliases: CssInline
Possible values: 

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FilePath
Specifies an array of file paths containing CSS content to be added to the HTML document.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Link
Specifies an array of URLs to external CSS stylesheets to be linked in the HTML document.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Placement
Specifies where the CSS styles should be placed in the HTML document. Valid values are 'Inline', 'Header', or 'Footer'. Default is 'Header'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: Inline, Header, Footer

Required: False
Position: 0
Default value: Header
Accept pipeline input: False
Accept wildcard characters: True
```

### -RelType
Specifies the relationship type for linked stylesheets. Valid values are 'dns-prefetch', 'preconnect', or 'preload'. Default is 'preload'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: dns-prefetch, preconnect, preload

Required: False
Position: 8
Default value: preload
Accept pipeline input: False
Accept wildcard characters: True
```

### -ReplaceData
Specifies a hashtable of data to be replaced in the CSS content.

```yaml
Type: IDictionary
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Resource
Specifies the resource to be added as CSS styles.

```yaml
Type: IDictionary
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ResourceComment
Specifies a comment for the resource being added.

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

### -SkipTags
Switch parameter to skip adding HTML tags when inserting CSS content.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

