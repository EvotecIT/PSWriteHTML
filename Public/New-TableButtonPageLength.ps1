function New-TableButtonPageLength {
    <#
    .SYNOPSIS
    Creates a new table button for setting the page length in a DataTable.

    .DESCRIPTION
    This function creates a new table button for setting the page length in a DataTable. It allows users to customize the button title and display text.

    .PARAMETER Title
    The title to be displayed when hovering over the button.

    .PARAMETER ButtonName
    The text to be displayed on the button.

    .EXAMPLE
    New-TableButtonPageLength -Title "Set Page Length" -ButtonName "Page Length"

    Description
    -----------
    Creates a new table button with the title "Set Page Length" and button name "Page Length".

    #>
    [alias('TableButtonPageLength', 'EmailTableButtonPageLength', 'New-HTMLTableButtonPageLength')]
    [CmdletBinding()]
    param(
        [string] $Title,
        [string] $ButtonName
    )
    if (-not $Script:HTMLSchema['TableSimplify']) {
        $Script:HTMLSchema.Features.DataTablesButtons = $true
    }
    $Output = @{}
    $Output['extend'] = 'pageLength'
    if ($ButtonName) {
        $Output['text'] = $ButtonName
    }
    if ($Title) {
        $Output['title'] = $title
    }
    [PSCustomObject] @{
        Type   = 'TableButtonPageLength'
        Output = $Output
    }
}