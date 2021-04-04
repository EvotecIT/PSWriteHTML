function New-HTMLPage {
    [cmdletBinding()]
    param(
        [scriptblock] $PageContent,
        [Parameter(Mandatory)][string] $Name
    )

    if ($PageContent) {
        [PSCustomObject] @{
            Type   = 'Page'
            Output = & $PageContent
            Name   = "$Name.html"
        }
    }
}