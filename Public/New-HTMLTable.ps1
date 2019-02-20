function New-HTMLTable {
    [CmdletBinding()]
    param(
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
        [string[]][ValidateSet('display', 'cell-border', 'compact', 'hover', 'nowrap', 'order-column', 'row-border', 'stripe')] $Style = @('display', 'compact'),
        [switch]$Simplify
    )
    # Theme creator  https://datatables.net/manual/styling/theme-creator

    [string] $DataTableName = "DT-$(Get-RandomStringName -Size 8)"
    [Array] $Table = $DataTable | ConvertTo-Html -Fragment | Select-Object -SkipLast 1 | Select-Object -Skip 2 # This removes table tags (open/closing)
    [string] $Header = $Table | Select-Object -First 1
    $Table = $Table | Select-Object -Skip 1


    if ($Simplify) {
        $TableAttributes = @{ class = 'sortable' }
    } else {
        $TableAttributes = @{ id = $DataTableName; class = ($Style -join ' ') }
    }

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
        dom          = 'Bfrtip'
        buttons      = @($Buttons)
        "colReorder" = -not $DisableColumnReorder

        "paging"     = -not $DisablePaging

        <# Paging Type
            numbers - Page number buttons only
            simple - 'Previous' and 'Next' buttons only
            simple_numbers - 'Previous' and 'Next' buttons, plus page numbers
            full - 'First', 'Previous', 'Next' and 'Last' buttons
            full_numbers - 'First', 'Previous', 'Next' and 'Last' buttons, plus page numbers
            first_last_numbers - 'First' and 'Last' buttons, plus page numbers        
        #>
        "pagingType" = $PagingStyle
        "lengthMenu" = @(
            @($PagingOptions, -1)
            @($PagingOptions, "All")
        )
        "ordering"   = -not $DisableOrdering
        "info"       = -not $DisableInfo
        "procesing"  = -not $DisableProcessing
        "responsive" = @{ 
            details = -not $DisableResponsiveTable 
        }
        "select"     = -not $DisableSelect
        "searching"  = -not $DisableSearch
        "stateSave"  = -not $DisableStateSave

    } | ConvertTo-Json -Depth 6


    # return data
    if (-not $Simplify) {

        if ($Script:HTMLSchema.Tabs.Count -le 1) {
            New-HTMlTag -Tag 'script' {

                @"
            `$(document).ready(function() {
                
                `$('#$DataTableName').DataTable($($Options));

        });            
"@
            }

        } else {
            #            $TabName = $Script:HTMLSchema.Tabs[-1]
            $TabName = $Script:HTMLSchema.TabsCurrent.Id


            New-HTMlTag -Tag 'script' {

                @"
            `$(document).ready(function() {
                `$('a').on('click', function() {
                if (
                                            `$(this).attr("href") == "#$TabName" &&
                                            !$.fn.dataTable.isDataTable(
                                                "#$DataTableName"
                                            )
                                        ) {
                `$('#$DataTableName').DataTable($($Options));
            };
            });
        });            
"@
            }

        }
    }
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