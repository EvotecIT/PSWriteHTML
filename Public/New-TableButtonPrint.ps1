﻿function New-TableButtonPrint {
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