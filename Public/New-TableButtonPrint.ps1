function New-TableButtonPrint {
    <#
    .SYNOPSIS
    Creates a new table button for printing with optional title and button name.

    .DESCRIPTION
    This function creates a new table button for printing with optional title and button name. It can be used to add a print button to HTML tables.

    .EXAMPLE
    New-TableButtonPrint -Title "Print Table" -ButtonName "Print"

    Description
    -----------
    Creates a new table button with the title "Print Table" and button name "Print".

    .PARAMETER Title
    The title to be displayed when hovering over the button.

    .PARAMETER ButtonName
    The text to be displayed on the button.

    #>
    [alias('TableButtonPrint', 'EmailTableButtonPrint', 'New-HTMLTableButtonPrint')]
    [CmdletBinding()]
    param(
        [string] $Title,
        [string] $ButtonName
    )
    if (-not $Script:HTMLSchema['TableSimplify']) {
        $Script:HTMLSchema.Features.DataTablesButtons = $true
    }
    $Output = @{}
    $Output['extend'] = 'print'
    if ($ButtonName) {
        $Output['text'] = $ButtonName
    }
    if ($Title) {
        $Output['title'] = $title
    }
    [PSCustomObject] @{
        Type   = 'TableButtonPrint'
        Output = $Button
    }
}