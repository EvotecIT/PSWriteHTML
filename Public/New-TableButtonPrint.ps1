function New-TableButtonPrint {
    [alias('TableButtonPrint', 'EmailTableButtonPrint','New-HTMLTableButtonPrint')]
    [CmdletBinding()]
    param(
        [string] $Title
    )

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