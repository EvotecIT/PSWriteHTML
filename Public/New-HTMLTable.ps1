function New-HTMLTable {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, Position = 0)][ScriptBlock] $ConditionalFormatting,
        [alias('ArrayOfObjects', 'Object', 'Table')][Array] $DataTable,
        #[Array] $ConditionalFormatting,
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
        [bool] $ScrollCollapse,
        [string[]][ValidateSet('display', 'cell-border', 'compact', 'hover', 'nowrap', 'order-column', 'row-border', 'stripe')] $Style = @('display', 'compact'),
        [switch]$Simplify,
        [string]$TextWhenNoData = 'No data available.',
        [int] $ScreenSizePercent = 0
    )
    # Theme creator  https://datatables.net/manual/styling/theme-creator

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
        buttons          = @($Buttons)
        "colReorder"     = -not $DisableColumnReorder


        # https://datatables.net/examples/basic_init/scroll_y_dynamic.html
        "paging"         = -not $DisablePaging
        "scrollCollapse" = $ScrollCollapse

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
            @($PagingOptions, -1)
            @($PagingOptions, "All")
        )
        "ordering"       = -not $DisableOrdering
        "info"           = -not $DisableInfo
        "procesing"      = -not $DisableProcessing
        "responsive"     = @{
            details = -not $DisableResponsiveTable
        }
        "select"         = -not $DisableSelect
        "searching"      = -not $DisableSearch
        "stateSave"      = -not $DisableStateSave
    }

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
    $Options = New-TableConditionalFormatting -Options $Options -ConditionalFormatting $Conditional -Header $Header


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

        $TableAttributes = @{ id = $DataTableName; class = ($Style -join ' ') }
        if ($Tab.Active -eq $true) {
            New-HTMlTag -Tag 'script' {
                @"
                `$(document).ready(function() {
                    `$('#$DataTableName').DataTable(
                        $($Options)
                    );
                });
"@
            }
        } else {
            [string] $TabName = $Tab.Id
            New-HTMlTag -Tag 'script' {
                @"
                    `$(document).ready(function() {
                        `$('.tabs').on('click', 'a', function (event) {
                            if (`$(event.currentTarget).attr("data-id") == "$TabName" && !$.fn.dataTable.isDataTable("#$DataTableName")) {
                                `$('#$DataTableName').DataTable(
                                    $($Options)
                                );
                            };
                        });
                    });
"@
            }
        }
    } else {
        $TableAttributes = @{ class = 'sortable' }
    }
    New-HTMLTag -Tag 'div' -Attributes @{ class = 'defaultPanelOther' } -Value {
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
    }
}