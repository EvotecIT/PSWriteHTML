function New-HTMLTableButtonExcel {
    [alias('TableButtonExcel','EmailTableButtonExcel')]
    [CmdletBinding()]
    param()
    [PSCustomObject] @{
        Type   = 'TableButtonExcel'
        Output = @{
            extend = 'excelHtml5'
        }
    }
}