function New-HTMLTabHead {
    [CmdletBinding()]
    Param (
        [Array] $TabsCollection
    )
    if ($TabsCollection.Count -gt 0) {
        $Tabs = $TabsCollection
    } else {
        $Tabs = $Script:HTMLSchema.TabsHeaders
    }
    New-HTMLTag -Tag 'div' -Attributes @{ class = 'tabsWrapper' } {
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'tabsSlimmer' } {
            New-HTMLTag -Tag 'div' -Attributes @{ 'data-tabs' = 'true'; class = 'tabsBorderStyle' } {
                foreach ($Tab in $Tabs) {
                    if ($Tab.Active) {
                        $TabActive = 'active'
                    } else {
                        $TabActive = ''
                    }
                    New-HTMLTag -Tag 'div' -Attributes @{ id = $Tab.ID; class = $TabActive; } {
                        New-HTMLTag -Tag 'div' -Attributes @{ class = $($Tab.Icon); style = $($Tab.StyleIcon) }
                        New-HTMLTag -Tag 'span' -Attributes @{ style = $($Tab.StyleText ) } -Value { $Tab.Name }
                    }
                }
            }
        }
    }

}
