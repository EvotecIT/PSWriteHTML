---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLTable
## SYNOPSIS
Creates a new HTML table with various customization options.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLTable [[-HTML] <scriptblock>] [[-PreContent] <scriptblock>] [[-PostContent] <scriptblock>] [-DataTable <array>] [-Title <string>] [-Buttons <string[]>] [-PagingStyle <string[]>] [-PagingOptions <int[]>] [-PagingLength <int>] [-DisablePaging] [-DisableOrdering] [-DisableInfo] [-HideFooter] [-HideButtons] [-DisableProcessing] [-DisableResponsiveTable] [-DisableSelect] [-DisableStateSave] [-DisableSearch] [-OrderMulti] [-Filtering] [-FilteringLocation <string>] [-Style <string[]>] [-Simplify] [-TextWhenNoData <string>] [-ScreenSizePercent <int>] [-DefaultSortColumn <string[]>] [-DefaultSortIndex <int[]>] [-DefaultSortOrder <string[]>] [-DateTimeSortingFormat <string[]>] [-Find <string>] [-InvokeHTMLTags] [-DisableNewLine] [-EnableKeys] [-EnableColumnReorder] [-EnableRowReorder] [-EnableAutoFill] [-EnableScroller] [-ScrollX] [-ScrollY] [-ScrollSizeY <int>] [-ScrollCollapse] [-FreezeColumnsLeft <int>] [-FreezeColumnsRight <int>] [-FixedHeader] [-FixedFooter] [-ResponsivePriorityOrder <string[]>] [-ResponsivePriorityOrderIndex <int[]>] [-PriorityProperties <string[]>] [-IncludeProperty <string[]>] [-ExcludeProperty <string[]>] [-ImmediatelyShowHiddenDetails] [-HideShowButton] [-AllProperties] [-SkipProperties] [-Compare] [-CompareNames <array>] [-HighlightDifferences] [-First <int>] [-Last <int>] [-CompareReplace <array>] [-SearchRegularExpression] [-WordBreak <string>] [-AutoSize] [-DisableAutoWidthOptimization] [-SearchPane] [-SearchPaneLocation <string>] [-SearchBuilder] [-SearchBuilderLocation <string>] [-DataStore <string>] [-DataTableID <string>] [-DataStoreID <string>] [-Transpose] [-TransposeProperty <string>] [-TransposeName <string>] [-TransposeLegacy] [-OverwriteDOM <string>] [-SearchHighlight] [-AlphabetSearch] [-FuzzySearch] [-FuzzySearchSmartToggle] [-FlattenObject] [-PrettifyObject] [-PrettifyObjectSeparator <string>] [-PrettifyObjectDateTimeFormat <string>] [-FlattenDepth <int>] [-Width <Object>] [<CommonParameters>]
```

## DESCRIPTION
This function generates an HTML table based on the provided data and allows for extensive customization using a wide range of parameters.

## EXAMPLES

### EXAMPLE 1
```powershell
$data = @(
    [PSCustomObject]@{ Name = 'John'; Age = 30 },
    [PSCustomObject]@{ Name = 'Jane'; Age = 25 }
)
New-HTMLTable -DataTable $data -Title 'User Information' -Buttons @('copyHtml5', 'excelHtml5') -PagingStyle 'full_numbers' -PagingOptions @(10, 25, 50) -DefaultSortColumn @('Name') -DefaultSortOrder @('Ascending')
```

## PARAMETERS

### -AllProperties
Displays all properties in the table.

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
Enables alphabet search.

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
Automatically sizes the table.

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
An array of buttons to be displayed in the table for actions like copying, exporting, and printing.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: copyHtml5, excelHtml5, csvHtml5, pdfHtml5, pageLength, print, searchPanes, searchBuilder, columnVisibility, toggleView

Required: False
Position: named
Default value: @('copyHtml5', 'excelHtml5', 'csvHtml5', 'pdfHtml5', 'pageLength', 'searchBuilder', 'toggleView')
Accept pipeline input: False
Accept wildcard characters: True
```

### -Compare
Compares data in the table.

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
Names to compare in the table.

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
Replaces data for comparison.

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
Stores data for the table.

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

### -DataStoreID
The ID of the data store.

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

### -DataTable
An array of objects containing the data to be displayed in the table.

```yaml
Type: Array
Parameter Sets: __AllParameterSets
Aliases: ArrayOfObjects, Object, Table
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -DataTableID
The ID of the data table.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: DataTableName
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -DateTimeSortingFormat
An array of date-time formats for sorting.

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
An array of default columns to sort by.

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
An array of default column indexes to sort by.

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
The default sort order (Ascending, Descending).

```yaml
Type: String[]
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
Disables auto width optimization.

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
Disables information display at the bottom of the table.

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
Disables new line characters in the table.

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
Disables column ordering in the table.

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
Disables pagination in the table.

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
Disables processing indicator in the table.

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
Disables responsiveness of the table.

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
Disables search functionality in the table.

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
Disables row selection in the table.

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
Disables saving the state of the table.

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
Enables auto-filling in the table.

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
Enables column reordering in the table.

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
Enables keyboard navigation in the table.

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
Enables row reordering in the table.

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
Enables table scrolling.

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
Properties to exclude from the table.

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

### -Filtering
Enables filtering in the table.

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
Specifies the location of the filter (Top, Bottom, Both).

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
Search string to find in the table.

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
Displays the first item in the table.

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
Fixes the footer of the table.

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
Fixes the header of the table.

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

### -FlattenDepth
The depth to flatten the object.

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

### -FlattenObject
Flattens the object for display.

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
The number of columns to freeze on the left.

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
The number of columns to freeze on the right.

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
Enables fuzzy search.

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
Toggles smart fuzzy search.

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
Hides all buttons in the table.

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
Hides the footer of the table.

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
Displays a button to show/hide details.

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
Highlights differences in the table.

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
The HTML content to be included before the table.

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
Shows hidden details immediately.

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
Properties to include in the table.

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
Enables HTML tags in the table.

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
Displays the last item in the table.

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

### -OrderMulti
Allows multiple column ordering in the table.

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
Overwrites the DOM structure.

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
The default number of items to display per page.

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
An array of options for the number of items to display per page.

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
The style of pagination to be used in the table.

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

### -PostContent
Additional content to be included after the table.

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
Additional content to be included before the table.

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
Forces object to be preprocessed before passing to HTML.
This is useful when converting object with arrays or when there is a need to display DateTime in different format.
This is mostly useful for email tables or when using DataStore HTML.

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
DateTime format for prettified object.

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
Define separator for prettified array object. Default is ", ".

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

### -PriorityProperties
Properties to prioritize in the table.

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
The priority order for responsiveness.

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
The index for responsive priority order.

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
The percentage of the screen width to occupy.

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
Collapses the table when scrolling.

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
The height of the vertical scroll.

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
Enables horizontal scrolling.

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
Enables vertical scrolling.

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
Enables search builder in the table.

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
Specifies the location of the search builder.

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
Highlights search results.

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
Enables search pane in the table.

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
Specifies the location of the search pane.

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
Enables regular expression search.

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
Simplifies the table layout.

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
Properties to skip in the table.

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
An array of styles to apply to the table.

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

### -TextWhenNoData
The text to display when no data is available.

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
The title of the HTML table.

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

### -Transpose
Transpose table. This is useful when you have objects and you want to transpose them.

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
Use old method of transposing table. This is useful when you have objects and you want to transpose them, using legacy method.

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
Name of the column that will be used per object to transpose table. By default it's "Object X", "Object Y", "Object Z" etc.

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
Transpose table based on property. By default it's "Object X". This makes sense if you have unique value per object that you want to transpose table based on.

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

### -Width
{{ Fill Width Description }}

```yaml
Type: Object
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
Enables word breaking in the table.

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

