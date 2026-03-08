---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLMarkdown
## SYNOPSIS
Creates HTML content from Markdown text with customizable options.

## SYNTAX
### FilePath (Default)
```powershell
New-HTMLMarkdown -FilePath <string> [-Id <string>] [-omitExtraWLInCodeBlocks] [-EnableStrikethrough] [-EnableEmoji] [-EnableBackslashEscapesHTMLTags] [-EnableMoreStyling] [-HeaderLevelStart <int>] [-EnableGithubCodeBlocks] [-EnableTaskLists] [-DisableTables] [-EnableSimpleLineBreaks] [-EnableRequireSpaceBeforeHeadingText] [-EnableEncodeEmails] [-EnableOpenLinksInNewWindow] [-EnableBackslashEscapes] [-SanitezeHTML] [-EnableTOC] [-Encoding <string>] [<CommonParameters>]
```

### ScriptBlock
```powershell
New-HTMLMarkdown [-ScriptBlock] <scriptblock> [-Id <string>] [-omitExtraWLInCodeBlocks] [-EnableStrikethrough] [-EnableEmoji] [-EnableBackslashEscapesHTMLTags] [-EnableMoreStyling] [-HeaderLevelStart <int>] [-EnableGithubCodeBlocks] [-EnableTaskLists] [-DisableTables] [-EnableSimpleLineBreaks] [-EnableRequireSpaceBeforeHeadingText] [-EnableEncodeEmails] [-EnableOpenLinksInNewWindow] [-EnableBackslashEscapes] [-SanitezeHTML] [-EnableTOC] [-Encoding <string>] [<CommonParameters>]
```

### Content
```powershell
New-HTMLMarkdown -Content <array> [-Id <string>] [-omitExtraWLInCodeBlocks] [-EnableStrikethrough] [-EnableEmoji] [-EnableBackslashEscapesHTMLTags] [-EnableMoreStyling] [-HeaderLevelStart <int>] [-EnableGithubCodeBlocks] [-EnableTaskLists] [-DisableTables] [-EnableSimpleLineBreaks] [-EnableRequireSpaceBeforeHeadingText] [-EnableEncodeEmails] [-EnableOpenLinksInNewWindow] [-EnableBackslashEscapes] [-SanitezeHTML] [-EnableTOC] [-Encoding <string>] [<CommonParameters>]
```

## DESCRIPTION
The New-HTMLMarkdown function converts Markdown text to HTML content with various customization options such as strikethrough, emojis, code block styling, table of contents, and more.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLMarkdown -FilePath "C:\Markdown\example.md" -EnableStrikethrough -EnableEmoji -EnableTOC
```

Converts the Markdown content from the file "example.md" to HTML with strikethrough, emojis, and a table of contents.

### EXAMPLE 2
```powershell
$MarkdownContent = @("## Title", "This is a **bold** text.")
New-HTMLMarkdown -Content $MarkdownContent -EnableMoreStyling -EnableTaskLists
```

Converts the Markdown content in the array with additional styling and task list support.

## PARAMETERS

### -Content
Specifies an array of Markdown content to convert.

```yaml
Type: Array
Parameter Sets: Content
Aliases: 
Possible values: 

Required: True
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -DisableTables
Switch parameter to disable table rendering.

```yaml
Type: SwitchParameter
Parameter Sets: FilePath, ScriptBlock, Content
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -EnableBackslashEscapes
Switch parameter to enable backslash escapes.

```yaml
Type: SwitchParameter
Parameter Sets: FilePath, ScriptBlock, Content
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -EnableBackslashEscapesHTMLTags
Switch parameter to enable backslash escapes for HTML tags.

```yaml
Type: SwitchParameter
Parameter Sets: FilePath, ScriptBlock, Content
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -EnableEmoji
Switch parameter to enable emoji support.

```yaml
Type: SwitchParameter
Parameter Sets: FilePath, ScriptBlock, Content
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -EnableEncodeEmails
Switch parameter to enable email encoding.

```yaml
Type: SwitchParameter
Parameter Sets: FilePath, ScriptBlock, Content
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -EnableGithubCodeBlocks
Switch parameter to enable GitHub-style code blocks.

```yaml
Type: SwitchParameter
Parameter Sets: FilePath, ScriptBlock, Content
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -EnableMoreStyling
Switch parameter to enable additional styling options.

```yaml
Type: SwitchParameter
Parameter Sets: FilePath, ScriptBlock, Content
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -EnableOpenLinksInNewWindow
Switch parameter to open links in a new window.

```yaml
Type: SwitchParameter
Parameter Sets: FilePath, ScriptBlock, Content
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -EnableRequireSpaceBeforeHeadingText
Switch parameter to require space before heading text.

```yaml
Type: SwitchParameter
Parameter Sets: FilePath, ScriptBlock, Content
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -EnableSimpleLineBreaks
Switch parameter to enable simple line breaks.

```yaml
Type: SwitchParameter
Parameter Sets: FilePath, ScriptBlock, Content
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -EnableStrikethrough
Switch parameter to enable strikethrough styling.

```yaml
Type: SwitchParameter
Parameter Sets: FilePath, ScriptBlock, Content
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -EnableTaskLists
Switch parameter to enable task lists in Markdown.

```yaml
Type: SwitchParameter
Parameter Sets: FilePath, ScriptBlock, Content
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -EnableTOC
Switch parameter to enable table of contents generation.

```yaml
Type: SwitchParameter
Parameter Sets: FilePath, ScriptBlock, Content
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -Encoding
Specifies the encoding for reading the Markdown content file. Default is 'UTF8'.

```yaml
Type: String
Parameter Sets: FilePath, ScriptBlock, Content
Aliases: 
Possible values: 

Required: False
Position: named
Default value: UTF8
Accept pipeline input: False
Accept wildcard characters: True
```

### -FilePath
Specifies the path to a file containing Markdown content to convert.

```yaml
Type: String
Parameter Sets: FilePath
Aliases: 
Possible values: 

Required: True
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HeaderLevelStart
Specifies the starting header level for Markdown content.

```yaml
Type: Int32
Parameter Sets: FilePath, ScriptBlock, Content
Aliases: 
Possible values: 

Required: False
Position: named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -Id
Specifies the ID attribute for the HTML container.

```yaml
Type: String
Parameter Sets: FilePath, ScriptBlock, Content
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -omitExtraWLInCodeBlocks
Switch parameter to omit extra whitespace in code blocks.

```yaml
Type: SwitchParameter
Parameter Sets: FilePath, ScriptBlock, Content
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -SanitezeHTML
Switch parameter to sanitize HTML content.

```yaml
Type: SwitchParameter
Parameter Sets: FilePath, ScriptBlock, Content
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -ScriptBlock
Specifies a script block containing Markdown content to convert.

```yaml
Type: ScriptBlock
Parameter Sets: ScriptBlock
Aliases: 
Possible values: 

Required: True
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

