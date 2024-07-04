function New-HTMLTabHead {
    <#
    .SYNOPSIS
    Creates the HTML structure for a set of tabs.

    .DESCRIPTION
    This function generates the HTML structure for a set of tabs based on the provided TabsCollection and PageName. It creates a div element with tab headers inside.

    .PARAMETER TabsCollection
    An array containing the tabs information.

    .PARAMETER PageName
    The name of the page to which the tabs belong.

    .EXAMPLE
    New-HTMLTabHead -TabsCollection @($Tab1, $Tab2) -PageName 'HomePage'
    Creates the HTML structure for tabs Tab1 and Tab2 on the HomePage.

    #>
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
