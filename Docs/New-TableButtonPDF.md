---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-TableButtonPDF
## SYNOPSIS
Allows more control when adding buttons to Table

## SYNTAX
### __AllParameterSets
```powershell
New-TableButtonPDF [[-Title] <string>] [[-ButtonName] <string>] [[-MessageBottom] <string>] [[-MessageTop] <string>] [[-FileName] <string>] [[-Extension] <string>] [[-PageSize] <string>] [[-Orientation] <string>] [-Header] [-Footer] [<CommonParameters>]
```

## DESCRIPTION
Allows more control when adding buttons to Table. Works only within Table or New-HTMLTable scriptblock.

## EXAMPLES

### EXAMPLE 1
```powershell
Dashboard -Name 'Dashimo Test' -FilePath $PSScriptRoot\DashboardEasy05.html -Show {
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
```

## PARAMETERS

### -ButtonName
{{ Fill ButtonName Description }}

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: DisplayName
Possible values: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Extension
The extension to give the created file name. (default .pdf)

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FileName
File name to give the created file (plus the extension defined by the extension option). The special character * is automatically replaced with the value read from the host document's title tag.

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

### -Footer
Indicate if the table footer should be included in the exported data or not.

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

### -Header
Indicate if the table header should be included in the exported data or not.

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

### -MessageBottom
Message to be shown at the bottom of the table, or the caption tag if displayed at the bottom of the table.

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

### -MessageTop
Message to be shown at the top of the table, or the caption tag if displayed at the top of the table.

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

### -Orientation
Paper orientation for the created PDF. This can be portrait or landscape

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: portrait, landscape

Required: False
Position: 7
Default value: landscape
Accept pipeline input: False
Accept wildcard characters: True
```

### -PageSize
Paper size for the created PDF. This can be A3, A4, A5, LEGAL, LETTER or TABLOID. Other options are available.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 4A0, 2A0, A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, RA0, RA1, RA2, RA3, RA4, SRA0, SRA1, SRA2, SRA3, SRA4, EXECUTIVE, FOLIO, LEGAL, LETTER, TABLOID

Required: False
Position: 6
Default value: A3
Accept pipeline input: False
Accept wildcard characters: True
```

### -Title
Document title (appears above the table in the generated PDF). The special character * is automatically replaced with the value read from the host document's title tag.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

