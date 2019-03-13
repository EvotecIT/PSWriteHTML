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
    # Tabs Tracking Start - This creates Tabs Tracking Code that's used for New-HTMLTab and New-HTMLTable
    [int] $TabNumber = 0
    if (-not $Script:HTMLSchema) { 
        Write-Warning 'New-HTML is required for New-HTMLTabHeader to work. Terminating!'
        Exit
    }
    <#

    $Script:HTMLSchema.TabsHeaders = foreach ($Tab in $TabNames) {
        [string] $TabID = "Tab-$(Get-RandomStringName -Size 8)"

        $Information = @{
            Name    = $Tab
            Id      = $TabID
            Number  = $TabNumber++
            Used    = $false
            Active  = $false 
            Current = $false
        }
        if ($DefaultTab -ne '' -and $Tab -eq $DefaultTab) {
            $Information.Active = $true
        }
        $Information
    }
    if ($Script:HTMLSchema.TabsHeaders.Active -notcontains $true) {
        $Script:HTMLSchema.TabsHeaders[0].Active = $true
    }
    # Tabs Tracking End

    #>
    
    New-HTMLTag -Tag 'div' -Attributes @{ class = '' } {
        New-HTMLTag -Tag 'ul' -Attributes @{ class = 'tab-nav'} {
            foreach ($Tab in $Script:HTMLSchema.TabsHeaders) {
                New-HTMLTag -Tag 'li' {
                    if ($Tab.Active) {
                        New-HTMLAnchor -Class 'button active' -HrefLink "#$($Tab.Id)" -Text $Tab.Name
                    } else {
                        New-HTMLAnchor -Class 'button' -HrefLink "#$($Tab.Id)" -Text $Tab.Name
                    }
                }
            }
        }
    }
}

Function New-HTMLTabHead {
    [CmdletBinding()]
    Param (
        
    )
    
    New-HTMLTag -Tag 'div' -Attributes @{ class = '' } {
        New-HTMLTag -Tag 'ul' -Attributes @{ class = 'tab-nav'} {
            foreach ($Tab in $Script:HTMLSchema.TabsHeaders) {
                New-HTMLTag -Tag 'li' {
                    if ($Tab.Active) {
                        New-HTMLAnchor -Class 'buttonTab active' -HrefLink "#$($Tab.Id)" -Text $Tab.Name
                    } else {
                        New-HTMLAnchor -Class 'buttonTab' -HrefLink "#$($Tab.Id)" -Text $Tab.Name
                    }
                }
            }
        }
    }
}