function New-HTMLTabHead {
    [CmdletBinding()]
    Param (
        [Array] $TabsCollection
    )

    if ($Script:HTMLSchema.TabOptions.SlimTabs) {
        $Style = 'display: inline-block;' # makes tabs wrapperr slim/small
    } else {
        $Style = '' # makes it full-width
    }
    <#
    New-HTMLTag -Tag 'div' -Attributes @{ class = 'tabsWrapper' } {
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'tabs' ; style = $Style } {
            New-HTMLTag -Tag 'div' -Attributes @{ class = 'selector' }
            foreach ($Tab in $Script:HTMLSchema.TabsHeaders) {
                $AttributesA = @{
                    'href'    = 'javascript:void(0)'
                    'data-id' = "$($Tab.Id)"
                }
                if ($Tab.Active) {
                    $AttributesA.class = 'active'
                } else {
                    $AttributesA.class = ''
                }
                New-HTMLTag -Tag 'a' -Attributes $AttributesA {
                    New-HTMLTag -Tag 'div' -Attributes @{ class = $($Tab.Icon); style = $($Tab.StyleIcon) }
                    New-HTMLTag -Tag 'span' -Attributes @{ style = $($Tab.StyleText ) } -Value { $Tab.Name }
                }
            }
        }
    }
    #>

    if ($TabsCollection.Count -gt 0) {
        $Tabs = $TabsCollection
    } else {
        $Tabs = $Script:HTMLSchema.TabsHeaders
    }
    New-HTMLTag -Tag 'div' -Attributes @{ class = 'tabsWrapper' } {
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'tabs' ; style = $Style } {
            New-HTMLTag -Tag 'div' -Attributes @{ 'data-tabs' = 'true'; Style = $Script:BorderStyle } {
                foreach ($Tab in $Tabs) {
                    if ($Tab.Active) {
                        $TabActive = 'active'
                    } else {
                        $TabActive = ''
                    }
                    New-HTMLTag -Tag 'div' -Attributes @{ id = $Tab.ID; class = $TabActive; Style = @{'border-radius' = $Script:BorderStyle.'border-radius'}  } {
                        New-HTMLTag -Tag 'div' -Attributes @{ class = $($Tab.Icon); style = $($Tab.StyleIcon) }
                        New-HTMLTag -Tag 'span' -Attributes @{ style = $($Tab.StyleText ) } -Value { $Tab.Name }
                    }
                }
            }
        }
    }

}
