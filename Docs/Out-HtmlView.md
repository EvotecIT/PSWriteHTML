---
external help file:
Module Name:
online version:
schema: 2.0.0
---

# Out-HtmlView

## SYNOPSIS
Small function that allows to send output to HTML

## SYNTAX

```
Out-HtmlView [[-HTML] <ScriptBlock>] [[-PreContent] <ScriptBlock>] [[-PostContent] <ScriptBlock>]
 [-Table <Object>] [-FilePath <String>] [-Title <String>] [-PassThru] [-Buttons <String[]>]
 [-PagingStyle <String[]>] [-PagingOptions <Int32[]>] [-DisablePaging] [-DisableOrdering] [-DisableInfo]
 [-HideFooter] [-DisableColumnReorder] [-DisableProcessing] [-DisableResponsiveTable] [-DisableSelect]
 [-DisableStateSave] [-DisableSearch] [-ScrollCollapse] [-OrderMulti] [-Filtering]
 [-FilteringLocation <String>] [-Style <String[]>] [-Simplify] [-TextWhenNoData <String>]
 [-ScreenSizePercent <Int32>] [-DefaultSortColumn <String[]>] [-DefaultSortIndex <Int32[]>]
 [-DefaultSortOrder <String>] [-DateTimeSortingFormat <String[]>] [-Find <String>] [-InvokeHTMLTags]
 [-DisableNewLine] [-ScrollX] [-ScrollY] [-ScrollSizeY <Int32>] [-FreezeColumnsLeft <Int32>]
 [-FreezeColumnsRight <Int32>] [-FixedHeader] [-FixedFooter] [-ResponsivePriorityOrder <String[]>]
 [-ResponsivePriorityOrderIndex <Int32[]>] [-PriorityProperties <String[]>] [-ImmediatelyShowHiddenDetails]
 [-HideShowButton] [-AllProperties] [-SkipProperties] [-Compare] [-HighlightDifferences] [-First <Int32>]
 [-Last <Int32>] [-CompareReplace <Array>] [-PreventShowHTML] [-Online] [<CommonParameters>]
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

### -HTML
{{ Fill HTML Description }}

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PreContent
{{ Fill PreContent Description }}

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PostContent
{{ Fill PostContent Description }}

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Table
Data you want to display

```yaml
Type: Object
Parameter Sets: (All)
Aliases: ArrayOfObjects, Object, DataTable

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -FilePath
{{ Fill FilePath Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
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
Position: Named
Default value: Out-HTMLView
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

### -Buttons
{{ Fill Buttons Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: @('copyHtml5', 'excelHtml5', 'csvHtml5', 'pdfHtml5', 'pageLength')
Accept pipeline input: False
Accept wildcard characters: False
```

### -PagingStyle
{{ Fill PagingStyle Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Full_numbers
Accept pipeline input: False
Accept wildcard characters: False
```

### -PagingOptions
{{ Fill PagingOptions Description }}

```yaml
Type: Int32[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: @(15, 25, 50, 100)
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

### -DisableOrdering
{{ Fill DisableOrdering Description }}

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

### -DisableInfo
{{ Fill DisableInfo Description }}

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

### -HideFooter
{{ Fill HideFooter Description }}

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

### -DisableColumnReorder
{{ Fill DisableColumnReorder Description }}

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

### -DisableProcessing
{{ Fill DisableProcessing Description }}

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

### -DisableResponsiveTable
{{ Fill DisableResponsiveTable Description }}

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

### -DisableSelect
{{ Fill DisableSelect Description }}

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

### -DisableStateSave
{{ Fill DisableStateSave Description }}

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

### -DisableSearch
{{ Fill DisableSearch Description }}

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

### -ScrollCollapse
{{ Fill ScrollCollapse Description }}

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

### -OrderMulti
{{ Fill OrderMulti Description }}

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
Position: Named
Default value: Bottom
Accept pipeline input: False
Accept wildcard characters: False
```

### -Style
{{ Fill Style Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: @('display', 'compact')
Accept pipeline input: False
Accept wildcard characters: False
```

### -Simplify
{{ Fill Simplify Description }}

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

### -TextWhenNoData
{{ Fill TextWhenNoData Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: No data available.
Accept pipeline input: False
Accept wildcard characters: False
```

### -ScreenSizePercent
{{ Fill ScreenSizePercent Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
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
Position: Named
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
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DefaultSortOrder
{{ Fill DefaultSortOrder Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Ascending
Accept pipeline input: False
Accept wildcard characters: False
```

### -DateTimeSortingFormat
{{ Fill DateTimeSortingFormat Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
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
Position: Named
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

### -ScrollX
{{ Fill ScrollX Description }}

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

### -ScrollY
{{ Fill ScrollY Description }}

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

### -ScrollSizeY
{{ Fill ScrollSizeY Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 500
Accept pipeline input: False
Accept wildcard characters: False
```

### -FreezeColumnsLeft
{{ Fill FreezeColumnsLeft Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FreezeColumnsRight
{{ Fill FreezeColumnsRight Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FixedHeader
{{ Fill FixedHeader Description }}

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

### -FixedFooter
{{ Fill FixedFooter Description }}

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

### -ResponsivePriorityOrder
{{ Fill ResponsivePriorityOrder Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResponsivePriorityOrderIndex
{{ Fill ResponsivePriorityOrderIndex Description }}

```yaml
Type: Int32[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PriorityProperties
{{ Fill PriorityProperties Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ImmediatelyShowHiddenDetails
{{ Fill ImmediatelyShowHiddenDetails Description }}

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

### -HideShowButton
{{ Fill HideShowButton Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: RemoveShowButton

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -AllProperties
{{ Fill AllProperties Description }}

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

### -SkipProperties
{{ Fill SkipProperties Description }}

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

### -Compare
{{ Fill Compare Description }}

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

### -HighlightDifferences
{{ Fill HighlightDifferences Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: CompareWithColors

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -First
Gets only the specified number of objects. Enter the number of objects to get.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Last
{{ Fill Last Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -CompareReplace
{{ Fill CompareReplace Description }}

```yaml
Type: Array
Parameter Sets: (All)
Aliases: Replace

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PreventShowHTML
{{ Fill PreventShowHTML Description }}

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

### -Online
{{ Fill Online Description }}

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
