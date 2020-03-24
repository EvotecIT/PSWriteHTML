---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version:
schema: 2.0.0
---

# New-HTMLTableButtonPDF

## SYNOPSIS
Allows more control when adding buttons to Table

## SYNTAX

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Options are based on this URL: https://datatables.net/reference/button/pdfHtml5

## RELATED LINKS
