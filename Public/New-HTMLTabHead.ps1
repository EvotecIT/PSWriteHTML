function New-HTMLTabHead {
    [CmdletBinding()]
    Param (

    )
    New-HTMLTag -Tag 'div' -Attributes @{ class = 'tabsWrapper' } {
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'tabs' } {
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
                    New-HTMLTag -Tag 'div' -Attributes @{ class = $Tab.TabIcon } -Value { $Tab.Name }
                }
            }
        }
    }
}