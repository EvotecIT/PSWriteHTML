function New-TableButtonPageLength {
    [alias('TableButtonPageLength', 'EmailTableButtonPageLength','New-HTMLTableButtonPageLength')]
    [CmdletBinding()]
    param()
    [PSCustomObject] @{
        Type   = 'TableButtonPageLength'
        Output = @{
            extend = 'pageLength'
        }
    }
}