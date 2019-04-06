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
    [alias('Out-GridHtml')]
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true, Mandatory = $true)] $Table,
        [string] $Title = 'Out-HTMLView',
        [string] $DefaultSortColumn,
        [int] $DefaultSortIndex = -1
    )
    Begin {
        $DataTable = [System.Collections.Generic.List[Object]]::new()
    }
    Process {
        foreach ($T in $Table) {
            $DataTable.Add($T)
        }
    }
    End {
        [string] $FilePath = Get-FileName -Extension 'html' -Temporary
        New-HTML -FilePath $FilePath -UseCssLinks -UseJavaScriptLinks -TitleText $Title -ShowHTML {
            New-HTMLTable -DataTable $DataTable -DefaultSortColumn $DefaultSortColumn -DefaultSortIndex $DefaultSortIndex
        }
    }
}