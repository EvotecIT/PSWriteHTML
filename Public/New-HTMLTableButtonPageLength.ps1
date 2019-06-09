function New-HTMLTableButtonPageLength {
    [alias('TableButtonPageLength', 'EmailTableButtonPageLength')]
    [CmdletBinding()]
    param()
    [PSCustomObject] @{
        Type   = 'TableButtonPageLength'
        Output = @{
            extend = 'pageLength'
        }
    }
}