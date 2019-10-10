function New-TableButtonPrint {
    [alias('TableButtonPrint', 'EmailTableButtonPrint','New-HTMLTableButtonPrint')]
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