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

    .PARAMETER TextColumns
    Column names to export as text, including short numeric identifiers. Numeric values beyond 15 significant digits are automatically exported as text.

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
        [string] $ButtonName,
        [string[]] $TextColumns
    )
    $Script:HTMLSchema.Features.DataTablesButtons = $true
    $Script:HTMLSchema.Features.DataTablesButtonsHTML5 = $true
    $Script:HTMLSchema.Features.DataTablesButtonsExcel = $true
    $Output = @{}
    $Output['extend'] = 'excelHtml5'
    $Output['pswhTextColumns'] = @($TextColumns)
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
