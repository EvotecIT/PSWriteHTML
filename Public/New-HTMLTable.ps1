function New-HTMLTable {
    [alias('Table', 'EmailTable')]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, Position = 0)][ScriptBlock] $HTML,
        [Parameter(Mandatory = $false, Position = 1)][ScriptBlock] $PreContent,
        [Parameter(Mandatory = $false, Position = 2)][ScriptBlock] $PostContent,
        [alias('ArrayOfObjects', 'Object', 'Table')][Array] $DataTable,
        [string[]][ValidateSet('copyHtml5', 'excelHtml5', 'csvHtml5', 'pdfHtml5', 'pageLength')] $Buttons = @('copyHtml5', 'excelHtml5', 'csvHtml5', 'pdfHtml5', 'pageLength'),
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
        [switch] $DisableNewLine,
        [switch] $ScrollX,
        [switch] $ScrollY,
        [int] $ScrollSizeY = 500,
        [int] $FreezeColumnsLeft,
        [int] $FreezeColumnsRight,
        [switch] $FixedHeader,
        [switch] $FixedFooter,
        [string[]] $ResponsivePriorityOrder,
        [int[]] $ResponsivePriorityOrderIndex,
        [string[]] $PriorityProperties,
        [alias('DataTableName')][string] $DataTableID,
        [switch] $ImmediatelyShowHiddenDetails,
        [alias('RemoveShowButton')][switch] $HideShowButton,
        [switch] $AllProperties,
        [switch] $SkipProperties,
        [switch] $Compare,
        [alias('CompareWithColors')][switch] $HighlightDifferences,
        [int] $First,
        [int] $Last,
        [alias('Replace')][Array] $CompareReplace,
        [alias('RegularExpression')][switch]$SearchRegularExpression,
        [ValidateSet('normal', 'break-all', 'keep-all','break-word')][string] $WordBreak = 'normal'
    )
    if (-not $Script:HTMLSchema.Features) {
        Write-Warning 'New-HTMLTable - Creation of HTML aborted. Most likely New-HTML is missing.'
        Exit
    }
    # Theme creator  https://datatables.net/manual/styling/theme-creator
    $ConditionalFormatting = [System.Collections.Generic.List[PSCustomObject]]::new()
    $CustomButtons = [System.Collections.Generic.List[PSCustomObject]]::new()
    $HeaderRows = [System.Collections.Generic.List[PSCustomObject]]::new()
    $HeaderStyle = [System.Collections.Generic.List[PSCustomObject]]::new()
    $HeaderTop = [System.Collections.Generic.List[PSCustomObject]]::new()
    $HeaderResponsiveOperations = [System.Collections.Generic.List[PSCustomObject]]::new()
    $ContentRows = [System.Collections.Generic.List[PSCustomObject]]::new()
    $ContentStyle = [System.Collections.Generic.List[PSCustomObject]]::new()
    $ContentTop = [System.Collections.Generic.List[PSCustomObject]]::new()
    $ContentFormattingInline = [System.Collections.Generic.List[PSCustomObject]]::new()
    $ReplaceCompare = [System.Collections.Generic.List[System.Collections.IDictionary]]::new()
    $RowGrouping = @{ }

    if ($HTML) {
        [Array] $Output = & $HTML

        if ($Output.Count -gt 0) {
            foreach ($Parameters in $Output) {
                if ($Parameters.Type -eq 'TableButtonPDF') {
                    $CustomButtons.Add($Parameters.Output)
                } elseif ($Parameters.Type -eq 'TableButtonCSV') {
                    $CustomButtons.Add($Parameters.Output)
                } elseif ($Parameters.Type -eq 'TableButtonPageLength') {
                    $CustomButtons.Add($Parameters.Output)
                } elseif ($Parameters.Type -eq 'TableButtonExcel') {
                    $CustomButtons.Add($Parameters.Output)
                } elseif ($Parameters.Type -eq 'TableButtonPDF') {
                    $CustomButtons.Add($Parameters.Output)
                } elseif ($Parameters.Type -eq 'TableButtonPrint') {
                    $CustomButtons.Add($Parameters.Output)
                } elseif ($Parameters.Type -eq 'TableButtonCopy') {
                    $CustomButtons.Add($Parameters.Output)
                } elseif ($Parameters.Type -eq 'TableCondition') {
                    $ConditionalFormatting.Add($Parameters.Output)
                } elseif ($Parameters.Type -eq 'TableHeaderMerge') {
                    $HeaderRows.Add($Parameters.Output)
                } elseif ($Parameters.Type -eq 'TableHeaderStyle') {
                    $HeaderStyle.Add($Parameters.Output)
                } elseif ($Parameters.Type -eq 'TableHeaderFullRow') {
                    $HeaderTop.Add($Parameters.Output)
                } elseif ($Parameters.Type -eq 'TableContentMerge') {
                    $ContentRows.Add($Parameters.Output)
                } elseif ($Parameters.Type -eq 'TableContentStyle') {
                    $ContentStyle.Add($Parameters.Output)
                } elseif ($Parameters.Type -eq 'TableContentFullRow') {
                    $ContentTop.Add($Parameters.Output)
                } elseif ($Parameters.Type -eq 'TableConditionInline') {
                    $ContentFormattingInline.Add($Parameters.Output)
                } elseif ($Parameters.Type -eq 'TableHeaderResponsiveOperations') {
                    $HeaderResponsiveOperations.Add($Parameters.Output)
                } elseif ($Parameters.Type -eq 'TableReplaceCompare') {
                    $ReplaceCompare.Add($Parameters.Output)
                } elseif ($Parameters.Type -eq 'TableRowGrouping') {
                    $RowGrouping = $Parameters.Output
                }
            }
        }
    }


    # Limit objects count First or Last
    if ($First -or $Last) {
        $DataTable = $DataTable | Select-Object -First $First -Last $Last
    }

    if ($Compare) {
        $Splitter = "`r`n"

        if ($ReplaceCompare) {
            foreach ($R in $CompareReplace) {
                $ReplaceCompare.Add($R)
            }
        }

        $DataTable = Compare-MultipleObjects -Objects $DataTable -Summary -Splitter $Splitter -FormatOutput -AllProperties:$AllProperties -SkipProperties:$SkipProperties -Replace $ReplaceCompare

        if ($HighlightDifferences) {
            $Highlight = for ($i = 0; $i -lt $DataTable.Count; $i++) {
                if ($DataTable[$i].Status -eq $false) {
                    # Different row
                    foreach ($DifferenceColumn in $DataTable[$i].Different) {
                        $DataSame = $DataTable[$i]."$DifferenceColumn-Same" -join $Splitter
                        $DataAdd = $DataTable[$i]."$DifferenceColumn-Add" -join $Splitter
                        $DataRemove = $DataTable[$i]."$DifferenceColumn-Remove" -join $Splitter

                        if ($DataSame -ne '') {
                            $DataSame = "$DataSame$Splitter"
                        }
                        if ($DataAdd -ne '') {
                            $DataAdd = "$DataAdd$Splitter"
                        }
                        if ($DataRemove -ne '') {
                            $DataRemove = "$DataRemove$Splitter"
                        }
                        $Text = New-HTMLText -Text $DataSame, $DataRemove, $DataAdd -Color Black, Red, Blue -TextDecoration none, line-through, none -FontWeight normal, bold, bold
                        New-TableContent -ColumnName "$DifferenceColumn" -RowIndex ($i + 1) -Text "$Text"
                    }
                } else {
                    # Same row
                    # New-TableContent -RowIndex ($i + 1) -BackGroundColor Green -Color White
                }
            }
        }
        $Properties = Select-Properties -Objects $DataTable -ExcludeProperty '*-*', 'Same', 'Different'
        $DataTable = $DataTable | Select-Object -Property $Properties

        if ($HighlightDifferences) {
            foreach ($Parameter in $Highlight.Output) {
                $ContentStyle.Add($Parameter)
            }
        }
    }

    if ($AllProperties) {
        $Properties = Select-Properties -Objects $DataTable -AllProperties:$AllProperties
        $DataTable = $DataTable | Select-Object -Property $Properties
    }

    # This is more direct way of PriorityProperties that will work also on Scroll and in other circumstances
    if ($PriorityProperties) {
        if ($DataTable.Count -gt 0) {
            $Properties = $DataTable[0].PSObject.Properties.Name
            # $Properties = Select-Properties -Objects $DataTable -AllProperties:$AllProperties
            $RemainingProperties = foreach ($Property in $Properties) {
                if ($PriorityProperties -notcontains $Property) {
                    $Property
                }
            }
            $BoundedProperties = $PriorityProperties + $RemainingProperties
            $DataTable = $DataTable | Select-Object -Property $BoundedProperties
        }
    }

    # This option disable paging if number of elements is less or equal count of elements in DataTable
    $PagingOptions = $PagingOptions | Sort-Object -Unique
    if ($DataTable.Count -le $PagingOptions[0]) {
        $DisablePaging = $true
    }

    # Building HTML Table / Script
    if (-not $DataTableID) {
        # Only define this if user failed to deliver as per https://github.com/EvotecIT/PSWriteHTML/issues/29
        $DataTableID = "DT-$(Get-RandomStringName -Size 8 -LettersOnly)" # this builds table ID
    }
    if ($null -eq $DataTable -or $DataTable.Count -eq 0) {
        #return ''
        $Filtering = $false # setting it to false because it's not nessecary
        $HideFooter = $true
        $DataTable = $TextWhenNoData
    }
    if ($DataTable[0] -is [System.Collections.IDictionary]) {
        Write-Verbose 'New-HTMLTable - Working with IDictionary'
        [Array] $TemporaryTable = foreach ($_ in $DataTable) {
            $_.GetEnumerator() | Select-Object Name, Value
        }
        [Array] $Table = $TemporaryTable | ConvertTo-Html -Fragment | Select-Object -SkipLast 1 | Select-Object -Skip 2 # This removes table tags (open/closing)
        #[Array] $Table = $($DataTable).GetEnumerator() | Select-Object Name, Value | ConvertTo-Html -Fragment | Select-Object -SkipLast 1 | Select-Object -Skip 2 # This removes table tags (open/closing)
    } elseif ($DataTable[0] -is [string]) {
        [Array] $Table = $DataTable | ForEach-Object { [PSCustomObject]@{ 'Name' = $_ } } | ConvertTo-Html -Fragment | Select-Object -SkipLast 1 | Select-Object -Skip 2
    } else {
        Write-Verbose 'New-HTMLTable - Working with Objects'
        [Array] $Table = $DataTable | ConvertTo-Html -Fragment | Select-Object -SkipLast 1 | Select-Object -Skip 2 # This removes table tags (open/closing)
    }
    [string] $Header = $Table | Select-Object -First 1 # this gets header
    [string[]] $HeaderNames = $Header -replace '</th></tr>' -replace '<tr><th>' -split '</th><th>'
    $AddedHeader = Add-TableHeader -HeaderRows $HeaderRows -HeaderNames $HeaderNames -HeaderStyle $HeaderStyle -HeaderTop $HeaderTop -HeaderResponsiveOperations $HeaderResponsiveOperations

    # This modifies Table content.
    # It basically goes thru every single row and checks if values to add styles or inline conditional formatting
    # It's heavier then JS, so use when nessecary
    if ($ContentRows.Capacity -gt 0 -or $ContentStyle.Count -gt 0 -or $ContentTop.Count -gt 0 -or $ContentFormattingInline.Count -gt 0) {
        $Table = Add-TableContent -ContentRows $ContentRows -ContentStyle $ContentStyle -ContentTop $ContentTop -ContentFormattingInline $ContentFormattingInline -Table $Table -HeaderNames $HeaderNames
    }


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
            F - FadeSeaerch
        #>
        dom              = 'Bfrtip'
        #buttons          = @($Buttons)
        buttons          = @(
            if ($CustomButtons) {
                $CustomButtons
            } else {
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
                        }
                    }
                }
            }
        )
        "searchFade"     = $false
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
            , @($PagingOptions + (-1))
            , @($PagingOptions + "All")
        )
        "ordering"       = -not $DisableOrdering.IsPresent
        "order"          = @() # this makes sure there's no default ordering upon start (usually it would be 1st column)
        "rowGroup"       = ''
        "info"           = -not $DisableInfo.IsPresent
        "procesing"      = -not $DisableProcessing.IsPresent
        "select"         = -not $DisableSelect.IsPresent
        "searching"      = -not $DisableSearch.IsPresent
        "stateSave"      = -not $DisableStateSave.IsPresent
    }
    if ($ScrollX) {
        $Options.'scrollX' = $true
        # disabling responsive table because it won't work with ScrollX
        $DisableResponsiveTable = $true
    }
    if ($ScrollY) {
        $Options.'scrollY' = "$($ScrollSizeY)px"
    }

    if ($FreezeColumnsLeft -or $FreezeColumnsRight) {
        $Options.fixedColumns = [ordered] @{ }
        if ($FreezeColumnsLeft) {
            $Options.fixedColumns.leftColumns = $FreezeColumnsLeft
        }
        if ($FreezeColumnsRight) {
            $Options.fixedColumns.rightColumns = $FreezeColumnsRight
        }
    }
    if ($FixedHeader -or $FixedFooter) {
        # Using FixedHeader/FixedFooter won't work with ScrollY.
        $Options.fixedHeader = [ordered] @{ }
        if ($FixedHeader) {
            $Options.fixedHeader.header = $FixedHeader.IsPresent
        }
        if ($FixedFooter) {
            $Options.fixedHeader.footer = $FixedFooter.IsPresent
        }
    }
    #}

    # this was due to: https://github.com/DataTables/DataTablesSrc/issues/143
    if (-not $DisableResponsiveTable) {
        $Options["responsive"] = @{ }
        $Options["responsive"]['details'] = @{ }
        if ($ImmediatelyShowHiddenDetails) {
            $Options["responsive"]['details']['display'] = '$.fn.dataTable.Responsive.display.childRowImmediate'
        }
        if ($HideShowButton) {
            $Options["responsive"]['details']['type'] = 'none' # this makes button invisible
        } else {
            $Options["responsive"]['details']['type'] = 'inline' # this adds a button
        }
    } else {
        # HideSHowButton doesn't work
        # ImmediatelyShowHiddenDetails doesn't work
        # Maybe I should communicate this??
        # Better would be with parametersets but don't want to play now
    }


    if ($OrderMulti) {
        $Options.orderMulti = $OrderMulti.IsPresent
    }
    if ($Find -ne '') {
        $Options.search = @{
            search = $Find
        }
    }

    [int] $RowGroupingColumnID = -1
    if ($RowGrouping.Count -gt 0) {
        if ($RowGrouping.Name) {
            $RowGroupingColumnID = ($HeaderNames).ToLower().IndexOf($RowGrouping.Name.ToLower())
        } else {
            $RowGroupingColumnID = $RowGrouping.ColumnID
        }
        if ($RowGroupingColumnID -ne -1) {
            $ColumnsOrder = , @($RowGroupingColumnID, $RowGrouping.Sorting)
            if ($DefaultSortColumn.Count -gt 0 -or $DefaultSortIndex.Count -gt 0) {
                Write-Warning 'New-HTMLTable - Row grouping sorting overwrites default sorting.'
            }
        } else {
            Write-Warning 'New-HTMLTable - Row grouping disabled. Column name/id not found.'
        }
    } else {
        # Sorting
        if ($DefaultSortOrder -eq 'Ascending') {
            $Sort = 'asc'
        } else {
            $Sort = 'desc'
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
        }
    }
    if ($ColumnsOrder.Count -gt 0) {
        $Options."order" = @($ColumnsOrder)
        # there seems to be a bug in ordering and colReorder plugin
        # Disabling colReorder
        $Options.colReorder = $false
    }

    # Overwriting table size - screen size in percent. With added Section/Panels it shouldn't be more than 90%
    if ($ScreenSizePercent -gt 0) {
        $Options."scrollY" = "$($ScreenSizePercent)vh"
    }
    if ($null -ne $ConditionalFormatting -and $ConditionalFormatting.Count -gt 0) {
        $Options.createdRow = ''
    }

    if ($ResponsivePriorityOrderIndex -or $ResponsivePriorityOrder) {

        $PriorityOrder = 0

        [Array] $PriorityOrderBinding = @(
            foreach ($_ in $ResponsivePriorityOrder) {
                $Index = [array]::indexof($HeaderNames.ToUpper(), $_.ToUpper())
                if ($Index -ne -1) {
                    @{ responsivePriority = 0; targets = $Index }
                }
            }
            foreach ($_ in $ResponsivePriorityOrderIndex) {
                @{ responsivePriority = 0; targets = $_ }
            }
        )
        $Options.columnDefs = @(
            foreach ($_ in $PriorityOrderBinding) {
                $PriorityOrder++
                $_.responsivePriority = $PriorityOrder
                $_
            }
        )
    }

    $Options = $Options | ConvertTo-Json -Depth 6

    # cleans up $Options for ImmediatelyShowHiddenDetails
    # Since it's JavaScript inside we're basically removing double quotes from JSON in favor of no quotes at all
    # Before: "display": "$.fn.dataTable.Responsive.display.childRowImmediate"
    # After: "display": $.fn.dataTable.Responsive.display.childRowImmediate
    $Options = $Options -replace '"(\$\.fn\.dataTable\.Responsive\.display\.childRowImmediate)"', '$1'

    # Process Conditional Formatting. Ugly JS building
    $Options = New-TableConditionalFormatting -Options $Options -ConditionalFormatting $ConditionalFormatting -Header $HeaderNames
    # Process Row Grouping. Ugly JS building
    if ($RowGroupingColumnID -ne -1) {
        $Options = Convert-TableRowGrouping -Options $Options -RowGroupingColumnID $RowGroupingColumnID
        $RowGroupingTop = Add-TableRowGrouping -DataTableName $DataTableID -Top -Settings $RowGrouping
        $RowGroupingBottom = Add-TableRowGrouping -DataTableName $DataTableID -Bottom -Settings $RowGrouping
    }

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
        $Script:HTMLSchema.Features.Jquery = $true
        $Script:HTMLSchema.Features.DataTables = $true
        $Script:HTMLSchema.Features.DataTablesPDF = $true
        $Script:HTMLSchema.Features.DataTablesExcel = $true
        #$Script:HTMLSchema.Features.DataTablesSearchFade = $true

        if ($ScrollX) {
            $TableAttributes = @{ id = $DataTableID; class = "$($Style -join ' ')"; width = '100%' }
        } else {
            $TableAttributes = @{ id = $DataTableID; class = "$($Style -join ' ')"; width = '100%' }
        }

        # Enable Custom Date fromat sorting
        $SortingFormatDateTime = Add-CustomFormatForDatetimeSorting -DateTimeSortingFormat $DateTimeSortingFormat
        $FilteringOutput = Add-TableFiltering -Filtering $Filtering -FilteringLocation $FilteringLocation -DataTableName $DataTableID -SearchRegularExpression:$SearchRegularExpression
        $FilteringTopCode = $FilteringOutput.FilteringTopCode
        $FilteringBottomCode = $FilteringOutput.FilteringBottomCode
        $LoadSavedState = Add-TableState -DataTableName $DataTableID -Filtering $Filtering -FilteringLocation $FilteringLocation -SavedState (-not $DisableStateSave)

        if ($Tab.Active -eq $true) {
            New-HTMLTag -Tag 'script' {
                @"
                `$(document).ready(function() {
                    $SortingFormatDateTime
                    $RowGroupingTop
                    $LoadSavedState
                    $FilteringTopCode
                    //  Table code
                    var table = `$('#$DataTableID').DataTable(
                        $($Options)
                    );
                    $FilteringBottomCode
                    $RowGroupingBottom
                });
"@
            }

        } else {
            [string] $TabName = $Tab.Id
            New-HTMLTag -Tag 'script' {
                @"
                    `$(document).ready(function() {
                        $SortingFormatDateTime
                        $RowGroupingTop
                        `$('.tabs').on('click', 'a', function (event) {
                            if (`$(event.currentTarget).attr("data-id") == "$TabName" && !$.fn.dataTable.isDataTable("#$DataTableID")) {
                                $LoadSavedState
                                $FilteringTopCode
                                //  Table code
                                var table = `$('#$DataTableID').DataTable(
                                    $($Options)
                                );
                                $FilteringBottomCode
                            };
                        });
                        $RowGroupingBottom
                    });
"@
            }
        }
    } else {
        $TableAttributes = @{ class = 'simplify' }
        $Script:HTMLSchema.Features.DataTablesSimplify = $true
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

    if ($RowGrouping.Attributes.Count -gt 0) {
        $RowGroupingCSS = ConvertTo-CSS -ID $DataTableID -ClassName 'tr.dtrg-group td' -Attributes $RowGrouping.Attributes -Group
    } else {
        $RowGroupingCSS = ''
    }
    New-HTMLTag -Tag 'div' -Attributes @{ class = 'flexElement overflowHidden' } -Value {
        $RowGroupingCSS
        $BeforeTableCode
        $BeforeTable
        # Build HTML TABLE

        if ($WordBreak -ne 'normal') {
            New-HTMLTag -Tag 'style' {
                ConvertTo-CSS -ClassName 'td' -ID $TableAttributes.id -Attributes @{ 'word-break' = $WordBreak }
            }
        }

        New-HTMLTag -Tag 'table' -Attributes $TableAttributes {
            New-HTMLTag -Tag 'thead' {
                if ($AddedHeader) {
                    $AddedHeader
                } else {
                    $Header
                }
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
