function New-HTMLTabHead {
    [CmdletBinding()]
    Param (
        [Array] $TabsCollection,
        [string] $PageName
    )
    if ($TabsCollection.Count -gt 0) {
        $Tabs = $TabsCollection
    } else {
        $Tabs = $Script:GlobalSchema['Pages'][$PageName].TabsHeaders
    }
    New-HTMLTag -Tag 'div' -Attributes @{ class = 'tabsWrapper' } {
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'tabsSlimmer' } {
            #New-HTMLTag -Tag 'div' -Attributes @{ 'data-tabs' = 'true'; class = 'tabsBorderStyle' } {
            New-HTMLTag -Tag 'div' -Attributes @{ 'data-tabs' = 'true' } {
                foreach ($Tab in $Tabs) {
                    if ($Tab.Active) {
                        $TabActive = 'active'
                    } else {
                        $TabActive = ''
                    }
                    New-HTMLTag -Tag 'div' -Attributes @{ id = $Tab.ID; class = $TabActive; } {
                        if ($Tab.Icon) {
                            New-HTMLTag -Tag 'span' -Attributes @{ class = $($Tab.Icon); style = $($Tab.StyleIcon) }
                            '&nbsp;' # adds an extra space when adding icon before it
                        }
                        New-HTMLTag -Tag 'span' -Attributes @{ style = $($Tab.StyleText ) } -Value { $Tab.Name }
                    }
                }
            }
        }
    }

}
