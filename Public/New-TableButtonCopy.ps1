function New-TableButtonCopy {
    [alias('TableButtonCopy', 'EmailTableButtonCopy','New-HTMLTableButtonCopy')]
    [CmdletBinding()]
    param(
        [string] $Title
    )

    $Output = [ordered]@{}
    $Output['extend'] = 'copyHtml5'
    if ($Title) {
        $Output['title'] = $title
    }
    [PSCustomObject] @{
        Type   = 'TableButtonCopy'
        Output = $Output
    }
}