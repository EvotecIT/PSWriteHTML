function New-TableButtonCSV {
    [alias('TableButtonCSV','EmailTableButtonCSV','New-HTMLTableButtonCSV')]
    [CmdletBinding()]
    param(
        [string] $Title
    )

    $Output = [ordered]@{}
    $Output['extend'] = 'csvHtml5'
    if ($Title) {
        $Output['title'] = $title
    }
    [PSCustomObject] @{
        Type   = 'TableButtonCSV'
        Output = $Output
    }
}