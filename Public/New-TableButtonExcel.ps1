function New-TableButtonExcel {
    [alias('TableButtonExcel','EmailTableButtonExcel','New-HTMLTableButtonExcel')]
    [CmdletBinding()]
    param()
    [PSCustomObject] @{
        Type   = 'TableButtonExcel'
        Output = @{
            extend = 'excelHtml5'
        }
    }
}