function New-HTMLPage {
    [cmdletBinding()]
    param(
        [scriptblock] $PageContent,
        [Parameter(Mandatory)][string] $Name
    )

    if ($PageContent) {
        $Script:HTMLSchema['Pages'][$Name] = [ordered]@{
            TabsHeaders       = [System.Collections.Generic.List[System.Collections.IDictionary]]::new() # tracks / stores headers
            TabsHeadersNested = [System.Collections.Generic.List[System.Collections.IDictionary]]::new() # tracks / stores headers
        }

        $Script:HTMLSchema['PagesCurrent'] = $Name
        $Script:CurrentPageSchema = $Script:HTMLSchema['Pages'][$Name]

        [PSCustomObject] @{
            Type   = 'Page'
            Output = & $PageContent
            Name   = $Name
        }
    }
}