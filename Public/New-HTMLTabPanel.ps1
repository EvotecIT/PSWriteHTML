function New-HTMLTabPanel {
    <#
    .SYNOPSIS
    Flexible and easy to implement Tab Panel with a lot of features, cool animation effects, event support, easy to customize.

    .DESCRIPTION
    Flexible and easy to implement Tab Panel with a lot of features, cool animation effects, event support, easy to customize.

    .PARAMETER Orientation
    Nav menu orientation. Default value is 'horizontal'.

    .PARAMETER DisableJustification
    Disable navigation menu justification

    .PARAMETER DisableBackButtonSupport
    Disable the back button support

    .PARAMETER DisableURLhash
    Disable selection of the tab based on url hash

    .PARAMETER TransitionAnimation
    Effect on navigation, none/fade/slide-horizontal/slide-vertical/slide-swing

    .PARAMETER TransitionSpeed
    Transion animation speed. Default 400

    .PARAMETER AutoProgress
    Enables auto navigation

    .PARAMETER AutoProgressInterval
    Auto navigate Interval (used only if "autoProgress" is enabled). Default 3500

    .PARAMETER DisableAutoProgressStopOnFocus
    Disable stop auto navigation on focus and resume on outfocus (used only if "autoProgress" is enabled)

    .EXAMPLE
    An example

    .NOTES
    Implementation based on: http://techlaboratory.net/jquery-smarttab
    License: MIT

    #>
    [cmdletBinding()]
    param(
        [ScriptBlock] $Tabs,
        [ValidateSet('horizontal', 'vertical')][string] $Orientation,
        [switch] $DisableJustification,
        [switch] $DisableBackButtonSupport,
        [switch] $DisableURLhash,
        [ValidateSet('none', 'fade', 'slide-horizontal', 'slide-vertical', 'slide-swing')][string] $TransitionAnimation, # 'none', // Effect on navigation, none/fade/slide-horizontal/slide-vertical/slide-swing
        [int] $TransitionSpeed,
        [switch] $AutoProgress,
        [int] $AutoProgressInterval,
        [switch] $DisableAutoProgressStopOnFocus
    )
    $Script:HTMLSchema.Features.JQuery = $true
    $Script:HTMLSchema.Features.TabsInline = $true
    $Script:HTMLSchema.Features.RedrawObjects = $true

    $TabID = "TabPanel-$(Get-RandomStringName -Size 8 -LettersOnly)"
    if ($Tabs) {
        $Script:HTMLSchema['TabPanelsList'].Add($TabID)
        $TabContent = & $Tabs
        if ($TabContent) {
            New-HTMLTag -Tag 'div' -Attributes @{ id = $TabID; class = 'flexElement'; style = @{margin = '5px' } } {
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
                New-HTMLTag -Tag 'div' -Attributes @{ class = 'tab-content flexElement' } {
                    foreach ($Tab in $TabContent) {
                        New-HTMLTag -Tag 'div' -Attributes @{ class = 'tab-pane flexElement'; id = $Tab.ID; role = 'tabpanel'; style = @{ padding = '0px' } } {
                            $Tab.Content
                        }
                    }
                }
            }
            $SmartTab = [ordered] @{
                orientation      = $Orientation
                autoAdjustHeight = $false # this fights with Flex
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
            Remove-EmptyValue -Hashtable $SmartTab
            $SmartTabConfiguration = $SmartTab | ConvertTo-Json -Depth 2

            New-HTMLTag -Tag 'script' {
                @"
            `$(document).ready(function(){
                // SmartTab initialize
                `$('#$TabID').smartTab($SmartTabConfiguration);
                `$("#$TabID").on("showTab", function(e, anchorObject, tabIndex) {
                    //alert("You are on tab "+tabIndex+" now");
                    if (anchorObject[0].hash) {
                        var id = anchorObject[0].hash.replace('#', '');
                        findObjectsToRedraw(id);
                    };
                });
            });
"@
            }
        }
        $null = $Script:HTMLSchema['TabPanelsList'].Remove($TabID)
    }
}