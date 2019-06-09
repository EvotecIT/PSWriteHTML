function New-HTMLTableButtonCopy {
    [alias('TableButtonCopy', 'EmailTableButtonCopy')]
    [CmdletBinding()]
    param()

    [PSCustomObject] @{
        Type   = 'TableButtonCopy'
        Output = @{
            extend = 'copyHtml5'
        }
    }
}