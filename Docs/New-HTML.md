---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTML
## SYNOPSIS
Building block for creating HTML elements. A starting point for all other cmdlets in PSWriteHTML except Out-HtmlView.

## SYNTAX
### __AllParameterSets
```powershell
New-HTML [[-HtmlData] <scriptblock>] [-Online] [-TitleText <string>] [-Author <string>] [-DateFormat <string>] [-AutoRefresh <int>] [-FilePath <string>] [-ShowHTML] [-Encoding <Object>] [-FavIcon <uri>] [-UseCssLinks] [-UseJavaScriptLinks] [-Temporary] [-AddComment] [-Format] [-Minify] [-Language <string>] [<CommonParameters>]
```

## DESCRIPTION
Building block for creating HTML elements. A starting point for all other cmdlets in PSWriteHTML except Out-HtmlView.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTML {
    New-HTMLSection -HeaderText 'Donut Charts - Defaults' -CanCollapse {
        New-HTMLPanel {
            New-HTMLChart {
                New-ChartToolbar -Download
                #New-ChartBarOptions -Gradient
                New-ChartLegend -Name 'Time', 'Money', 'Taxes', 'test'
                New-ChartBar -Name 'Test' -Value 1, 2, 3, 0
                New-ChartBar -Name 'Test1' -Value 2, 5, 7, 0
                New-ChartBar -Name 'Test2' -Value 3, 1, 50, 5
            }
        }
        New-HTMLPanel {
            New-HTMLChart {
                New-ChartToolbar -Download
                #New-ChartBarOptions -Gradient
                New-ChartLegend -Name 'Time', 'Money', 'Taxes' -Color Red, Yellow, Green
                New-ChartBar -Name 'Test' -Value 1, 2, 3
                New-ChartBar -Name 'Test1' -Value 2, 5, 7
                New-ChartBar -Name 'Test2' -Value 3, 1, 2
            }
        }
        New-HTMLPanel {
            New-HTMLChart {
                New-ChartToolbar -Download
                New-ChartBarOptions -Type barStacked
                New-ChartLegend -Name 'Time', 'Money', 'Taxes' -Color Red, Yellow, Green
                New-ChartBar -Name 'Test' -Value 1, 2, 3
                New-ChartBar -Name 'Test1' -Value 2, 5, 7
                New-ChartBar -Name 'Test2' -Value 3, 1, 2
            }
        }
    }
} -ShowHTML -FilePath $PSScriptRoot\Example-ChartBarNext.html -Online -Format
```

### EXAMPLE 2
```powershell
New-HTML -TitleText "Testing HideButtons" -Online -FilePath "$PSScriptRoot\Example7_06.html" {
    # Hide Buttons
    New-HTMLSection -HeaderText "Hide Buttons" -Content {
        New-HTMLTable -DataTable $Table -HideButtons
    }
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText "Hide Buttons" -Content {
            New-HTMLTable -DataTable $Table -HideButtons -Transpose
        }
        New-HTMLSection -HeaderText 'Some chart' {
            New-HTMLChart {
                New-ChartPie -Name 'Passed' -Value 5 -Color $ColorPassed
                New-ChartPie -Name 'Failed' -Value 10 -Color $ColorFailed
                New-ChartPie -Name 'Skipped' -Value 15 -Color $ColorSkipped
            }
        }
    }
    New-HTMLSection -HeaderText "Code used to generate above tables" -Content {
        New-HTMLCodeBlock {
            New-HTMLSection -HeaderText "Hide Buttons" -Content {
                New-HTMLTable -DataTable $Table -HideButtons
            }
```

New-HTMLSection -Invisible {
                New-HTMLSection -HeaderText "Hide Buttons" -Content {
                    New-HTMLTable -DataTable $Table -HideButtons -Transpose
                }
                New-HTMLSection -HeaderText 'Some chart' {
                    New-HTMLChart {
                        New-ChartPie -Name 'Passed' -Value 5 -Color $ColorPassed
                        New-ChartPie -Name 'Failed' -Value 10 -Color $ColorFailed
                        New-ChartPie -Name 'Skipped' -Value 15 -Color $ColorSkipped
                    }
                }
            }
        }
    }
} -ShowHTML

## PARAMETERS

### -AddComment
Adds additional commands to the generated HTML file. This is useful for tracking or knowing what is what.

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

### -Author
Defines the author information in the HTML file (meta information). If not specified, the author information is skipped.

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

### -AutoRefresh
Defines if the page should be refreshed automatically every X seconds.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: True
```

### -DateFormat
Defines the date format in the HTML file (meta information). Default is 'yyyy-MM-dd HH:mm:ss'

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: yyyy-MM-dd HH:mm:ss
Accept pipeline input: False
Accept wildcard characters: True
```

### -Encoding
Provides ability to choose encoding of the HTML file. Not really required to use, as UTF8 is the default. Options available: 'Unknown', 'String', 'Unicode', 'Byte', 'BigEndianUnicode', 'UTF8', 'UTF7', 'UTF32', 'Ascii', 'Default', 'Oem', 'BigEndianUTF32'

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: Unknown, String, Unicode, Byte, BigEndianUnicode, UTF8, UTF7, UTF32, Ascii, Default, Oem, BigEndianUTF32

Required: False
Position: named
Default value: UTF8
Accept pipeline input: False
Accept wildcard characters: True
```

### -FavIcon
Provides ability to add a favicon to the HTML page. Can be a link or file path

```yaml
Type: Uri
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FilePath
Provides the path to the file to be created.

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

### -Format
Formats HTML output (including CSS/JS). Requires PSParseHTML to be installed and available.

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

### -HtmlData
Provides ability to specify one or more elements within HTML. Using New-HTML without it, makes no larger sense.

```yaml
Type: ScriptBlock
Parameter Sets: __AllParameterSets
Aliases: Content
Possible values: 

Required: False
Position: 0
Default value: $(Throw "Have you put the open curly brace on the next line?")
Accept pipeline input: False
Accept wildcard characters: True
```

### -Language
{{ Fill Language Description }}

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: en
Accept pipeline input: False
Accept wildcard characters: True
```

### -Minify
Minifies HTML output (including CSS/JS). Requires PSParseHTML to be installed and available.

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

### -Online
Enables or Disables linking of CSS/JS. When Online is enabled that means that the CSS/JS files are loaded from the CDN. When Online is disabled that means that the CSS/JS files are all loaded from same HTML file (making it very large).

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

### -ShowHTML
Opens HTML in browser when generating of HTML is done. When no filepath is provided it uses temporary path instead. Good for testing.

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: Show, Open
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -Temporary
Forces use of temporary file name. Doesn't work with -FilePath parameter.

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

### -TitleText
Title of the HTML page

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: Name, Title
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -UseCssLinks
Deprecated - will be removed

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

### -UseJavaScriptLinks
{{ Fill UseJavaScriptLinks Description }}

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

