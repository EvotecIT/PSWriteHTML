---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version:
schema: 2.0.0
---

# Out-HtmlView

## SYNOPSIS
Small function that allows to send output to HTML

## SYNTAX

```
Out-HtmlView [-Table] <Object> [[-PriorityProperties] <String[]>] [[-Title] <String>]
 [[-DefaultSortColumn] <String[]>] [[-DefaultSortIndex] <Int32[]>] [[-FilePath] <String>] [-DisablePaging]
 [-PassThru] [-Filtering] [[-FilteringLocation] <String>] [[-Find] <String>] [-InvokeHTMLTags]
 [-DisableNewLine] [<CommonParameters>]
```

## DESCRIPTION
Small function that allows to send output to HTML.
When displaying in HTML it allows data to output to EXCEL, CSV and PDF.
It allows sorting, searching and so on.

## EXAMPLES

### EXAMPLE 1
```
Get-Process | Select-Object -First 5 | Out-HtmlView
```

## PARAMETERS

### -Table
Data you want to display

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -PriorityProperties
{{ Fill PriorityProperties Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Title
Title of HTML Window

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: Out-HTMLView
Accept pipeline input: False
Accept wildcard characters: False
```

### -DefaultSortColumn
Sort by Column Name

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DefaultSortIndex
Sort by Column Index

```yaml
Type: Int32[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilePath
{{ Fill FilePath Description }}

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

### -DisablePaging
{{ Fill DisablePaging Description }}

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

### -PassThru
{{ Fill PassThru Description }}

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

### -Filtering
{{ Fill Filtering Description }}

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

### -FilteringLocation
{{ Fill FilteringLocation Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: Bottom
Accept pipeline input: False
Accept wildcard characters: False
```

### -Find
{{ Fill Find Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases: Search

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InvokeHTMLTags
{{ Fill InvokeHTMLTags Description }}

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

### -DisableNewLine
{{ Fill DisableNewLine Description }}

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
General notes

## RELATED LINKS
