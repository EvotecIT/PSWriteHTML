---
title: "Build custom HTML tags"
description: "A small PSWriteHTML example that shows how to emit hand-crafted meta tags and control the page head."
layout: docs
---

This example is useful when you want to mix PSWriteHTML with explicit HTML tag generation rather than staying only on the high-level report helpers.

It comes from the source example at `Examples/Example-BuildingTags/Example-Tags.ps1`.

## When to use this pattern

- You need exact control over `meta` tags or other low-level HTML output.
- You are building a custom page shell before adding richer sections later.
- You want to understand how PSWriteHTML composes individual tags.

## Example

```powershell
Import-Module .\PSWriteHTML.psd1 -Force

New-HTMLTag -Tag 'meta' -Attributes @{ charset = "utf-8" } -NoClosing
New-HTMLTag -Tag 'meta' -Attributes @{ name = 'viewport'; content = 'width=device-width, initial-scale=1' } -NoClosing
New-HTMLTag -Tag 'meta' -Attributes @{ 'http-equiv' = "Content-Type"; content = "text/html; charset=utf-8" } -NoClosing
```

## What this demonstrates

- emitting self-managed tags directly from PowerShell
- controlling the page head without dropping into a separate template system
- mixing declarative PSWriteHTML commands with precise HTML output

## Source

- [Example-BuildingTags/Example-Tags.ps1](https://github.com/EvotecIT/PSWriteHTML/blob/master/Examples/Example-BuildingTags/Example-Tags.ps1)
