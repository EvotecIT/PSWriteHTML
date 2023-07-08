function New-TableButtonExcel {
    [alias('TableButtonExcel', 'EmailTableButtonExcel', 'New-HTMLTableButtonExcel')]
    [CmdletBinding()]
    param(
        [string] $Title,
        [string] $ButtonName
    )
    $Script:HTMLSchema.Features.DataTablesButtons = $true
    $Script:HTMLSchema.Features.DataTablesButtonsHTML5 = $true
    $Script:HTMLSchema.Features.DataTablesButtonsExcel = $true
    $Output = @{}
    $Output['extend'] = 'excelHtml5'
    if ($ButtonName) {
        $Output['text'] = $ButtonName
    }
    if ($Title) {
        $Output['title'] = $title
    }
    [PSCustomObject] @{
        Type   = 'TableButtonExcel'
        Output = $Output
    }
}