---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLCodeBlock
## SYNOPSIS
Creates a new HTML code block with customizable settings for syntax highlighting.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLCodeBlock [-Code] <string> [[-Style] <string>] [[-Theme] <string>] [[-Group] <string>] [[-Title] <string>] [[-Highlight] <string[]>] [[-ShowLineNumbers] <bool>] [[-LineOffset] <string>] [<CommonParameters>]
```

## DESCRIPTION
This function creates a new HTML code block with customizable settings for syntax highlighting. It allows you to specify the code language, theme, group, title, line numbers visibility, highlighted lines, and line numbering offset.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTMLCodeBlock -Code "function greet() { return 'Hello, World!'; }" -Style 'javascript' -Theme 'monokai' -Group 'Functions' -Title 'Greeting Function' -Highlight 2,4-6 -ShowLineNumbers $true -LineOffset 1
```

Creates a new HTML code block displaying a JavaScript function with a custom theme, belonging to the 'Functions' group, titled 'Greeting Function', highlighting lines 2, 4 to 6, showing line numbers, and starting line numbering from 1.

### EXAMPLE 2
```powershell
New-HTMLCodeBlock -Code "for ($i = 0; $i -lt 5; $i++) { Write-Host $i }" -Style 'powershell' -Group 'Loops' -Title 'For Loop Example' -ShowLineNumbers $false
```

Creates a new HTML code block displaying a PowerShell for loop without line numbers, belonging to the 'Loops' group, titled 'For Loop Example'.

## PARAMETERS

### -Code
Specifies the code content to be displayed in the code block.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Group
Specifies the group to which the code block belongs.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Highlight
Specifies specific lines to highlight in the code block.

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

### -LineOffset
Specifies the starting line number offset for line numbering.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ShowLineNumbers
Indicates whether line numbers should be displayed in the code block.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Style
Specifies the language style for syntax highlighting. Default is 'powershell'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: assembly, asm, avrassembly, avrasm, c, cpp, c++, csharp, css, cython, cordpro, diff, docker, dockerfile, generic, standard, groovy, go, golang, html, ini, conf, java, js, javascript, jquery, mootools, ext.js, json, kotlin, less, lua, gfm, md, markdown, octave, matlab, nsis, php, powershell, prolog, py, python, raw, ruby, rust, scss, sass, shell, bash, sql, squirrel, swift, typescript, vhdl, visualbasic, vb, xml, yaml

Required: False
Position: 1
Default value: powershell
Accept pipeline input: False
Accept wildcard characters: True
```

### -Theme
Specifies the theme for the code block. Available themes include 'enlighter', 'beyond', 'classic', and more.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: enlighter, beyond, classic, godzilla, atomic, droide, minimal, eclipse, mowtwo, rowhammer, bootstrap4, dracula, monokai

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Title
Specifies the title of the code block.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 4
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

