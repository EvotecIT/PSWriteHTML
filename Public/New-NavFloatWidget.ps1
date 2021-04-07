function New-NavFloatWidget {
    [cmdletBinding()]
    param(
        [scriptblock] $Items,
        [ValidateSet('Dots', 'SelectBox', 'List', 'Toggle', 'Text')][string] $Type,
        [string] $Title
    )
    if ($Items) {
        if ($Type -eq 'Dots') {
            $Script:GlobalSchema['NavFloatWidget'] = 'Dots'
            New-HTMLTag -Tag 'menu' -Attributes @{ class = 'top-links' } {
                & $Items
            }
            $Script:GlobalSchema['NavFloatWidget'] = $null
        } elseif ($Type -eq 'SelectBox') {
            $Script:GlobalSchema['NavFloatWidget'] = 'SelectBox'
            if ($Title) { New-HTMLTag -Tag 'h3' { $Title } }
            New-HTMLTag -Tag 'select' -Attributes @{ class = 'penal-select' } {
                & $Items
            }
            $Script:GlobalSchema['NavFloatWidget'] = $null
        } elseif ($Type -eq 'List') {
            $Script:GlobalSchema['NavFloatWidget'] = 'list'
            #New-HTMLTag -Tag 'div' -Attributes @{ class = "penal-widget" } {
            if ($Title) { New-HTMLTag -Tag 'h3' { $Title } }
            New-HTMLTag -Tag 'ul' -Attributes @{ class = "penal-list" } {
                & $Items
            }
            #}
            $Script:GlobalSchema['NavFloatWidget'] = $null
        } elseif ($Type -eq 'Toggle') {
            $Script:GlobalSchema['NavFloatWidget'] = 'toggle'
            if ($Title) { New-HTMLTag -Tag 'h3' { $Title } }
            New-HTMLTag -Tag 'div' -Attributes @{ class = "toggle-switch" } {
                New-HTMLTag -Tag 'ul' -Attributes @{ class = "toggle-buttons" } {
                    & $Items
                }
            }
            $Script:GlobalSchema['NavFloatWidget'] = $null
        } elseif ($Type -eq 'Text') {
            $Script:GlobalSchema['NavFloatWidget'] = 'about'
            if ($Title) { New-HTMLTag -Tag 'h3' { $Title } }
            New-HTMLTag -Tag 'div' -Attributes @{ class = "penal-widget about" } {
                #if ($Title) { New-HTMLTag -Tag 'h3' { $Title } }
                & $Items
            }
            $Script:GlobalSchema['NavFloatWidget'] = $null
        }
    }
}