function New-TableButtonExcel {
    <#
    .SYNOPSIS
    Creates a new table button for exporting data to Excel with customizable options.

    .DESCRIPTION
    This function creates a new table button for exporting data to Excel with customizable options. It allows users to specify the button title and display text.

    .PARAMETER Title
    The title to be displayed when hovering over the button.

    .PARAMETER ButtonName
    The text to be displayed on the button.

    .EXAMPLE
    New-TableButtonExcel -Title "Export to Excel" -ButtonName "Export"

    Description
    -----------
    Creates a new table button with the title "Export to Excel" and button name "Export".

    #>
    [alias('TableButtonExcel', 'EmailTableButtonExcel', 'New-HTMLTableButtonExcel')]
    [CmdletBinding()]
    param(
        [string] $Title,
        [string] $ButtonName
    )
    $Script:HTMLSchema.Features.DataTablesButtons = $true
    $Script:HTMLSchema.Features.DataTablesButtonsHTML5 = $true
    $Script:HTMLSchema.Features.DataTablesButtonsExcel = $true
    $Output = @{}
    $Output['extend'] = 'excelHtml5'
    if ($ButtonName) {
        $Output['text'] = $ButtonName
    }
    if ($Title) {
        $Output['title'] = $title
    }
    [PSCustomObject] @{
        Type   = 'TableButtonExcel'
        Output = $Output
    }
}