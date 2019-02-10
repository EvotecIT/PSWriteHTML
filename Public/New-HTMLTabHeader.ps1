Function New-HTMLTabHeader {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)][Array] $TabNames,
        [string] $DefaultTab
    )
    if ($DefaultTab -ne '') {
        if ($TabNames -notcontains $DefaultTab) {
            Write-Warning 'New-HTMLTabHeader - DefaultTab is not part of TabNames. Unable to set DefaultTab'
        }
    }
    [int] $CountTabs = 0
    New-HTMLTag -Tag 'ul' -Attributes @{ class = 'tab' } {
        foreach ($Tab in $TabNames) {
            New-HTMLTag -Tag 'li' {
                if (($DefaultTab -ne '' -and $DefaultTab -eq $Tab) -or ($DefaultTab -eq '' -and $CountTabs -eq 0)) {
                    New-HTMLAnchor -Class 'tablinks' -HrefLink "javascript:void(0)" -OnClick "openTab(event, '$Tab')" -Id 'defaultOpen' -Text $Tab
                } else {
                    New-HTMLAnchor -Class 'tablinks' -HrefLink "javascript:void(0)" -OnClick "openTab(event, '$Tab')" -Text $Tab
                }
            }
            $CountTabs++
        }
    }
}