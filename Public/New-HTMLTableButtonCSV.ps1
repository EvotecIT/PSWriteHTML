function New-HTMLTableButtonCSV {
    [alias('TableButtonCSV','EmailTableButtonCSV')]
    [CmdletBinding()]
    param()
    [PSCustomObject] @{
        Type   = 'TableButtonCSV'
        Output = @{
            extend = 'csvHtml5'
        }
    }
}