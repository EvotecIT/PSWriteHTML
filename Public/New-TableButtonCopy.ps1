function New-TableButtonCopy {
    <#
    .SYNOPSIS
    Creates a new table button for copying data with customizable options.

    .DESCRIPTION
    This function creates a new table button for copying data with customizable options. It allows users to specify the button title and display text.

    .PARAMETER Title
    The title to be displayed when hovering over the button.

    .PARAMETER ButtonName
    The text to be displayed on the button.

    .EXAMPLE
    New-TableButtonCopy -Title "Copy Data" -ButtonName "Copy"

    Description
    -----------
    Creates a new table button with the title "Copy Data" and button name "Copy".

    #>
    [alias('TableButtonCopy', 'EmailTableButtonCopy', 'New-HTMLTableButtonCopy')]
    [CmdletBinding()]
    param(
        [string] $Title,
        [string] $ButtonName
    )
    if (-not $Script:HTMLSchema['TableSimplify']) {
        $Script:HTMLSchema.Features.DataTablesButtons = $true
        $Script:HTMLSchema.Features.DataTablesButtonsHTML5 = $true
    }
    $Output = [ordered]@{}
    $Output['extend'] = 'copyHtml5'
    if ($ButtonName) {
        $Output['text'] = $ButtonName
    }
    if ($Title) {
        $Output['title'] = $title
    }
    [PSCustomObject] @{
        Type   = 'TableButtonCopy'
        Output = $Output
    }
}