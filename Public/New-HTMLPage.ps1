function New-HTMLPage {
    [cmdletBinding()]
    param(
        [scriptblock] $PageContent,
        [Parameter(Mandatory)][string] $Name
    )

    if ($PageContent) {
        $Script:GlobalSchema['Pages'][$Name] = New-DefaultSettings

        $Script:HTMLSchema['PagesCurrent'] = $Name
        $Script:HTMLSchema = $Script:GlobalSchema['Pages'][$Name]

        [PSCustomObject] @{
            Type   = 'Page'
            Output = & $PageContent
            Name   = $Name
        }
    }
}