function New-HTMLMain {
    [alias('Main')]
    [CmdletBinding()]
    param(
        [scriptblock] $HTMLContent
    )
    if ($HTMLContent) {
        [PSCustomObject] @{
            Type   = 'Main'
            Output = & $HTMLContent
        }
    }
}