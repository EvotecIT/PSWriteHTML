function New-TableButtonPageLength {
    [alias('TableButtonPageLength', 'EmailTableButtonPageLength','New-HTMLTableButtonPageLength')]
    [CmdletBinding()]
    param(
        [string] $Title
    )

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