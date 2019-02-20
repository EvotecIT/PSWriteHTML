Function New-HTMLTabHeader {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)][string[]] $TabNames,
        [string] $DefaultTab,
        [string] $TabsType
    )
    if ($DefaultTab -ne '') {
        if ($TabNames -notcontains $DefaultTab) {
            Write-Warning 'New-HTMLTabHeader - DefaultTab is not part of TabNames. Unable to set DefaultTab'
        }
    }
    [int] $CountTabs = 0

    <#
    New-HTMLTag -Tag 'div' -Attributes @{ class = 'tabs is-large' } {

        New-HTMLTag -Tag 'ul' {
            foreach ($Tab in $TabNames) {
                New-HTMLTag -Tag 'li' {
                    if (($DefaultTab -ne '' -and $DefaultTab -eq $Tab) -or ($DefaultTab -eq '' -and $CountTabs -eq 0)) {
                        New-HTMLAnchor -Class 'is-active' -HrefLink "javascript:void(0)" -OnClick "openTab(event, '$Tab')" -Id 'defaultOpen' -Text $Tab
                    } else {
                        New-HTMLAnchor -Class '' -HrefLink "javascript:void(0)" -OnClick "openTab(event, '$Tab')" -Text $Tab
                    }
                }
                $CountTabs++
            }
        }
    }
    #>
    [int] $TabNumber = 0
    foreach ($Tab in $TabNames) {
        [string] $TabID = "Tab-$(Get-RandomStringName -Size 8)"
        $Script:HTMLSchema.TabsHeaders.Add(@{ Name = $Tab; Id = $TabID; Number = $TabNumber++ })
    }

    
    New-HTMLTag -Tag 'div' -Attributes @{ class = '' } {

        New-HTMLTag -Tag 'ul' -Attributes @{ class = 'tab-nav'} {
            foreach ($Tab in $Script:HTMLSchema.TabsHeaders) {
                New-HTMLTag -Tag 'li' {
                    if (($DefaultTab -ne '' -and $DefaultTab -eq $Tab.Name) -or ($DefaultTab -eq '' -and $CountTabs -eq 0)) {
                        New-HTMLAnchor -Class 'button active' -HrefLink "#$($Tab.Id)" -Text $Tab.Name
                    } else {
                        New-HTMLAnchor -Class 'button' -HrefLink "#$($Tab.Id)" -Text $Tab.Name
                    }
                }
                $CountTabs++
            }
        }
    } 
    
    
}