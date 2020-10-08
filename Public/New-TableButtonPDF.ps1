function New-TableButtonPDF {
    <#
    .SYNOPSIS
    Allows more control when adding buttons to Table

    .DESCRIPTION
    Allows more control when adding buttons to Table. Works only within Table or New-HTMLTable scriptblock.

    .PARAMETER Title
    Document title (appears above the table in the generated PDF). The special character * is automatically replaced with the value read from the host document's title tag.

    .PARAMETER DisplayName
    The button's display text. The text can be configured using this option

    .PARAMETER MessageBottom
    Message to be shown at the bottom of the table, or the caption tag if displayed at the bottom of the table.

    .PARAMETER MessageTop
    Message to be shown at the top of the table, or the caption tag if displayed at the top of the table.

    .PARAMETER FileName
    File name to give the created file (plus the extension defined by the extension option). The special character * is automatically replaced with the value read from the host document's title tag.

    .PARAMETER Extension
    The extension to give the created file name. (default .pdf)

    .PARAMETER PageSize
    Paper size for the created PDF. This can be A3, A4, A5, LEGAL, LETTER or TABLOID. Other options are available.

    .PARAMETER Orientation
    Paper orientation for the created PDF. This can be portrait or landscape

    .PARAMETER Header
    Indicate if the table header should be included in the exported data or not.

    .PARAMETER Footer
    Indicate if the table footer should be included in the exported data or not.

    .EXAMPLE
    Dashboard -Name 'Dashimo Test' -FilePath $PSScriptRoot\DashboardEasy05.html -Show {
        Section -Name 'Test' -Collapsable {
            Container {
                Panel {
                    Table -DataTable $Process {
                        TableButtonPDF
                        TableButtonCopy
                        TableButtonExcel
                    } -Buttons @() -DisableSearch -DisablePaging -HideFooter
                }
                Panel {
                    Table -DataTable $Process -Buttons @() -DisableSearch -DisablePaging -HideFooter
                }
                Panel {
                    Table -DataTable $Process {
                        TableButtonPDF -PageSize A10 -Orientation landscape
                        TableButtonCopy
                        TableButtonExcel
                    } -Buttons @() -DisableSearch -DisablePaging -HideFooter
                }
            }
        }
    }

    .NOTES
    Options are based on this URL: https://datatables.net/reference/button/pdfHtml5

    #>

    [alias('TableButtonPDF', 'EmailTableButtonPDF', 'New-HTMLTableButtonPDF')]
    [CmdletBinding()]
    param(
        [string] $Title,
        [string] $DisplayName,
        [string] $MessageBottom,
        [string] $MessageTop,
        [string] $FileName,
        [string] $Extension,
        [string][ValidateSet('4A0', '2A0', 'A0', 'A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7', 'A8', 'A9', 'A10',
            'B0', 'B1', 'B2', 'B3', 'B4', 'B5', 'B6', 'B7', 'B8', 'B9', 'B10',
            'C0', 'C1', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7', 'C8', 'C9', 'C10',
            'RA0', 'RA1', 'RA2', 'RA3', 'RA4',
            'SRA0', 'SRA1', 'SRA2', 'SRA3', 'SRA4',
            'EXECUTIVE', 'FOLIO', 'LEGAL', 'LETTER', 'TABLOID')] $PageSize = 'A3',
        [string][ValidateSet('portrait', 'landscape')] $Orientation = 'landscape',
        [switch] $Header,
        [switch] $Footer
    )
    if (-not $Script:HTMLSchema['TableSimplify']) {
        $Script:HTMLSchema.Features.DataTablesButtons = $true
        $Script:HTMLSchema.Features.DataTablesButtonsPDF = $true
        $Script:HTMLSchema.Features.DataTablesButtonsHTML5 = $true
    }
    $Button = @{ }
    $Button.extend = 'pdfHtml5'
    $Button.pageSize = $PageSize
    $Button.orientation = $Orientation
    if ($MessageBottom) {
        $Button.messageBottom = $MessageBottom
    }
    if ($MessageTop) {
        $Button.messageTop = $MessageTop
    }
    if ($DisplayName) {
        $Button.text = $DisplayName
    }
    if ($Title) {
        $Button.title = $Title
    }
    if ($FileName) {
        $Button.filename = $FileName
    }
    if ($Extension) {
        $Button.extension = $Extension
    }
    if ($Header) {
        $Button.header = $Header.IsPresent
    }
    if ($Footer) {
        $Button.footer = $Footer.IsPresent
    }

    [PSCustomObject] @{
        Type   = 'TableButtonPDF'
        Output = $Button
    }
}






