function New-TableButtonCopy {
    [alias('TableButtonCopy', 'EmailTableButtonCopy','New-HTMLTableButtonCopy')]
    [CmdletBinding()]
    param()

    [PSCustomObject] @{
        Type   = 'TableButtonCopy'
        Output = @{
            extend = 'copyHtml5'
        }
    }
}