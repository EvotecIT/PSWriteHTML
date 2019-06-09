function New-HTMLTableButtonPrint {
    [alias('TableButtonPrint', 'EmailTableButtonPrint')]
    [CmdletBinding()]
    param()
    $Button = @{
        extend = 'print'
    }
    [PSCustomObject] @{
        Type   = 'TableButtonPrint'
        Output = $Button
    }
}