---
title: "Build inline tabbed sections"
description: "Use PSWriteHTML tabs to group related tables and text into a compact HTML report."
layout: docs
---

This example is useful when a report has several related views and you do not want the reader to scroll through every table at once.

It is based on the tabbed report examples in `Examples/Example-TabsInline.ps1`.

## When to use this pattern

- You want one HTML report with several related views.
- You need to group tables, text, or diagrams without creating separate pages.
- You want the report to stay readable for operators and managers.

## Example

```powershell
Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {
    New-HTMLTabPanel {
        New-HTMLTab -Name 'Overview' {
            New-HTMLSection -HeaderText 'Summary' {
                New-HTMLTable -DataTable (Get-Process | Select-Object -First 5)
            }
        }

        New-HTMLTab -Name 'Details' {
            New-HTMLSection -HeaderText 'More data' {
                New-HTMLText -Text 'Add deeper operational details here.'
            }
        }
    }
} -Online -ShowHTML -FilePath "$PSScriptRoot\TabbedReport.html"
```

## What this demonstrates

- grouping related report sections without a long one-page scroll
- using tabs as a navigation pattern inside a generated HTML report
- mixing tables and explanatory text in the same report shell

## Source

- [Example-TabsInline.ps1](https://github.com/EvotecIT/PSWriteHTML/tree/master/Examples/Example-TabsInline.ps1)
