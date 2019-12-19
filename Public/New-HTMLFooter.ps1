function New-HTMLFooter {
    [alias('Footer')]
    [CmdletBinding()]
    param(
        [scriptblock] $HTMLContent
    )
    if ($HTMLContent) {
        [PSCustomObject] @{
            Type   = 'Footer'
            Output = & $HTMLContent
        }
    }
}