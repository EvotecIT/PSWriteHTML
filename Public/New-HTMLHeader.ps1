function New-HTMLHeader {
    [alias('Header')]
    [CmdletBinding()]
    param(
        [scriptblock] $HTMLContent
    )

    if ($HTMLContent) {
        [PSCustomObject] @{
            Type   = 'Header'
            Output = & $HTMLContent
        }
    }
}