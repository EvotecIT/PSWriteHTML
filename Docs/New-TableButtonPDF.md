---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version:
schema: 2.0.0
---

# New-TableButtonPDF

## SYNOPSIS
Allows more control when adding buttons to Table

## SYNTAX

```
New-TableButtonPDF [[-Title] <String>] [[-DisplayName] <String>] [[-MessageBottom] <String>]
 [[-MessageTop] <String>] [[-FileName] <String>] [[-Extension] <String>] [[-PageSize] <String>]
 [[-Orientation] <String>] [-Header] [-Footer] [<CommonParameters>]
```

## DESCRIPTION
Allows more control when adding buttons to Table.
Works only within Table or New-HTMLTable scriptblock.

## EXAMPLES

### EXAMPLE 1
```
Dashboard -Name 'Dashimo Test' -FilePath $PSScriptRoot\DashboardEasy05.html -Show {
```

Section -Name 'Test' -Collapsable {
        Container {
            Panel {
                Table -DataTable $Process {
                    TableButtonPDF
                    TableButtonCopy
                    TableButtonExcel
                } -Buttons @() -DisableSearch -DisablePaging -HideFooter
            }
            Panel {
                Table -DataTable $Process -Buttons @() -DisableSearch -DisablePaging -HideFooter
            }
            Panel {
                Table -DataTable $Process {
                    TableButtonPDF -PageSize A10 -Orientation landscape
                    TableButtonCopy
                    TableButtonExcel
                } -Buttons @() -DisableSearch -DisablePaging -HideFooter
            }
        }
    }
}

## PARAMETERS

### -Title
Document title (appears above the table in the generated PDF).
The special character * is automatically replaced with the value read from the host document's title tag.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DisplayName
The button's display text.
The text can be configured using this option

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MessageBottom
Message to be shown at the bottom of the table, or the caption tag if displayed at the bottom of the table.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MessageTop
Message to be shown at the top of the table, or the caption tag if displayed at the top of the table.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FileName
File name to give the created file (plus the extension defined by the extension option).
The special character * is automatically replaced with the value read from the host document's title tag.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Extension
The extension to give the created file name.
(default .pdf)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PageSize
Paper size for the created PDF.
This can be A3, A4, A5, LEGAL, LETTER or TABLOID.
Other options are available.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: A3
Accept pipeline input: False
Accept wildcard characters: False
```

### -Orientation
Paper orientation for the created PDF.
This can be portrait or landscape

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: Landscape
Accept pipeline input: False
Accept wildcard characters: False
```

### -Header
Indicate if the table header should be included in the exported data or not.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Footer
Indicate if the table footer should be included in the exported data or not.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Options are based on this URL: https://datatables.net/reference/button/pdfHtml5

## RELATED LINKS
