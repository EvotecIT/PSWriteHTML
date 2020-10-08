function New-TableButtonPageLength {
    [alias('TableButtonPageLength', 'EmailTableButtonPageLength', 'New-HTMLTableButtonPageLength')]
    [CmdletBinding()]
    param(
        [string] $Title
    )
    if (-not $Script:HTMLSchema['TableSimplify']) {
        $Script:HTMLSchema.Features.DataTablesButtons = $true
    }
    $Output = @{}
    $Output['extend'] = 'pageLength'
    if ($Title) {
        $Output['title'] = $title
    }
    [PSCustomObject] @{
        Type   = 'TableButtonPageLength'
        Output = $Output
    }
}