---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# Out-HtmlView
## SYNOPSIS
Small function that allows to send output to HTML

## SYNTAX
### __AllParameterSets
```powershell
Out-HtmlView [[-HTML] <scriptblock>] [[-PreContent] <scriptblock>] [[-PostContent] <scriptblock>] [-Table <Object>] [-FilePath <string>] [-Title <string>] [-PassThru] [-Buttons <string[]>] [-PagingStyle <string[]>] [-PagingOptions <int[]>] [-PagingLength <int>] [-DisablePaging] [-DisableOrdering] [-DisableInfo] [-HideFooter] [-HideButtons] [-DisableProcessing] [-DisableResponsiveTable] [-DisableSelect] [-DisableStateSave] [-DisableSearch] [-OrderMulti] [-Filtering] [-FilteringLocation <string>] [-Style <string[]>] [-Simplify] [-TextWhenNoData <string>] [-ScreenSizePercent <int>] [-DefaultSortColumn <string[]>] [-DefaultSortIndex <int[]>] [-DefaultSortOrder <string>] [-DateTimeSortingFormat <string[]>] [-Find <string>] [-InvokeHTMLTags] [-DisableNewLine] [-EnableKeys] [-EnableColumnReorder] [-EnableRowReorder] [-EnableAutoFill] [-EnableScroller] [-ScrollX] [-ScrollY] [-ScrollSizeY <int>] [-ScrollCollapse] [-FreezeColumnsLeft <int>] [-FreezeColumnsRight <int>] [-FixedHeader] [-FixedFooter] [-ResponsivePriorityOrder <string[]>] [-ResponsivePriorityOrderIndex <int[]>] [-PriorityProperties <string[]>] [-IncludeProperty <string[]>] [-ExcludeProperty <string[]>] [-ImmediatelyShowHiddenDetails] [-HideShowButton] [-AllProperties] [-SkipProperties] [-Compare] [-HighlightDifferences] [-CompareNames <array>] [-First <int>] [-Last <int>] [-CompareReplace <array>] [-SearchRegularExpression] [-WordBreak <string>] [-AutoSize] [-DisableAutoWidthOptimization] [-SearchPane] [-SearchPaneLocation <string>] [-SearchBuilder] [-SearchBuilderLocation <string>] [-DataStore <string>] [-Transpose] [-TransposeProperty <string>] [-TransposeName <string>] [-TransposeLegacy] [-PreventShowHTML] [-Online] [-OverwriteDOM <string>] [-SearchHighlight] [-AlphabetSearch] [-FuzzySearch] [-FuzzySearchSmartToggle] [-FlattenObject] [-PrettifyObject] [-PrettifyObjectSeparator <string>] [-PrettifyObjectDateTimeFormat <string>] [<CommonParameters>]
```

## DESCRIPTION
Small function that allows to send output to HTML. When displaying in HTML it allows data to output to EXCEL, CSV and PDF. It allows sorting, searching and so on.

## EXAMPLES

### EXAMPLE 1
```powershell
Get-Process | Select-Object -First 5 | Out-HtmlView
```

## PARAMETERS

### -AllProperties
{{ Fill AllProperties Description }}

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

### -AlphabetSearch
{{ Fill AlphabetSearch Description }}

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

### -AutoSize
{{ Fill AutoSize Description }}

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

### -Buttons
{{ Fill Buttons Description }}

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: copyHtml5, excelHtml5, csvHtml5, pdfHtml5, pageLength, print, searchPanes, searchBuilder

Required: False
Position: named
Default value: @('copyHtml5', 'excelHtml5', 'csvHtml5', 'pdfHtml5', 'pageLength', 'searchBuilder')
Accept pipeline input: False
Accept wildcard characters: True
```

### -Compare
{{ Fill Compare Description }}

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

### -CompareNames
{{ Fill CompareNames Description }}

```yaml
Type: Array
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -CompareReplace
{{ Fill CompareReplace Description }}

```yaml
Type: Array
Parameter Sets: __AllParameterSets
Aliases: Replace
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -DataStore
{{ Fill DataStore Description }}

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: HTML, JavaScript, AjaxJSON

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -DateTimeSortingFormat
{{ Fill DateTimeSortingFormat Description }}

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

### -DefaultSortColumn
Sort by Column Name

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

### -DefaultSortIndex
Sort by Column Index

```yaml
Type: Int32[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -DefaultSortOrder
{{ Fill DefaultSortOrder Description }}

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: Ascending, Descending

Required: False
Position: named
Default value: Ascending
Accept pipeline input: False
Accept wildcard characters: True
```

### -DisableAutoWidthOptimization
{{ Fill DisableAutoWidthOptimization Description }}

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

### -DisableInfo
{{ Fill DisableInfo Description }}

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

### -DisableNewLine
{{ Fill DisableNewLine Description }}

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

### -DisableOrdering
{{ Fill DisableOrdering Description }}

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

### -DisablePaging
{{ Fill DisablePaging Description }}

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

### -DisableProcessing
{{ Fill DisableProcessing Description }}

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

### -DisableResponsiveTable
{{ Fill DisableResponsiveTable Description }}

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

### -DisableSearch
{{ Fill DisableSearch Description }}

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

### -DisableSelect
{{ Fill DisableSelect Description }}

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

### -DisableStateSave
{{ Fill DisableStateSave Description }}

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

### -EnableAutoFill
{{ Fill EnableAutoFill Description }}

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

### -EnableColumnReorder
{{ Fill EnableColumnReorder Description }}

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

### -EnableKeys
{{ Fill EnableKeys Description }}

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

### -EnableRowReorder
{{ Fill EnableRowReorder Description }}

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

### -EnableScroller
{{ Fill EnableScroller Description }}

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

### -ExcludeProperty
{{ Fill ExcludeProperty Description }}

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

### -FilePath
{{ Fill FilePath Description }}

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

### -Filtering
{{ Fill Filtering Description }}

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

### -FilteringLocation
{{ Fill FilteringLocation Description }}

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: Top, Bottom, Both

Required: False
Position: named
Default value: Bottom
Accept pipeline input: False
Accept wildcard characters: True
```

### -Find
{{ Fill Find Description }}

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: Search
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -First
{{ Fill First Description }}

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

### -FixedFooter
{{ Fill FixedFooter Description }}

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

### -FixedHeader
{{ Fill FixedHeader Description }}

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

### -FlattenObject
{{ Fill FlattenObject Description }}

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

### -FreezeColumnsLeft
{{ Fill FreezeColumnsLeft Description }}

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

### -FreezeColumnsRight
{{ Fill FreezeColumnsRight Description }}

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

### -FuzzySearch
{{ Fill FuzzySearch Description }}

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

### -FuzzySearchSmartToggle
{{ Fill FuzzySearchSmartToggle Description }}

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

### -HideButtons
{{ Fill HideButtons Description }}

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: DisableButtons
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -HideFooter
{{ Fill HideFooter Description }}

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

### -HideShowButton
{{ Fill HideShowButton Description }}

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: RemoveShowButton
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -HighlightDifferences
{{ Fill HighlightDifferences Description }}

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: CompareWithColors
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -HTML
{{ Fill HTML Description }}

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

### -ImmediatelyShowHiddenDetails
{{ Fill ImmediatelyShowHiddenDetails Description }}

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

### -IncludeProperty
{{ Fill IncludeProperty Description }}

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

### -InvokeHTMLTags
{{ Fill InvokeHTMLTags Description }}

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

### -Last
{{ Fill Last Description }}

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

### -Online
{{ Fill Online Description }}

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

### -OrderMulti
{{ Fill OrderMulti Description }}

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

### -OverwriteDOM
{{ Fill OverwriteDOM Description }}

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

### -PagingLength
{{ Fill PagingLength Description }}

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

### -PagingOptions
{{ Fill PagingOptions Description }}

```yaml
Type: Int32[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: @(15, 25, 50, 100)
Accept pipeline input: False
Accept wildcard characters: True
```

### -PagingStyle
{{ Fill PagingStyle Description }}

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: numbers, simple, simple_numbers, full, full_numbers, first_last_numbers

Required: False
Position: named
Default value: full_numbers
Accept pipeline input: False
Accept wildcard characters: True
```

### -PassThru
{{ Fill PassThru Description }}

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

### -PostContent
{{ Fill PostContent Description }}

```yaml
Type: ScriptBlock
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -PreContent
{{ Fill PreContent Description }}

```yaml
Type: ScriptBlock
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -PrettifyObject
{{ Fill PrettifyObject Description }}

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

### -PrettifyObjectDateTimeFormat
{{ Fill PrettifyObjectDateTimeFormat Description }}

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

### -PrettifyObjectSeparator
{{ Fill PrettifyObjectSeparator Description }}

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: ,
Accept pipeline input: False
Accept wildcard characters: True
```

### -PreventShowHTML
{{ Fill PreventShowHTML Description }}

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

### -PriorityProperties
{{ Fill PriorityProperties Description }}

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

### -ResponsivePriorityOrder
{{ Fill ResponsivePriorityOrder Description }}

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

### -ResponsivePriorityOrderIndex
{{ Fill ResponsivePriorityOrderIndex Description }}

```yaml
Type: Int32[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ScreenSizePercent
{{ Fill ScreenSizePercent Description }}

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

### -ScrollCollapse
{{ Fill ScrollCollapse Description }}

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

### -ScrollSizeY
{{ Fill ScrollSizeY Description }}

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: 500
Accept pipeline input: False
Accept wildcard characters: True
```

### -ScrollX
{{ Fill ScrollX Description }}

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

### -ScrollY
{{ Fill ScrollY Description }}

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

### -SearchBuilder
{{ Fill SearchBuilder Description }}

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

### -SearchBuilderLocation
{{ Fill SearchBuilderLocation Description }}

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: top, bottom

Required: False
Position: named
Default value: top
Accept pipeline input: False
Accept wildcard characters: True
```

### -SearchHighlight
{{ Fill SearchHighlight Description }}

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

### -SearchPane
{{ Fill SearchPane Description }}

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

### -SearchPaneLocation
{{ Fill SearchPaneLocation Description }}

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: top, bottom

Required: False
Position: named
Default value: top
Accept pipeline input: False
Accept wildcard characters: True
```

### -SearchRegularExpression
{{ Fill SearchRegularExpression Description }}

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: RegularExpression
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -Simplify
{{ Fill Simplify Description }}

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

### -SkipProperties
{{ Fill SkipProperties Description }}

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

### -Style
{{ Fill Style Description }}

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: display, cell-border, compact, hover, nowrap, order-column, row-border, stripe

Required: False
Position: named
Default value: @('display', 'compact')
Accept pipeline input: False
Accept wildcard characters: True
```

### -Table
Data you want to display

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: ArrayOfObjects, Object, DataTable
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: True
```

### -TextWhenNoData
{{ Fill TextWhenNoData Description }}

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: No data available to display.
Accept pipeline input: False
Accept wildcard characters: True
```

### -Title
Title of HTML Window

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: Out-HTMLView
Accept pipeline input: False
Accept wildcard characters: True
```

### -Transpose
{{ Fill Transpose Description }}

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

### -TransposeLegacy
{{ Fill TransposeLegacy Description }}

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

### -TransposeName
{{ Fill TransposeName Description }}

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

### -TransposeProperty
{{ Fill TransposeProperty Description }}

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

### -WordBreak
{{ Fill WordBreak Description }}

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: normal, break-all, keep-all, break-word

Required: False
Position: named
Default value: normal
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

