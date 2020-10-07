function New-TableButtonPrint {
    [alias('TableButtonPrint', 'EmailTableButtonPrint','New-HTMLTableButtonPrint')]
    [CmdletBinding()]
    param(
        [string] $Title
    )
    $Script:HTMLSchema.Features.DataTablesButtons = $true
    $Output = @{}
    $Output['extend'] = 'print'
    if ($Title) {
        $Output['title'] = $title
    }
    [PSCustomObject] @{
        Type   = 'TableButtonPrint'
        Output = $Button
    }
}