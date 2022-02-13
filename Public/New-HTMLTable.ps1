function New-HTMLTable {
    [alias('Table', 'EmailTable')]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, Position = 0)][ScriptBlock] $HTML,
        [Parameter(Mandatory = $false, Position = 1)][ScriptBlock] $PreContent,
        [Parameter(Mandatory = $false, Position = 2)][ScriptBlock] $PostContent,
        [alias('ArrayOfObjects', 'Object', 'Table')][Array] $DataTable,
        [string] $Title,
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
        [ValidateSet('Ascending', 'Descending')][string[]] $DefaultSortOrder = 'Ascending',
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
        [Array] $CompareNames,
        [alias('CompareWithColors')][switch] $HighlightDifferences,
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
        [alias('DataTableName')][string] $DataTableID,
        [string] $DataStoreID,
        [switch] $Transpose,
        [string] $OverwriteDOM,
        [switch] $SearchHighlight,
        [switch] $AlphabetSearch,
        [switch] $FuzzySearch,
        [switch] $FuzzySearchSmartToggle,
        [switch] $FlattenObject,
        [int] $FlattenDepth
    )
    if (-not $Script:HTMLSchema.Features) {
        Write-Warning 'New-HTMLTable - Creation of HTML aborted. Most likely New-HTML is missing.'
        Exit
    }
    $Script:HTMLSchema.Features.MainFlex = $true
    # Building HTML Table / Script
    if (-not $DataTableID) {
        # Only define this if user failed to deliver as per https://github.com/EvotecIT/PSWriteHTML/issues/29
        $DataTableID = "DT-$(Get-RandomStringName -Size 8 -LettersOnly)" # this builds table ID
    }
    # This makes sure we only load proper JS/CSS code when simplify is used
    if ($Simplify) {
        $Script:HTMLSchema['TableSimplify'] = $true
    } else {
        $Script:HTMLSchema['TableSimplify'] = $false
    }

    if ($HideFooter -and $Filtering -and $FilteringLocation -notin @('Both', 'Top')) {
        Write-Warning 'New-HTMLTable - Hiding footer while filtering is requested without specifying FilteringLocation to Top or Both.'
    }
    # There are 3 types of storage: HTML, JavaScript, File
    if ($DataStore -eq '') {
        if ($Script:HTMLSchema.TableOptions.DataStore) {
            # If DataStore is not picked locally, we use global value (assuming it's set)
            $DataStore = $Script:HTMLSchema.TableOptions.DataStore
        } else {
            # No global value, no local value, we set it default
            $DataStore = 'HTML'
        }
    }
    if ($DataStore -eq 'AjaxJSON') {
        if (-not $Script:HTMLSchema['TableOptions']['Folder']) {
            Write-Warning "New-HTMLTable - FilePath wasn't used in New-HTML. It's required for Hosted Solution."
            return
        }
    }
    if ($DataStoreID -and $DataStore -ne 'JavaScript') {
        Write-Warning "New-HTMLTable - Using DataStoreID is only supported if DataStore is JavaScript. It doesn't do anything without it"
    }

    # Theme creator  https://datatables.net/manual/styling/theme-creator
    $ConditionalFormatting = [System.Collections.Generic.List[PSCustomObject]]::new()
    $ConditionalFormattingInline = [System.Collections.Generic.List[PSCustomObject]]::new()
    $CustomButtons = [System.Collections.Generic.List[PSCustomObject]]::new()
    $HeaderRows = [System.Collections.Generic.List[PSCustomObject]]::new()
    $HeaderStyle = [System.Collections.Generic.List[PSCustomObject]]::new()
    $HeaderTop = [System.Collections.Generic.List[PSCustomObject]]::new()
    $HeaderResponsiveOperations = [System.Collections.Generic.List[PSCustomObject]]::new()
    $ContentRows = [System.Collections.Generic.List[PSCustomObject]]::new()
    $ContentStyle = [System.Collections.Generic.List[PSCustomObject]]::new()
    $ContentTop = [System.Collections.Generic.List[PSCustomObject]]::new()
    $ReplaceCompare = [System.Collections.Generic.List[System.Collections.IDictionary]]::new()
    $TableColumnOptions = [System.Collections.Generic.List[PSCustomObject]]::new()
    $TableEvents = [System.Collections.Generic.List[PSCustomObject]]::new()
    $TablePercentageBar = [System.Collections.Generic.List[PSCustomObject]]::new()
    $TableAlphabetSearch = [ordered]@{}
    $TableLanguage = [ordered]@{}

    # This will be used to store the colulmnDef option for the datatable
    $ColumnDefinitionList = [System.Collections.Generic.List[PSCustomObject]]::New()
    $RowGrouping = @{ }

    # This adds support for table of data provided as an array of arrays
    # Useful if you have Hashtable with nested arrays and you do $Hashtable.Values
    if ($DataTable.Count -gt 0) {
        if ($DataTable[0] -is [System.Collections.ICollection]) {
            $DataTable = foreach ($D in $DataTable) {
                $D
            }
        }
    }

    if ($Transpose) {
        # Allows easy conversion from PSCustomObject to Hashtable and vice versa
        $DataTable = Format-TransposeTable -Object $DataTable
    }
    if ($FlattenObject) {
        if ($FlattenDepth) {
            $DataTable = ConvertTo-FlatObject -Objects $DataTable -Depth $FlattenDepth
        } else {
            $DataTable = ConvertTo-FlatObject -Objects $DataTable
        }
    }

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
                } elseif ($Parameters.Type -eq 'TableButtonSearchBuilder') {
                    $CustomButtons.Add($Parameters.Output)
                } elseif ($Parameters.Type -eq 'TableCondition') {
                    $ConditionalFormatting.Add($Parameters.Output)
                } elseif ($Parameters.Type -eq 'TableConditionGroup') {
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
                    $ConditionalFormattingInline.Add($Parameters.Output)
                } elseif ($Parameters.Type -eq 'TableConditionGroupInline') {
                    $ConditionalFormattingInline.Add($Parameters.Output)
                } elseif ($Parameters.Type -eq 'TableHeaderResponsiveOperations') {
                    $HeaderResponsiveOperations.Add($Parameters.Output)
                } elseif ($Parameters.Type -eq 'TableReplaceCompare') {
                    $ReplaceCompare.Add($Parameters.Output)
                } elseif ($Parameters.Type -eq 'TableRowGrouping') {
                    $RowGrouping = $Parameters.Output
                } elseif ($Parameters.Type -eq 'TableColumnOption') {
                    $TableColumnOptions.Add($Parameters.Output)
                } elseif ($Parameters.Type -eq 'TableEvent') {
                    $TableEvents.Add($Parameters.Output)
                } elseif ($Parameters.Type -eq 'TablePercentageBar') {
                    $TablePercentageBar.Add($Parameters.Output)
                } elseif ($Parameters.Type -eq 'TableAlphabetSearch') {
                    $TableAlphabetSearch = $Parameters.Output
                } elseif ($Parameters.Type -eq 'TableLanguage') {
                    $TableLanguage = $Parameters.Output
                }
            }
        }
    }
    # Autosize removes $Width of 100%, which means it will fit the content rather then trying to fill the screen
    if (-not $AutoSize) {
        [string] $Width = '100%'
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

        $DataTable = Compare-MultipleObjects -Objects $DataTable -Summary -Splitter $Splitter -FormatOutput -AllProperties:$AllProperties -SkipProperties:$SkipProperties -Replace $ReplaceCompare -ExcludeProperty $ExcludeProperty -Property $IncludeProperty -ObjectsName $CompareNames

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
        $Properties = Select-Properties -Objects $DataTable -ExcludeProperty '*-Same','*-Add','*-Remove', 'Same', 'Different'
        $DataTable = $DataTable | Select-Object -Property $Properties

        if ($HighlightDifferences) {
            foreach ($Parameter in $Highlight.Output) {
                $ContentStyle.Add($Parameter)
            }
            $ConditionalFormatting.Add((New-TableCondition -Name "Status" -Operator eq -Value $true -ComparisonType bool -BackgroundColor MediumSpringGreen).Output)
            $ConditionalFormatting.Add((New-TableCondition -Name "Status" -Operator eq -Value $false -ComparisonType bool -BackgroundColor Salmon).Output)
            $ConditionalFormatting.Add((New-TableCondition -Name "Status" -Operator eq -Value '' -ComparisonType String -BackgroundColor Cumulus).Output)
        }
    }

    # this handles no data in Table - we want table to be minimalistic then with just 1 element
    # this also handles situation if first element is null, if that happens it assumes whole array is null and sets no data
    if ($null -ne $DataTable -and $null -eq $DataTable[0] -and $DataTable.Count -gt 0) {
        Write-Warning "New-HTMLTable - First element of array is null, but there are more elements in array. Reprocessing DataTable to remove null values."
        [Array] $DataTable = foreach ($D in $DataTable) {
            if ($null -ne $D) {
                $D
            }
        }
    }
    if ($null -eq $DataTable -or $DataTable.Count -eq 0) {
        $Filtering = $false # setting it to false because it's not nessecary
        $HideFooter = $true
        if ($TableLanguage -and $TableLanguage.emptyTable) {
            # emnpty table from language option
            [Array] $DataTable = $TableLanguage.emptyTable
            $TableLanguage.Remove('emptyTable')
        } else {
            [Array] $DataTable = $TextWhenNoData
        }
    }

    # we don't do anything for dictionaries, as dictionaries are displayed in two columns approach
    if ($DataTable[0] -isnot [System.Collections.IDictionary]) {
        if ($AllProperties) {
            $Properties = Select-Properties -Objects $DataTable -AllProperties:$AllProperties -Property $IncludeProperty -ExcludeProperty $ExcludeProperty
            if ($Properties -ne '*') {
                $DataTable = $DataTable | Select-Object -Property $Properties
            }
        } else {
            # JavaScript datastore is very picky for the inserted data so columns need to match for each object in array
            # SO if 1st object has 3 columns called X,Y,Z and 2nd object has X,Y,G we need to make sure we force 2nd object to have X,Y,Z (Z will be empty) and skip G
            # If you need need G as well you need to use AllProperties switch
            if ($DataStore -in 'JavaScript', 'AjaxJSON') {
                $Properties = Select-Properties -Objects $DataTable -Property $IncludeProperty -ExcludeProperty $ExcludeProperty
                if ($Properties -ne '*') {
                    $DataTable = $DataTable | Select-Object -Property $Properties
                }
            } else {
                if ($IncludeProperty -or $ExcludeProperty) {
                    $Properties = Select-Properties -Objects $DataTable -Property $IncludeProperty -ExcludeProperty $ExcludeProperty
                    if ($Properties -ne '*') {
                        $DataTable = $DataTable | Select-Object -Property $Properties
                    }
                }
            }
        }
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

    $Options = [ordered] @{
        'dom'            = $null
        "searchFade"     = $false
        # https://datatables.net/examples/basic_init/scroll_y_dynamic.html
        "scrollCollapse" = $ScrollCollapse.IsPresent
        "ordering"       = -not $DisableOrdering.IsPresent
        "order"          = @() # this makes sure there's no default ordering upon start (usually it would be 1st column)
        "rowGroup"       = ''
        "info"           = -not $DisableInfo.IsPresent
        "procesing"      = -not $DisableProcessing.IsPresent
        "select"         = -not $DisableSelect.IsPresent
        "searching"      = -not $DisableSearch.IsPresent
        "stateSave"      = -not $DisableStateSave.IsPresent
        "paging"         = -not $DisablePaging
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
    }
    if ($PagingLength) {
        # User made a choice for page length
        $Options['pageLength'] = $PagingLength
    } elseif ($PagingOptions[0] -ne 15) {
        # User didn't made a choice for page length, but user made a choice for paging options (default set by us is different)
        $Options['pageLength'] = $PagingOptions[0]
    }
    # Set DOM
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
        P - SearchPanes
        H - jQueryUI theme "header" classes (fg-toolbar ui-widget-header ui-corner-tl ui-corner-tr ui-helper-clearfix)
        F - jQueryUI theme "footer" classes (fg-toolbar ui-widget-header ui-corner-bl ui-corner-br ui-helper-clearfix)
        Q - SearchBuilder
    #>
    if ($TableLanguage) {
        $Options['language'] = $TableLanguage
    }
    if ($AlphabetSearch -or $TableAlphabetSearch.Count -gt 0) {
        $Script:HTMLSchema.Features.DataTablesSearchAlphabet = $true
    }
    if ($SearchBuilder) {
        $SearchBuilderEnabled = $true
        $Script:HTMLSchema.Features.DataTablesSearchBuilder = $true
    } else {
        $SearchBuilderEnabled = $false
    }
    if ($Buttons -contains 'searchBuilder') {
        # We make sure created storage is expanding
        $Script:HTMLSchema.Features.DataTablesSearchBuilder = $true
        $Script:HTMLSchema.Features.DataTablesSearchPanesButton = $true
        if ($SearchBuilderEnabled) {
            Write-Warning -Message "New-HTMLTable - Using SearchBuilder option and SearchBuilder button won't work properly. Only one will work. Disabling SearchBuiler."
            $SearchBuilderEnabled = $false
        }
    }
    if ($FuzzySearch -or $FuzzySearchSmartToggle) {
        $Script:HTMLSchema.Features.DataTablesFuzzySearch = $true
        if ($FuzzySearch) {
            if ($FuzzySearchSmartToggle) {
                $Options['fuzzySearch'] = @{
                    toggleSmart = $true
                }
            } else {
                $Options['fuzzySearch'] = $true
            }
        } else {
            $Options['fuzzySearch'] = @{
                toggleSmart = $true
            }
        }
    }
    if ($SearchPane) {
        $Script:HTMLSchema.Features.DataTablesSearchPanes = $true
    }
    if ($OverwriteDOM) {
        # We allow user to decide how DOM looks like
        $Options['dom'] = $OverwriteDOM
    } else {
        $DOM = 'Bfrtip'
        if ($AlphabetSearch -or $TableAlphabetSearch) {
            $DOM = "A$($Dom)"
        }
        if ($SearchBuilderEnabled -and $SearchPane) {
            if ($SearchPaneLocation -eq 'top' -and $SearchBuilderLocation -eq 'top') {
                $Options['dom'] = "QP$($DOM)"
            } elseif ($SearchPaneLocation -eq 'top' -and $SearchBuilderLocation -eq 'bottom') {
                $Options['dom'] = "P$($DOM)Q"
            } elseif ($SearchPaneLocation -eq 'bottom' -and $SearchBuilderLocation -eq 'top') {
                $Options['dom'] = "Q$($DOM)P"
            } elseif ($SearchPaneLocation -eq 'bottom' -and $SearchBuilderLocation -eq 'bottom') {
                $Options['dom'] = "$($DOM)QP"
            }
        } elseif ($SearchBuilderEnabled) {
            if ($SearchBuilderLocation -eq 'top') {
                $Options['dom'] = "Q$($DOM)"
            } else {
                $Options['dom'] = "$($DOM)Q"
            }
        } elseif ($SearchPane) {
            # it seems DataTablesSearchPanes is conflicting with Diagrams in IE 11, so we only enable it on demand
            if ($SearchPaneLocation -eq 'top') {
                $Options['dom'] = "P$($DOM)"
            } else {
                $Options['dom'] = "$($DOM)P"
            }
        } else {
            $Options['dom'] = "$($DOM)"
        }
    }
    if ($Buttons -contains 'searchPanes') {
        # it seems DataTablesSearchPanes is conflicting with Diagrams in IE 11, so we only enable it on demand
        $Script:HTMLSchema.Features.DataTablesSearchPanes = $true
        $Script:HTMLSchema.Features.DataTablesSearchPanesButton = $true
    }
    if ($EnableKeys) {
        $Script:HTMLSchema.Features.DataTablesKeyTable = $true
        $Options['keys'] = $true
        # More options to check # https://datatables.net/extensions/keytable/examples/
        #$Options['keys'] = @{
        #    blurable = $false
        #}
    }
    if ($EnableAutoFill) {
        $Script:HTMLSchema.Features.DataTablesAutoFill = $true
        $Options['autoFill'] = $true
    }
    if ($SearchHighlight) {
        $Script:HTMLSchema.Features.DataTablesSearchHighlight = $true
        $Options['searchHighlight'] = $true
    }
    # Prepare data for preprocessing. Convert Hashtable/Ordered Dictionary to their visual representation
    $Table = $null
    if ($DataTable[0] -is [System.Collections.IDictionary]) {
        [Array] $Table = foreach ($_ in $DataTable) {
            $_.GetEnumerator() | Select-Object Name, Value
        }
        $ObjectProperties = 'Name', 'Value'
    } elseif ($DataTable[0].GetType().Name -match 'bool|byte|char|datetime|decimal|double|ExcelHyperLink|float|int|long|sbyte|short|string|timespan|uint|ulong|URI|ushort') {
        [Array] $Table = $DataTable | ForEach-Object { [PSCustomObject]@{ 'Name' = $_ } }
        $ObjectProperties = 'Name'
    } else {
        [Array] $Table = $DataTable
        $ObjectProperties = $DataTable[0].PSObject.Properties.Name
    }

    if ($DataStore -eq 'HTML') {
        #  Standard way to build inline table

        # Since converting object with array inside with ConvertTo-HTML is useless we let the user ability to tell and fix that by joining it
        # it also deals with dates conversion
        if ($Script:HTMLSchema['TableOptions']['DataStoreOptions'].ArrayJoin -or $Script:HTMLSchema['TableOptions']['DataStoreOptions'].DateTimeFormat) {
            foreach ($Row in $Table) {
                foreach ($Name in $Row.PSObject.Properties.Name) {
                    if ($Script:HTMLSchema['TableOptions']['DataStoreOptions'].ArrayJoin -and $Row.$Name -is [Array]) {
                        $Row.$Name = $Row.$Name -join $Script:HTMLSchema['TableOptions']['DataStoreOptions'].ArrayJoinString
                    } elseif ($Script:HTMLSchema['TableOptions']['DataStoreOptions'].DateTimeFormat -and $Row.$Name -is [DateTime]) {
                        $Row.$Name = $($Row.$Name).ToString($Script:HTMLSchema['TableOptions']['DataStoreOptions'].DateTimeFormat)
                    }
                }
            }
        }
        $Table = $Table | ConvertTo-Html -Fragment | Select-Object -SkipLast 1 | Select-Object -Skip 2 # This removes table tags (open/closing)
        [string] $Header = $Table | Select-Object -First 1 # this gets header
        [string[]] $HeaderNames = $Header -replace '</th></tr>' -replace '<tr><th>' -split '</th><th>'
        if ($HeaderNames -eq '*') {
            # HeaderNames normally contain proper header names, however ConvertTo-HTML -Fragment in PowerShell 5.1 incorrectly sets it to *
            # PowerShell 7 works without issues. This is reproducible with [PSCustomObject]@{ 'Name' = 'Test' } | ConvertTo-Html -Fragment
            $Header = $Header.Replace('*', $ObjectProperties)
            $HeaderNames = $ObjectProperties
        }
        # This modifies Table content.
        # It basically goes thru every single row and checks if values to add styles or inline conditional formatting
        # It's heavier then JS, so use when nessecary
        if ($ContentRows.Capacity -gt 0 -or $ContentStyle.Count -gt 0 -or $ContentTop.Count -gt 0 -or $ConditionalFormattingInline.Count -gt 0) {
            $Table = Add-TableContent -ContentRows $ContentRows -ContentStyle $ContentStyle -ContentTop $ContentTop -ContentFormattingInline $ConditionalFormattingInline -Table $Table -HeaderNames $HeaderNames
        }
        $Table = $Table | Select-Object -Skip 1 # this gets actuall table content
    } elseif ($DataStore -eq 'AjaxJSON') {
        # this is hosted solution that only works on servers
        # this is a bit different so there's no full html building
        [string] $Header = $Table | ConvertTo-Html -Fragment | Select-Object -Skip 2 -First 1
        [string[]] $HeaderNames = $Header -replace '</th></tr>' -replace '<tr><th>' -split '</th><th>'
        if ($HeaderNames -eq '*') {
            # HeaderNames normally contain proper header names, however ConvertTo-HTML -Fragment in PowerShell 5.1 incorrectly sets it to *
            # PowerShell 7 works without issues. This is reproducible with [PSCustomObject]@{ 'Name' = 'Test' } | ConvertTo-Html -Fragment
            $Header = $Header.Replace('*', $ObjectProperties)
            $HeaderNames = $ObjectProperties
        }
        New-TableServerSide -DataTable $Table -DataTableID $DataTableID -Options $Options -HeaderNames $HeaderNames
        $Table = $null
    } elseif ($DataStore -eq 'JavaScript') {
        # This puts data as JavaScript Data field inline in html
        [string] $Header = $Table | ConvertTo-Html -Fragment | Select-Object -Skip 2 -First 1
        [string[]] $HeaderNames = $Header -replace '</th></tr>' -replace '<tr><th>' -split '</th><th>'
        if ($HeaderNames -eq '*') {
            # HeaderNames normally contain proper header names, however ConvertTo-HTML -Fragment in PowerShell 5.1 incorrectly sets it to *
            # PowerShell 7 works without issues. This is reproducible with [PSCustomObject]@{ 'Name' = 'Test' } | ConvertTo-Html -Fragment
            $Header = $Header.Replace('*', $ObjectProperties)
            $HeaderNames = $ObjectProperties
        }
        New-TableJavaScript -HeaderNames $HeaderNames -Options $Options
        # Due to ConvertTo-Json depth we can't insert data from Table to $Options here.
        # We need to wait and insert it after it's converted to JSON
    }

    # This modifies header adding styles, header rows, or doing some fancy stuff
    $AddedHeader = Add-TableHeader -HeaderRows $HeaderRows -HeaderNames $HeaderNames -HeaderStyle $HeaderStyle -HeaderTop $HeaderTop -HeaderResponsiveOperations $HeaderResponsiveOperations


    if ($TableAlphabetSearch.Count -gt 0) {
        $Options['alphabet'] = @{}
        if ($TableAlphabetSearch.caseSensitive) {
            $Options['alphabet']['caseSensitive'] = $true
        }
        if ($TableAlphabetSearch.numbers) {
            $Options['alphabet']['numbers'] = $true
        }
        if ($null -ne $TableAlphabetSearch.ColumnName) {
            $TableAlphabetSearch.ColumnID = ($HeaderNames).ToLower().IndexOf($TableAlphabetSearch.ColumnName.ToLower())
        }
        if ($null -ne $TableAlphabetSearch.ColumnID) {
            $Options['alphabet']['column'] = $TableAlphabetSearch.ColumnID
        }
    }

    if (-not $Script:HTMLSchema['TableSimplify'] -and -not $HideButtons) {
        $Script:HTMLSchema.Features.DataTablesButtons = $true
        $Options['buttons'] = @(
            if ($CustomButtons) {
                foreach ($Button in $CustomButtons) {
                    if (-not $Button.Title -and $Title) {
                        $Button.title = $Title
                    }
                    $Button
                }
            } else {
                foreach ($button in $Buttons) {
                    if ($button -eq 'pdfHtml5') {
                        $ButtonOutput = [ordered] @{
                            extend      = 'pdfHtml5'
                            pageSize    = 'A3'
                            orientation = 'landscape'
                            title       = $Title
                        }
                        $Script:HTMLSchema.Features.DataTablesButtonsPDF = $true
                    } elseif ($button -eq 'pageLength') {
                        if (-not $DisablePaging -and -not $ScrollY) {
                            $ButtonOutput = @{
                                extend = $button
                            }
                        } else {
                            $ButtonOutput = $null
                        }
                    } elseif ($button -eq 'excelHtml5') {
                        $Script:HTMLSchema.Features.DataTablesButtonsHTML5 = $true
                        $Script:HTMLSchema.Features.DataTablesButtonsExcel = $true
                        $ButtonOutput = [ordered] @{
                            extend        = $button
                            title         = $Title
                            exportOptions = @{
                                #columns = 'visible'
                                format = "findExportOptions"
                            }
                        }
                    } elseif ($button -eq 'copyHtml5') {
                        $Script:HTMLSchema.Features.DataTablesButtonsHTML5 = $true
                        $ButtonOutput = [ordered] @{
                            extend = $button
                            title  = $Title
                        }
                    } elseif ($button -eq 'csvHtml5') {
                        $Script:HTMLSchema.Features.DataTablesButtonsHTML5 = $true
                        $ButtonOutput = [ordered] @{
                            extend = $button
                            title  = $Title
                        }
                    } elseif ($button -eq 'searchPanes') {
                        $Script:HTMLSchema.Features.DataTablesSearchPanes = $true
                        $ButtonOutput = [ordered] @{
                            extend = $button
                            title  = $Title
                        }
                    } elseif ($button -eq 'print') {
                        $Script:HTMLSchema.Features.DataTablesButtonsPrint = $true
                        $ButtonOutput = [ordered] @{
                            extend = $button
                            title  = $Title
                        }
                    } elseif ($button -eq 'searchBuilder') {
                        $Script:HTMLSchema.Features.DataTablesSearchBuilder = $true
                        $ButtonOutput = [ordered] @{
                            extend = $button
                            title  = $Title
                            config = @{
                                #depthLimit = 2
                            }
                        }
                    } else {
                        $ButtonOutput = [ordered] @{
                            extend = $button
                            title  = $Title
                        }
                    }
                    if ($ButtonOutput) {
                        Remove-EmptyValue -Hashtable $ButtonOutput
                        $ButtonOutput
                    }
                }
            }
        )
    } else {
        $Options['buttons'] = @()
    }
    if ($ScrollX) {
        $Options.'scrollX' = $true
        # disabling responsive table because it won't work with ScrollX
        $DisableResponsiveTable = $true
    }
    if ($ScrollY -or $EnableScroller) {
        # Scroller only works if ScrollY is set
        $Options.'scrollY' = "$($ScrollSizeY)px"
    }
    if (-not $Script:HTMLSchema['TableSimplify'] -and $EnableScroller) {
        $Script:HTMLSchema.Features.DataTablesScroller = $true
        $Options['scroller'] = @{
            loadingIndicator = $true
        }
        #$Options['scroller'] = $true
    }
    if (-not $Script:HTMLSchema['TableSimplify'] -and $EnableRowReorder) {
        $Script:HTMLSchema.Features.DataTablesRowReorder = $true
        $Options['rowReorder'] = $true
    }

    if (-not $Script:HTMLSchema['TableSimplify'] -and ($FreezeColumnsLeft -or $FreezeColumnsRight)) {
        $Script:HTMLSchema.Features.DataTablesFixedColumn = $true
        $Options['fixedColumns'] = [ordered] @{ }
        if ($FreezeColumnsLeft) {
            $Options.fixedColumns.leftColumns = $FreezeColumnsLeft
        }
        if ($FreezeColumnsRight) {
            $Options.fixedColumns.rightColumns = $FreezeColumnsRight
        }
    }
    if (-not $Script:HTMLSchema['TableSimplify'] -and ($FixedHeader -or $FixedFooter)) {
        $Script:HTMLSchema.Features.DataTablesFixedHeader = $true
        # Using FixedHeader/FixedFooter won't work with ScrollY.
        # Setting any of those requires to set both of them to prevent one being enabled even if we only requested one
        $Options['fixedHeader'] = [ordered] @{
            header = $FixedHeader.IsPresent
            footer = $FixedFooter.IsPresent
        }
    }

    # this was due to: https://github.com/DataTables/DataTablesSrc/issues/143
    if (-not $Script:HTMLSchema['TableSimplify'] -and -not $DisableResponsiveTable) {
        $Script:HTMLSchema.Features.DataTablesResponsive = $true
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
        $SortingTranslate = [ordered] @{
            'Ascending'  = 'asc'
            'Descending' = 'dsc'
        }
        [Array] $TranslatedDefaultSortOrder = foreach ($Order in $DefaultSortOrder) {
            $SortingTranslate[$Order]
        }
        # Default Sorting
        $Sort = $TranslatedDefaultSortOrder[0]
        if ($DefaultSortColumn.Count -gt 0) {
            # Sorting by column name has priority, even if sort index is defined
            $ColumnsOrder = foreach ($Column in $DefaultSortColumn) {
                $DefaultSortingNumber = ($HeaderNames).ToLower().IndexOf($Column.ToLower())
                $ColumnSort = $Sort
                $ColumnSortIndex = $DefaultSortColumn.IndexOf( $Column )
                if ( $TranslatedDefaultSortOrder.count -ge 1 + $ColumnSortIndex ) {
                    $ColumnSort = $TranslatedDefaultSortOrder[ $ColumnSortIndex ]
                }
                if ($DefaultSortingNumber -ne -1) {
                    , @($DefaultSortingNumber, $ColumnSort)
                }
            }

        } elseif ($DefaultSortIndex.Count -gt 0) {
            # This will only happen if DefaultSortColumn is not filled
            $ColumnsOrder = foreach ($Column in $DefaultSortIndex) {
                $ColumnSort = $Sort
                $ColumnSortIndex = $DefaultSortIndex.IndexOf( $Column )
                if ( $TranslatedDefaultSortOrder.Count -ge 1 + $ColumnSortIndex ) {
                    $ColumnSort = $TranslatedDefaultSortOrder[ $ColumnSortIndex ]
                }
                if ($Column -ne -1) {
                    , @($Column, $ColumnSort)
                }
            }
        }
    }
    if ($ColumnsOrder.Count -gt 0) {
        $Options."order" = @($ColumnsOrder)
        # there seems to be a bug in ordering and colReorder plugin
        # Disabling colReorder
        #$Options.colReorder = $false
    }
    if (-not $Script:HTMLSchema['TableSimplify'] -and $EnableColumnReorder -and $ColumnsOrder.Count -eq 0) {
        $Script:HTMLSchema.Features.DataTablesColReorder = $true
        $Options["colReorder"] = $true
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
                    [pscustomobject]@{ responsivePriority = 0; targets = $Index }
                }
            }
            foreach ($_ in $ResponsivePriorityOrderIndex) {
                [pscustomobject]@{ responsivePriority = 0; targets = $_ }
            }
        )

        foreach ($_ in $PriorityOrderBinding) {
            $PriorityOrder++
            $_.responsivePriority = $PriorityOrder
            $ColumnDefinitionList.Add($_)
        }
    }

    # The table column options also adds to the columnDefs parameter
    If ($TableColumnOptions.Count -gt 0) {
        foreach ($_ in $TableColumnOptions) {
            $ColumnDefinitionList.Add($_)
        }
    }

    if ($TablePercentageBar.Count -gt 0) {
        $Script:HTMLSchema.Features.DataTablesPercentageBars = $true
        foreach ($Bar in $TablePercentageBar) {
            $ColumnDefinitionList.Add($(New-TablePercentageBarInternal @Bar))
        }
    }

    # If we have a column definition list defined, then set the columnDefs option
    If ($ColumnDefinitionList.Count -gt 0) {
        $Options.columnDefs = $ColumnDefinitionList.ToArray()
    }

    If ($DisableAutoWidthOptimization) {
        $Options.autoWidth = $false
    }

    $Options = $Options | ConvertTo-JsonLiteral -Depth 6 -AdvancedReplace @{ '.' = '\.'; '$' = '\$' }

    # cleans up $Options for ImmediatelyShowHiddenDetails
    # Since it's JavaScript inside we're basically removing double quotes from JSON in favor of no quotes at all
    # Before: "display": "$.fn.dataTable.Responsive.display.childRowImmediate"
    # After: "display": $.fn.dataTable.Responsive.display.childRowImmediate
    $Options = $Options -replace '"(\$\.fn\.dataTable\.Responsive\.display\.childRowImmediate)"', '$1'
    $Options = $Options -replace '"(\$\.fn\.dataTable\.render\.percentBar\(.+\))"', '$1'

    #
    $ExportExcelOptions = @'
    {
        body: function (data, row, column, node) {
            data = $('<p>' + data + '</p>').text(); return $.isNumeric(data.replace(',', '.')) ? data.replace(',', '.') : data;
        }
    }
'@
    $Options = $Options.Replace('"findExportOptions"', $ExportExcelOptions)

    if ($DataStore -eq 'JavaScript') {
        # Since we only want first level of data from DataTable we need to do it via string replacement.
        # ConvertTo-Json -Depth 6 from Options above would copy nested objects
        if ($DataStoreID) {
            # We decided we want to separate JS data from the table. This is useful for 2 reason
            # Data is pushed to footer and doesn't take place inside Body
            # Data can be reused in multiple tables for display purposes of same thing but in different table
            $Options = $Options.Replace('"markerForDataReplacement"', $DataStoreID)
            # We only add data if it isn't added yet
            if (-not $Script:HTMLSchema.CustomFooterJS[$DataStoreID]) {
                $DataToInsert = $Table | ConvertTo-JsonLiteral -Depth 0 -AdvancedReplace @{ '.' = '\.'; '$' = '\$' } `
                    -NumberAsString:$Script:HTMLSchema['TableOptions']['DataStoreOptions'].NumberAsString `
                    -BoolAsString:$Script:HTMLSchema['TableOptions']['DataStoreOptions'].BoolAsString `
                    -DateTimeFormat $Script:HTMLSchema['TableOptions']['DataStoreOptions'].DateTimeFormat `
                    -NewLineFormat $Script:HTMLSchema['TableOptions']['DataStoreOptions'].NewLineFormat -Force `
                    -ArrayJoin:$Script:HTMLSchema['TableOptions']['DataStoreOptions'].ArrayJoin `
                    -ArrayJoinString $Script:HTMLSchema['TableOptions']['DataStoreOptions'].ArrayJoinString
                if ($DataToInsert.StartsWith('[')) {
                    $Script:HTMLSchema.CustomFooterJS[$DataStoreID] = "var $DataStoreID = $DataToInsert;"
                } else {
                    $Script:HTMLSchema.CustomFooterJS[$DataStoreID] = "var $DataStoreID = [$DataToInsert];"
                }
            }

        } else {
            $DataToInsert = $Table | ConvertTo-JsonLiteral -Depth 0 -AdvancedReplace @{ '.' = '\.'; '$' = '\$' }`
                -NumberAsString:$Script:HTMLSchema['TableOptions']['DataStoreOptions'].NumberAsString `
                -BoolAsString:$Script:HTMLSchema['TableOptions']['DataStoreOptions'].BoolAsString `
                -DateTimeFormat $Script:HTMLSchema['TableOptions']['DataStoreOptions'].DateTimeFormat `
                -NewLineFormat $Script:HTMLSchema['TableOptions']['DataStoreOptions'].NewLineFormat -Force `
                -ArrayJoin:$Script:HTMLSchema['TableOptions']['DataStoreOptions'].ArrayJoin `
                -ArrayJoinString $Script:HTMLSchema['TableOptions']['DataStoreOptions'].ArrayJoinString
            if ($DataToInsert.StartsWith('[')) {
                $Options = $Options.Replace('"markerForDataReplacement"', $DataToInsert)
            } else {
                $Options = $Options.Replace('"markerForDataReplacement"', "[$DataToInsert]")
            }
        }
        # we need to reset table to $Null to make sure it's not added as HTML as well
        $Table = $null
    }

    # Process Conditional Formatting. Ugly JS building
    $Options = New-TableConditionalFormatting -Options $Options -ConditionalFormatting $ConditionalFormatting -Header $HeaderNames -DataStore $DataStore
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
    if (-not $Script:HTMLSchema['TableSimplify']) {
        $Script:HTMLSchema.Features.Jquery = $true
        $Script:HTMLSchema.Features.DataTables = $true
        $Script:HTMLSchema.Features.DataTablesEmail = $true
        $Script:HTMLSchema.Features.Moment = $true
        if (-not $HideButtons) {
            #$Script:HTMLSchema.Features.DataTablesButtonsPDF = $true
            #$Script:HTMLSchema.Features.DataTablesButtonsExcel = $true
        }
        #$Script:HTMLSchema.Features.DataTablesSearchFade = $true

        #if ($ScrollX) {
        #    $TableAttributes = @{ id = $DataTableID; class = "$($Style -join ' ')"; width = $Width }
        #} else {
        $TableAttributes = @{ id = $DataTableID; class = "dataTables $($Style -join ' ')"; width = $Width }
        #}

        # Enable Custom Date fromat sorting
        $SortingFormatDateTime = Add-CustomFormatForDatetimeSorting -DateTimeSortingFormat $DateTimeSortingFormat
        $FilteringOutput = Add-TableFiltering -Filtering $Filtering -FilteringLocation $FilteringLocation -DataTableName $DataTableID -SearchRegularExpression:$SearchRegularExpression
        $FilteringTopCode = $FilteringOutput.FilteringTopCode
        $FilteringBottomCode = $FilteringOutput.FilteringBottomCode
        $LoadSavedState = Add-TableState -DataTableName $DataTableID -Filtering $Filtering -FilteringLocation $FilteringLocation -SavedState (-not $DisableStateSave)
        if ($TableEvents.Count -gt 0) {
            $TableEventsCode = Add-TableEvent -Events $TableEvents -HeaderNames $HeaderNames -DataStore $DataStore
            # this adds required JS script to escape regex when needed
            $Script:HTMLSchema.Features.EscapeRegex = $true
        }

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
                    $TableEventsCode
                });
"@
                if ($FixedHeader -or $FixedFooter) {
                    "dataTablesFixedTracker['$DataTableID'] = true;"
                }
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
                if ($FixedHeader -or $FixedFooter) {
                    "dataTablesFixedTracker['$DataTableID'] = true;"
                }
            }
        }
    } else {
        $TableAttributes = @{ class = 'simplify' }
        $Script:HTMLSchema.Features.DataTablesSimplify = $true
    }

    if ($InvokeHTMLTags) {
        # By default HTML tags are displayed, in this case we're converting tags into real tags
        $Table = $Table -replace '&lt;', '<' -replace '&gt;', '>' -replace '&amp;', '&' -replace '&nbsp;', ' ' -replace '&quot;', '"' -replace '&#39;', "'"
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
        $RowGroupingCSS = ConvertTo-LimitedCSS -ID $DataTableID -ClassName 'tr.dtrg-group td' -Attributes $RowGrouping.Attributes -Group
    } else {
        $RowGroupingCSS = ''
    }

    if ($Simplify) {
        $AttributeDiv = @{ class = 'flexElement overflowHidden' ; style = @{ display = 'flex' } }
    } else {
        $AttributeDiv = @{ class = 'flexElement overflowHidden' }
    }

    New-HTMLTag -Tag 'div' -Attributes $AttributeDiv -Value {
        $RowGroupingCSS
        $BeforeTableCode
        $BeforeTable
        # Build HTML TABLE

        if ($WordBreak -ne 'normal') {
            New-HTMLTag -Tag 'style' {
                ConvertTo-LimitedCSS -ClassName 'td' -ID $TableAttributes.id -Attributes @{ 'word-break' = $WordBreak }
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
            if ($Table) {
                New-HTMLTag -Tag 'tbody' {
                    $Table
                }
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
