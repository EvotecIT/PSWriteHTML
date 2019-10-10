function New-TableButtonCSV {
    [alias('TableButtonCSV','EmailTableButtonCSV','New-HTMLTableButtonCSV')]
    [CmdletBinding()]
    param()
    [PSCustomObject] @{
        Type   = 'TableButtonCSV'
        Output = @{
            extend = 'csvHtml5'
        }
    }
}