function Out-HtmlView {
    <#
    .SYNOPSIS
    Small function that allows to send output to HTML

    .DESCRIPTION
    Small function that allows to send output to HTML. When displaying in HTML it allows data to output to EXCEL, CSV and PDF. It allows sorting, searching and so on.

    .PARAMETER Table
    Data you want to display

    .PARAMETER Title
    Title of HTML Window

    .PARAMETER DefaultSortColumn
    Sort by Column Name

    .PARAMETER DefaultSortIndex
    Sort by Column Index

    .EXAMPLE
    Get-Process | Select-Object -First 5 | Out-HtmlView

    .NOTES
    General notes
    #>
    [alias('Out-GridHtml', 'ohv')]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, Position = 0)][ScriptBlock] $HTML,
        [Parameter(Mandatory = $false, Position = 1)][ScriptBlock] $PreContent,
        [Parameter(Mandatory = $false, Position = 2)][ScriptBlock] $PostContent,
        [alias('ArrayOfObjects', 'Object', 'DataTable')][Parameter(ValueFromPipeline = $true, Mandatory = $false)] $Table,
        [string] $FilePath,
        [string] $Title = 'Out-HTMLView',
        [switch] $PassThru,
        [string[]][ValidateSet('copyHtml5', 'excelHtml5', 'csvHtml5', 'pdfHtml5', 'pageLength', 'print', 'searchPanes', 'searchBuilder')] $Buttons = @('copyHtml5', 'excelHtml5', 'csvHtml5', 'pdfHtml5', 'pageLength', 'searchBuilder'),
        [string[]][ValidateSet('numbers', 'simple', 'simple_numbers', 'full', 'full_numbers', 'first_last_numbers')] $PagingStyle = 'full_numbers',
        [int[]]$PagingOptions = @(15, 25, 50, 100),
        [int] $PagingLength,
        [switch]$DisablePaging,
        [switch]$DisableOrdering,
        [switch]$DisableInfo,
        [switch]$HideFooter,
        [alias('DisableButtons')][switch]$HideButtons,
        [switch]$DisableProcessing,
        [switch]$DisableResponsiveTable,
        [switch]$DisableSelect,
        [switch]$DisableStateSave,
        [switch]$DisableSearch,
        [switch]$OrderMulti,
        [switch]$Filtering,
        [ValidateSet('Top', 'Bottom', 'Both')][string]$FilteringLocation = 'Bottom',
        [string[]][ValidateSet('display', 'cell-border', 'compact', 'hover', 'nowrap', 'order-column', 'row-border', 'stripe')] $Style = @('display', 'compact'),
        [switch]$Simplify,
        [string]$TextWhenNoData = 'No data available to display.',
        [int] $ScreenSizePercent = 0,
        [string[]] $DefaultSortColumn,
        [int[]] $DefaultSortIndex,
        [ValidateSet('Ascending', 'Descending')][string] $DefaultSortOrder = 'Ascending',
        [string[]] $DateTimeSortingFormat,
        [alias('Search')][string]$Find,
        [switch] $InvokeHTMLTags,
        [switch] $DisableNewLine,
        [switch] $EnableKeys,
        [switch] $EnableColumnReorder,
        [switch] $EnableRowReorder,
        [switch] $EnableAutoFill,
        [switch] $EnableScroller,
        [switch] $ScrollX,
        [switch] $ScrollY,
        [int] $ScrollSizeY = 500,
        [switch]$ScrollCollapse,
        [int] $FreezeColumnsLeft,
        [int] $FreezeColumnsRight,
        [switch] $FixedHeader,
        [switch] $FixedFooter,
        [string[]] $ResponsivePriorityOrder,
        [int[]] $ResponsivePriorityOrderIndex,
        [string[]] $PriorityProperties,
        [string[]] $IncludeProperty,
        [string[]] $ExcludeProperty,
        [switch] $ImmediatelyShowHiddenDetails,
        [alias('RemoveShowButton')][switch] $HideShowButton,
        [switch] $AllProperties,
        [switch] $SkipProperties,
        [switch] $Compare,
        [alias('CompareWithColors')][switch] $HighlightDifferences,
        [Array] $CompareNames,
        [int] $First,
        [int] $Last,
        [alias('Replace')][Array] $CompareReplace,
        [alias('RegularExpression')][switch]$SearchRegularExpression,
        [ValidateSet('normal', 'break-all', 'keep-all', 'break-word')][string] $WordBreak = 'normal',
        [switch] $AutoSize,
        [switch] $DisableAutoWidthOptimization,
        [switch] $SearchPane,
        [ValidateSet('top', 'bottom')][string] $SearchPaneLocation = 'top',
        [switch] $SearchBuilder,
        [ValidateSet('top', 'bottom')][string] $SearchBuilderLocation = 'top',
        [ValidateSet('HTML', 'JavaScript', 'AjaxJSON')][string] $DataStore,
        [switch] $Transpose,
        [switch] $PreventShowHTML,
        [switch] $Online,
        [string] $OverwriteDOM,
        [switch] $SearchHighlight,
        [switch] $AlphabetSearch,
        [switch] $FuzzySearch,
        [switch] $FuzzySearchSmartToggle,
        [switch] $FlattenObject
    )
    Begin {
        $DataTable = [System.Collections.Generic.List[Object]]::new()
        if ($FilePath -eq '') {
            $FilePath = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), "$($([System.IO.Path]::GetRandomFileName()).Split('.')[0]).html")
        }
    }
    Process {
        if ($null -ne $Table) {
            foreach ($T in $Table) {
                $DataTable.Add($T)
            }
        }
    }
    End {
        if ($null -ne $DataTable) {
            # HTML generation part
            New-HTML -FilePath $FilePath -Online:($Online.IsPresent) -TitleText $Title -ShowHTML:(-not $PreventShowHTML) {
                $newHTMLTableSplat = @{
                    DataTable                    = $DataTable
                    HideFooter                   = $HideFooter
                    Buttons                      = $Buttons
                    PagingStyle                  = $PagingStyle
                    PagingOptions                = $PagingOptions
                    DisablePaging                = $DisablePaging
                    DisableOrdering              = $DisableOrdering
                    DisableInfo                  = $DisableInfo
                    DisableProcessing            = $DisableProcessing
                    DisableResponsiveTable       = $DisableResponsiveTable
                    DisableSelect                = $DisableSelect
                    DisableStateSave             = $DisableStateSave
                    DisableSearch                = $DisableSearch
                    ScrollCollapse               = $ScrollCollapse
                    Style                        = $Style
                    TextWhenNoData               = $TextWhenNoData
                    ScreenSizePercent            = $ScreenSizePercent
                    HTML                         = $HTML
                    PreContent                   = $PreContent
                    PostContent                  = $PostContent
                    DefaultSortColumn            = $DefaultSortColumn
                    DefaultSortIndex             = $DefaultSortIndex
                    DefaultSortOrder             = $DefaultSortOrder
                    DateTimeSortingFormat        = $DateTimeSortingFormat
                    Find                         = $Find
                    OrderMulti                   = $OrderMulti
                    Filtering                    = $Filtering
                    FilteringLocation            = $FilteringLocation
                    InvokeHTMLTags               = $InvokeHTMLTags
                    DisableNewLine               = $DisableNewLine
                    ScrollX                      = $ScrollX
                    ScrollY                      = $ScrollY
                    ScrollSizeY                  = $ScrollSizeY
                    FreezeColumnsLeft            = $FreezeColumnsLeft
                    FreezeColumnsRight           = $FreezeColumnsRight
                    FixedHeader                  = $FixedHeader
                    FixedFooter                  = $FixedFooter
                    ResponsivePriorityOrder      = $ResponsivePriorityOrder
                    ResponsivePriorityOrderIndex = $ResponsivePriorityOrderIndex
                    PriorityProperties           = $PriorityProperties
                    AllProperties                = $AllProperties
                    SkipProperties               = $SkipProperties
                    Compare                      = $Compare
                    HighlightDifferences         = $HighlightDifferences
                    First                        = $First
                    Last                         = $Last
                    ImmediatelyShowHiddenDetails = $ImmediatelyShowHiddenDetails
                    Simplify                     = $Simplify
                    HideShowButton               = $HideShowButton
                    CompareReplace               = $CompareReplace
                    Transpose                    = $Transpose
                    SearchRegularExpression      = $SearchRegularExpression
                    WordBreak                    = $WordBreak
                    AutoSize                     = $AutoSize
                    DisableAutoWidthOptimization = $DisableAutoWidthOptimization
                    Title                        = $Title
                    SearchPane                   = $SearchPane
                    SearchPaneLocation           = $SearchPaneLocation
                    EnableScroller               = $EnableScroller
                    EnableKeys                   = $EnableKeys
                    EnableAutoFill               = $EnableAutoFill
                    EnableRowReorder             = $EnableRowReorder
                    EnableColumnReorder          = $EnableColumnReorder
                    HideButtons                  = $HideButtons
                    PagingLength                 = $PagingLength
                    DataStore                    = $DataStore
                    DisableColumnReorder         = $DisableColumnReorder
                    AlphabetSearch               = $AlphabetSearch
                    SearchBuilder                = $SearchBuilder
                    SearchBuilderLocation        = $SearchBuilderLocation
                    OverwriteDOM                 = $OverwriteDOM
                    IncludeProperty              = $IncludeProperty
                    ExcludeProperty              = $ExcludeProperty
                    FuzzySearch                  = $FuzzySearch
                    FuzzySearchSmartToggle       = $FuzzySearchSmartToggle
                    FlattenObject                = $FlattenObject
                    CompareNames                 = $CompareNames
                }
                Remove-EmptyValue -Hashtable $newHTMLTableSplat
                New-HTMLTable @newHTMLTableSplat

            }
            if ($PassThru) {
                # This isn't really real PassThru but just passing final object further down the pipe when needed
                # real PassThru requires significant work - if you're up to it, let me know.
                $DataTable
            }
        } else {
            Write-Warning 'Out-HtmlView - No data available.'
        }
    }
}
