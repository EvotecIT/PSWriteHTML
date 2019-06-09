function New-HTMLTable {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, Position = 0)][ScriptBlock] $HTML,
        [Parameter(Mandatory = $false, Position = 1)][ScriptBlock] $PreContent,
        [Parameter(Mandatory = $false, Position = 2)][ScriptBlock] $PostContent,
        [alias('ArrayOfObjects', 'Object', 'Table')][Array] $DataTable,
        [string[]][ValidateSet('copyHtml5', 'excelHtml5', 'csvHtml5', 'pdfHtml5')] $Buttons = @('copyHtml5', 'excelHtml5', 'csvHtml5', 'pdfHtml5'),
        [string[]][ValidateSet('numbers', 'simple', 'simple_numbers', 'full', 'full_numbers', 'first_last_numbers')] $PagingStyle = 'full_numbers',
        [int[]]$PagingOptions = @(15, 25, 50, 100),
        [switch]$DisablePaging,
        [switch]$DisableOrdering,
        [switch]$DisableInfo,
        [switch]$HideFooter,
        [switch]$DisableColumnReorder,
        [switch]$DisableProcessing,
        [switch]$DisableResponsiveTable,
        [switch]$DisableSelect,
        [switch]$DisableStateSave,
        [switch]$DisableSearch,
        [switch]$ScrollCollapse,
        [switch]$OrderMulti,
        [switch]$Filtering,
        [ValidateSet('Top', 'Bottom', 'Both')][string]$FilteringLocation = 'Bottom',
        [string[]][ValidateSet('display', 'cell-border', 'compact', 'hover', 'nowrap', 'order-column', 'row-border', 'stripe')] $Style = @('display', 'compact'),
        [switch]$Simplify,
        [string]$TextWhenNoData = 'No data available.',
        [int] $ScreenSizePercent = 0,
        [string[]] $DefaultSortColumn,
        [int[]] $DefaultSortIndex,
        [ValidateSet('Ascending', 'Descending')][string] $DefaultSortOrder = 'Ascending',
        [string[]] $DateTimeSortingFormat,
        [alias('Search')][string]$Find,
        [switch] $InvokeHTMLTags,
        [switch] $DisableNewLine
    )
    if (-not $Script:HTMLSchema.Features) {
        Write-Warning 'New-HTMLTable - Creation of HTML aborted. Most likely New-HTML is missing.'
        Exit
    }
    # Theme creator  https://datatables.net/manual/styling/theme-creator

    # Providing a way for conditional formatting and other types of HTML

    [Array] $Output = $HTML.Ast.EndBlock.Statements.Extent
    [Array] $OutputText = foreach ($Line in $Output) { [string] $Line + [System.Environment]::NewLine }

    $ConditionalFormattingText = foreach ($Line in $OutputText) {
        if ($Line.StartsWith('New-HTMLTableCondition') -or $Line.StartsWith('TableConditionalFormatting')) {
            $Line
        }
    }
    $OtherHTMLText = foreach ($Line in $OutputText) {
        if ((-not $Line.StartsWith('New-HTMLTableCondition')) -and (-not $Line.StartsWith('TableConditionalFormatting'))) {
            $Line
        }
    }
    if ($ConditionalFormattingText.Count -gt 0) {
        $ConditionalFormatting = [scriptblock]::Create($ConditionalFormattingText)
    }
    if ($OtherHTMLText.Count -gt 0) {
        $OtherHTML = [scriptblock]::Create($OtherHTMLText)
    }

    # Building HTML Table / Script

    [string] $DataTableName = "DT-$(Get-RandomStringName -Size 8 -LettersOnly)" # this builds table ID
    if ($null -eq $DataTable -or $DataTable.Count -eq 0) {
        #return ''
        $DataTable = $TextWhenNoData
    }
    if ($DataTable[0] -is [System.Collections.IDictionary]) {
        Write-Verbose 'New-HTMLTable - Working with IDictionary'
        [Array ] $Table = $($DataTable).GetEnumerator() | Select-Object Name, Value | ConvertTo-Html -Fragment | Select-Object -SkipLast 1 | Select-Object -Skip 2 # This removes table tags (open/closing)
    } elseif ($DataTable[0] -is [string]) {
        [Array] $Table = $DataTable | ForEach-Object { [PSCustomObject]@{ 'Name' = $_ } } | ConvertTo-Html -Fragment | Select-Object -SkipLast 1 | Select-Object -Skip 2
    } else {
        Write-Verbose 'New-HTMLTable - Working with Objects'
        [Array] $Table = $DataTable | ConvertTo-Html -Fragment | Select-Object -SkipLast 1 | Select-Object -Skip 2 # This removes table tags (open/closing)
    }
    [string] $Header = $Table | Select-Object -First 1 # this gets header
    [string[]] $HeaderNames = $Header -replace '</th></tr>' -replace '<tr><th>' -split '</th><th>'
    $Table = $Table | Select-Object -Skip 1 # this gets actuall table content
    $Options = [ordered] @{
        <# DOM Definition: https://datatables.net/reference/option/dom
            l - length changing input control
            f - filtering input
            t - The table!
            i - Table information summary
            p - pagination control
            r - processing display element
            B - Buttons
            S - Select
        #>
        dom              = 'Bfrtip'
        #buttons          = @($Buttons)
        buttons          = @(
            foreach ($button in $Buttons) {
                if ($button -ne 'pdfHtml5') {
                    @{
                        extend = $button
                    }
                } else {
                    @{
                        extend      = 'pdfHtml5'
                        pageSize    = 'A3'
                        orientation = 'landscape'
                        #messageTop = 'PDF created by PDFMake with Buttons for DataTables.'
                        #download = 'open'
                    }
                }
            }
        )
        "colReorder"     = -not $DisableColumnReorder.IsPresent


        # https://datatables.net/examples/basic_init/scroll_y_dynamic.html
        "paging"         = -not $DisablePaging
        "scrollCollapse" = $ScrollCollapse.IsPresent

        <# Paging Type
            numbers - Page number buttons only
            simple - 'Previous' and 'Next' buttons only
            simple_numbers - 'Previous' and 'Next' buttons, plus page numbers
            full - 'First', 'Previous', 'Next' and 'Last' buttons
            full_numbers - 'First', 'Previous', 'Next' and 'Last' buttons, plus page numbers
            first_last_numbers - 'First' and 'Last' buttons, plus page numbers
        #>
        "pagingType"     = $PagingStyle
        "lengthMenu"     = @(
            @($PagingOptions, - 1)
            @($PagingOptions, "All")
        )
        "ordering"       = -not $DisableOrdering.IsPresent
        "order"          = @() # this makes sure there's no default ordering upon start (usually it would be 1st column)
        "info"           = -not $DisableInfo.IsPresent
        "procesing"      = -not $DisableProcessing.IsPresent
        "responsive"     = @{
            details = -not $DisableResponsiveTable.IsPresent
        }
        "select"         = -not $DisableSelect.IsPresent
        "searching"      = -not $DisableSearch.IsPresent
        "stateSave"      = -not $DisableStateSave.IsPresent
    }

    if ($OrderMulti) {
        $Options.orderMulti = $OrderMulti.IsPresent
    }
    if ($Find -ne '') {
        $Options.search = @{
            search = $Find
        }
    }

    # Sorting
    if ($DefaultSortOrder -eq 'Ascending') {
        $Sort = 'asc'
    } else {
        $Sort = 'dsc'
    }
    if ($DefaultSortColumn.Count -gt 0) {
        $ColumnsOrder = foreach ($Column in $DefaultSortColumn) {
            $DefaultSortingNumber = ($HeaderNames).ToLower().IndexOf($Column.ToLower())
            if ($DefaultSortingNumber -ne - 1) {
                , @($DefaultSortingNumber, $Sort)
            }
        }

    }
    if ($DefaultSortIndex.Count -gt 0 -and $DefaultSortColumn.Count -eq 0) {
        $ColumnsOrder = foreach ($Column in $DefaultSortIndex) {
            if ($Column -ne - 1) {
                , @($Column, $Sort)
            }
        }
        $Options."order" = @($ColumnsOrder)
        # there seems to be a bug in ordering and colReorder plugin
        # Disabling colReorder
        $Options.colReorder = $false
    }

    # Overwriting table size - screen size in percent. With added Section/Panels it shouldn't be more than 90%
    if ($ScreenSizePercent -gt 0) {
        $Options."scrollY" = "$($ScreenSizePercent)vh"
    }
    if ($null -ne $ConditionalFormatting) {
        #.Count -gt 0) {
        $Options.columnDefs = ''
    }
    $Options = $Options | ConvertTo-Json -Depth 6

    if ($null -ne $ConditionalFormatting) {
        $Conditional = Invoke-Command -ScriptBlock $ConditionalFormatting
    }
    # Process Conditional Formatting. Ugly JS building
    $Options = New-TableConditionalFormatting -Options $Options -ConditionalFormatting $Conditional -Header $HeaderNames


    [Array] $Tabs = ($Script:HTMLSchema.TabsHeaders | Where-Object { $_.Current -eq $true })
    if ($Tabs.Count -eq 0) {
        # There are no tabs in use, pretend there is only one Active Tab
        $Tab = @{ Active = $true }
    } else {
        # Get First Tab
        $Tab = $Tabs[0]
    }

    # return data
    if (-not $Simplify) {
        $Script:HTMLSchema.Features.DataTables = $true
        $Script:HTMLSchema.Features.DataTablesPDF = $true
        $Script:HTMLSchema.Features.DataTablesExcel = $true

        $TableAttributes = @{ id = $DataTableName; class = "$($Style -join ' ')" }

        # Enable Custom Date fromat sorting
        $SortingFormatDateTime = Add-CustomFormatForDatetimeSorting -DateTimeSortingFormat $DateTimeSortingFormat
        $FilteringOutput = Add-TableFiltering -Filtering $Filtering -FilteringLocation $FilteringLocation
        $FilteringTopCode = $FilteringOutput.FilteringTopCode
        $FilteringBottomCode = $FilteringOutput.FilteringBottomCode
        $LoadSavedState = Add-TableState -DataTableName $DataTableName -Filtering $Filtering -FilteringLocation $FilteringLocation -SavedState (-not $DisableStateSave)

        if ($Tab.Active -eq $true) {
            New-HTMlTag -Tag 'script' {
                @"
                `$(document).ready(function() {
                    $SortingFormatDateTime
                    $LoadSavedState
                    $FilteringTopCode
                    //  Table code
                    var table = `$('#$DataTableName').DataTable(
                        $($Options)
                    );
                    $FilteringBottomCode
                });
"@
            }
        } else {
            [string] $TabName = $Tab.Id
            New-HTMlTag -Tag 'script' {
                @"
                    `$(document).ready(function() {
                        $SortingFormatDateTime
                        `$('.tabs').on('click', 'a', function (event) {
                            if (`$(event.currentTarget).attr("data-id") == "$TabName" && !$.fn.dataTable.isDataTable("#$DataTableName")) {
                                $LoadSavedState
                                $FilteringTopCode
                                //  Table code
                                var table = `$('#$DataTableName').DataTable(
                                    $($Options)
                                );
                                $FilteringBottomCode
                            };
                        });
                    });
"@
            }
        }
    } else {
        $TableAttributes = @{ class = 'sortable' }
    }

    if ($InvokeHTMLTags) {
        # By default HTML tags are displayed, in this case we're converting tags into real tags
        $Table = $Table -replace '&lt;', '<' -replace '&gt;', '>' -replace '&amp;nbsp;', ' ' -replace '&quot;', '"' -replace '&#39;', "'"
    }
    if (-not $DisableNewLine) {
        # Finds new lines and adds HTML TAG BR
        #$Table = $Table -replace '(?m)\s+$', "`r`n<BR>"
        $Table = $Table -replace '(?m)\s+$', "<BR>"
    }

    if ($OtherHTML) {
        $BeforeTableCode = Invoke-Command -ScriptBlock $OtherHTML
    } else {
        $BeforeTableCode = ''
    }

    if ($PreContent) {
        $BeforeTable = Invoke-Command -ScriptBlock $PreContent
    } else {
        $BeforeTable = ''
    }
    if ($PostContent) {
        $AfterTable = Invoke-Command -ScriptBlock $PostContent
    } else {
        $AfterTable = ''
    }


    New-HTMLTag -Tag 'div' -Attributes @{ class = 'defaultPanelOther' } -Value {
        $BeforeTableCode
        $BeforeTable
        # Build HTML TABLE
        New-HTMLTag -Tag 'table' -Attributes $TableAttributes {
            New-HTMLTag -Tag 'thead' {
                $Header
            }
            New-HTMLTag -Tag 'tbody' {
                $Table
            }
            if (-not $HideFooter) {
                New-HTMLTag -Tag 'tfoot' {
                    $Header
                }
            }
        }
        $AfterTable
    }
}