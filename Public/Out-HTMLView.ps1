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
        [Parameter(ValueFromPipeline = $true, Mandatory = $true)] $Table,
        [string[]] $PriorityProperties,
        [string] $Title = 'Out-HTMLView',
        [string] $DefaultSortColumn,
        [int] $DefaultSortIndex = -1,
        [string] $FilePath,
        [switch] $DisablePaging,
        [switch] $PassThru,
        [switch]$Filtering,
        [ValidateSet('Top', 'Bottom', 'Both')][string]$FilteringLocation = 'Bottom',
        [alias('Search')][string]$Find
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
        # Code responsible for  Priority Properties
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
        # HTML generation part
        New-HTML -FilePath $FilePath -UseCssLinks -UseJavaScriptLinks -TitleText $Title -ShowHTML {
            New-HTMLTable -DataTable $DataTable -DefaultSortColumn $DefaultSortColumn -DefaultSortIndex $DefaultSortIndex `
                -DisablePaging:$DisablePaging -Filtering:$Filtering -FilteringLocation $FilteringLocation `
                -Find $Find
        }
        if ($PassThru) {
            # This isn't really real PassThru but just passing final object further down the pipe when needed
            # real PassThru requires significant work - if you're up to it, let me know.
            $DataTable
        }
    }
}