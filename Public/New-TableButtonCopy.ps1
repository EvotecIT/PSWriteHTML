﻿function New-TableButtonCopy {
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