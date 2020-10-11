function New-HTMLTabPanel {
    [cmdletBinding()]
    param(
        [ScriptBlock] $Tabs,
        [int] $Selected,
        [ValidateSet('horizontal', 'vertical')][string] $Orientation,
        [switch] $DisableJustification,
        [switch] $DisableBackButtonSupport,
        [switch] $DisableURLhash,
        [ValidateSet('none', 'fade', 'slide-horizontal', 'slide-vertical', 'slide-swing')][string] $TransitionAnimation, # 'none', // Effect on navigation, none/fade/slide-horizontal/slide-vertical/slide-swing
        [int] $TransitionSpeed, #: '400', // Transion animation speed
        [switch] $AutoProgress,
        [int] $AutoProgressInterval, # 3500, // Auto navigate Interval (used only if "autoProgress" is set to true)
        [switch] $DisableAutoProgressStopOnFocus #: true, // Stop auto navigation on focus and resume on outfocus
    )
    $Script:HTMLSchema.Features.JQuery = $true
    $Script:HTMLSchema.Features.TabsInline = $true

    $TabID = "TabPanel-$(Get-RandomStringName -Size 8 -LettersOnly)"
    if ($Tabs) {
        $Script:HTMLSchema.TabPanel = $true
        $TabContent = & $Tabs
        if ($TabContent) {
            New-HTMLTag -Tag 'div' -Attributes @{ id = $TabID; class = 'flexElement' } {
                New-HTMLTag -Tag 'ul' -Attributes @{ class = 'nav' } {
                    foreach ($Tab in $TabContent) {
                        New-HTMLTag -Tag 'li' {
                            New-HTMLTag -Tag 'a' -Attributes @{ class = 'nav-link'; href = "#$($Tab.ID)" } {
                                if ($Tab.Icon) {
                                    New-HTMLTag -Tag 'span' -Attributes @{ class = $($Tab.Icon); style = $($Tab.StyleIcon) }
                                    '&nbsp;' # adds an extra space
                                }
                                New-HTMLTag -Tag 'span' -Attributes @{ style = $($Tab.StyleText ) } -Value { $Tab.Name }
                            }
                        }
                    }
                }
                New-HTMLTag -Tag 'div' -Attributes @{ class = 'tab-content' } {
                    foreach ($Tab in $TabContent) {
                        New-HTMLTag -Tag 'div' -Attributes @{ class = 'tab-pane'; id = $Tab.ID; role = 'tabpanel' } {
                            $Tab.Content
                        }
                    }
                }
            }

            $SmartTab = [ordered] @{
                orientation = $Orientation
            }
            if ($TransitionAnimation) {
                $SmartTab['transition'] = [ordered] @{}
                $SmartTab['transition']['animation'] = $TransitionAnimation
                if ($TransitionSpeed) {
                    $SmartTab['transition']['speed'] = $TransitionSpeed
                }
            }
            if ($DisableJustification) {
                $SmartTab['justified'] = $false
            }
            if ($DisableBackButtonSupport) {
                $SmartTab['backButtonSupport'] = $false
            }
            if ($DisableURLhash) {
                $SmartTab['enableURLhash'] = $false
            }
            if ($AutoProgress) {
                $SmartTab['autoProgress'] = [ordered] @{}
                $SmartTab['autoProgress']['enabled'] = $true
                if ($AutoProgressInterval) {
                    $SmartTab['autoProgress']['interval'] = $AutoProgressInterval
                }
                if ($DisableAutoProgressStopOnFocus) {
                    $SmartTab['autoProgress']['stopOnFocus'] = $false
                }
            }

            New-HTMLTag -Tag 'script' {
                @"
            `$(document).ready(function(){
                // SmartTab initialize
                `$('#$TabID').smartTab();
            });
"@
            }
        }
        $Script:HTMLSchema.TabPanel = $false
    }
}