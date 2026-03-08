---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLText
## SYNOPSIS
This function provides ability to add new text to the HTML file.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLText [[-TextBlock] <scriptblock>] [-Text <string[]>] [-Color <string[]>] [-BackGroundColor <string[]>] [-FontSize <Object[]>] [-LineHeight <string[]>] [-FontWeight <string[]>] [-FontStyle <string[]>] [-FontVariant <string[]>] [-FontFamily <string[]>] [-Alignment <string[]>] [-TextDecoration <string[]>] [-TextTransform <string[]>] [-Direction <string[]>] [-LineBreak] [-SkipParagraph] [-Display <string[]>] [-Opacity <double[]>] [<CommonParameters>]
```

## DESCRIPTION
This function provides ability to add new text to the HTML file, with colors, fonts and other styling features.
It is used to add text to the HTML file with proper styling and formatting.
Please keep in mind that if parameter is not provided the defaults will be used.
The defaults can be from the body itself, or from section or other parts of HTML depending on where the text is added.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTML -TitleText 'This is a test' -FilePath "$PSScriptRoot\Example34_01.html" {
    New-HTMLHeader {
        New-HTMLText -Text "Date of this report $(Get-Date)" -Color Blue -Alignment right
    }
    New-HTMLMain {
        New-HTMLTab -TabName 'Test' {
            New-HTMLSection -HeaderText '0 section' {
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter
                }
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter
                }
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter -Simplify
                }
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter
                }
            }
        }
        New-HTMLTab -TabName 'Test5' {
            New-HTMLSection -HeaderText '1 section' {
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter
                }
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter
                    # New-HTMLTable -DataTable $Processes -HideFooter
                }
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter
                }
            }
        }
    }
    New-HTMLFooter {
        New-HTMLText -Text "Date of this report $(Get-Date)" -Color Blue -Alignment right
    }
} -Online -ShowHTML
```

### EXAMPLE 2
```powershell
New-HTMLText
```

## PARAMETERS

### -Alignment
Provide alignment. When skipped the default alignment will be used. Options are: 'left', 'right', 'center', 'justify'

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: left, center, right, justify

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -BackGroundColor
Pick one of the 800 colors or provide a hex color code.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -Color
Pick one of the 800 colors or provide a hex color code.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -Direction
Provide direction. When skipped the direction will not be changed. Options are: 'rtl','ltr'. By default it's 'ltr'.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: rtl, ltr

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -Display
Allows configuring CSS display property. The display property specifies the display behavior (the type of rendering box) of an element.
Options are: 'none', 'inline', 'block', 'inline-block', 'contents','flex', 'grid', 'inline-flex', 'inline-grid', 'inline-table', 'list-item', 'run-in',
'table', 'table-caption', 'table-column-group', 'table-header-group', 'table-footer-group', 'table-row-group', 'table-cell', 'table-column', 'table-row'

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: none, inline, block, inline-block, contents, flex, grid, inline-flex, inline-grid, inline-table, list-item, run-in, table, table-caption, table-column-group, table-header-group, table-footer-group, table-row-group, table-cell, table-column, table-row

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontFamily
Provide font family. When skipped the default font family will be used.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontSize
Provide font size. When skipped the default font size will be used.

```yaml
Type: Object[]
Parameter Sets: __AllParameterSets
Aliases: Size
Possible values: 

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontStyle
Provide font style. When skipped the default font style will be used. Options are: 'normal', 'italic', 'oblique'

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, italic, oblique

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontVariant
Provide font variant. When skipped the default font variant will be used. Options are: 'normal', 'small-caps'

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, small-caps

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontWeight
Provide font weight. When skipped the default font weight will be used. Options are: 'normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900'

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, bold, bolder, lighter, 100, 200, 300, 400, 500, 600, 700, 800, 900

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -LineBreak
Decides whether to add line break at the end of the text or not.

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

### -LineHeight
Provide line height. When skipped the default line height will be used.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -Opacity
The opacity property sets the opacity level for an element. Value between 0 and 1. 1 is default.

```yaml
Type: Double[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -SkipParagraph
Skips adding div tag to make sure text is not wrapped in it. By default it wraps all text in div tag.

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

### -Text
Provide text or text array to be added to the HTML file.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextBlock
Defines ability to use text block instead of array

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

### -TextDecoration
Provide text decoration. When skipped the default text decoration will be used. Options are: 'none', 'line-through', 'overline', 'underline'

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: none, line-through, overline, underline

Required: False
Position: named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: True
```

### -TextTransform
Provide text transform. When skipped the default text transform will be used. Options are: 'uppercase', 'lowercase', 'capitalize'

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: uppercase, lowercase, capitalize

Required: False
Position: named
Default value: @()
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

