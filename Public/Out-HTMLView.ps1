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
        [alias('ArrayOfObjects', 'Object', 'DataTable')][Parameter(ValueFromPipeline = $true, Mandatory = $true)] $Table,
        [string] $FilePath,
        [string] $Title = 'Out-HTMLView',
        [switch] $PassThru,
        [string[]][ValidateSet('copyHtml5', 'excelHtml5', 'csvHtml5', 'pdfHtml5')] $Buttons = @('copyHtml5', 'excelHtml5', 'csvHtml5', 'pdfHtml5', 'pageLength'),
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
        [string]$TextWhenNoData = 'No data available.',
        [int] $ScreenSizePercent = 0,
        [string[]] $DefaultSortColumn,
        [int[]] $DefaultSortIndex,
        [ValidateSet('Ascending', 'Descending')][string] $DefaultSortOrder = 'Ascending',
        [string[]]$DateTimeSortingFormat,
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
        [string[]] $PriorityProperties
    )
    Begin {
        $DataTable = [System.Collections.Generic.List[Object]]::new()
        if ($FilePath -eq '') {
            $FilePath = Get-FileName -Extension 'html' -Temporary
        }
    }
    Process {
        foreach ($T in $Table) {
            $DataTable.Add($T)
        }
    }
    End {
        <# Not needed - part of New-HTMLTable
        # Code responsible for Priority Properties
        if ($PriorityProperties) {
            if ($DataTable.Count -gt 0) {

                $Properties = $DataTable[0].PSObject.Properties.Name
                $RemainingProperties = foreach ($Property in $Properties) {
                    if ($PriorityProperties -notcontains $Property) {
                        $Property
                    }
                }
                $AllProperties = $PriorityProperties + $RemainingProperties
                $DataTable = $DataTable | Select-Object -Property $AllProperties
            }
        }
        #>
        # HTML generation part
        New-HTML -FilePath $FilePath -UseCssLinks -UseJavaScriptLinks -TitleText $Title -ShowHTML {
            <#
            New-HTMLTable -DataTable $DataTable `
                -DefaultSortColumn $DefaultSortColumn `
                -DefaultSortIndex $DefaultSortIndex `
                -DisablePaging:$DisablePaging -Filtering:$Filtering -FilteringLocation $FilteringLocation `
                -Find $Find -InvokeHTMLTags:$InvokeHTMLTags -DisableNewLine:$DisableNewLine `
                -PriorityProperties $PriorityProperties
            #>

            New-HTMLTable -DataTable $DataTable `
                -HideFooter:$HideFooter `
                -Buttons $Buttons -PagingStyle $PagingStyle -PagingOptions $PagingOptions `
                -DisablePaging:$DisablePaging -DisableOrdering:$DisableOrdering -DisableInfo:$DisableInfo -DisableColumnReorder:$DisableColumnReorder -DisableProcessing:$DisableProcessing `
                -DisableResponsiveTable:$DisableResponsiveTable -DisableSelect:$DisableSelect -DisableStateSave:$DisableStateSave -DisableSearch:$DisableSearch -ScrollCollapse:$ScrollCollapse `
                -Style $Style -TextWhenNoData:$TextWhenNoData -ScreenSizePercent $ScreenSizePercent `
                -HTML $HTML -PreContent $PreContent -PostContent $PostContent `
                -DefaultSortColumn $DefaultSortColumn -DefaultSortIndex $DefaultSortIndex -DefaultSortOrder $DefaultSortOrder `
                -DateTimeSortingFormat $DateTimeSortingFormat -Find $Find -OrderMulti:$OrderMulti `
                -Filtering:$Filtering -FilteringLocation $FilteringLocation `
                -InvokeHTMLTags:$InvokeHTMLTags -DisableNewLine:$DisableNewLine -ScrollX:$ScrollX -ScrollY:$ScrollY -ScrollSizeY $ScrollSizeY `
                -FreezeColumnsLeft $FreezeColumnsLeft -FreezeColumnsRight $FreezeColumnsRight `
                -FixedHeader:$FixedHeader -FixedFooter:$FixedFooter -ResponsivePriorityOrder $ResponsivePriorityOrder -ResponsivePriorityOrderIndex $ResponsivePriorityOrderIndex -PriorityProperties $PriorityProperties
        }
        if ($PassThru) {
            # This isn't really real PassThru but just passing final object further down the pipe when needed
            # real PassThru requires significant work - if you're up to it, let me know.
            $DataTable
        }
    }
}