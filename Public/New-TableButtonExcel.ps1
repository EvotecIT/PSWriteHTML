function New-TableButtonExcel {
    [alias('TableButtonExcel','EmailTableButtonExcel','New-HTMLTableButtonExcel')]
    [CmdletBinding()]
    param(
        [string] $Title
    )

    $Output = @{}
    $Output['extend'] = 'excelHtml5'
    if ($Title) {
        $Output['title'] = $title
    }
    [PSCustomObject] @{
        Type   = 'TableButtonExcel'
        Output = $Output
    }
}