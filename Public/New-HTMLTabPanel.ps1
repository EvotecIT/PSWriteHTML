function New-HTMLTabPanel {
    [cmdletBinding()]
    param(
        [ScriptBlock] $Tabs
    )
    $Script:HTMLSchema.Features.JQuery = $true
    $Script:HTMLSchema.Features.TabsInline = $true

    $TabID = "TabPanel-$(Get-RandomStringName -Size 8 -LettersOnly)"
    if ($Tabs) {
        $TabContent = & $Tabs
        if ($TabContent) {
            New-HTMLTag -Tag 'div' -Attributes @{ id = $TabID; class = 'flexElement' } {
                New-HTMLTag -Tag 'ul' -Attributes @{ class = 'nav' } {
                    foreach ($Tab in $TabContent) {
                        New-HTMLTag -Tag 'li' {
                            New-HTMLTag -Tag 'a' -Attributes @{ class = 'nav-link'; href = "#$($Tab.ID)" } {
                                $Tab.Name
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
            New-HTMLTag -Tag 'script' {
                @"
            `$(document).ready(function(){
                // SmartTab initialize
                `$('#$TabID').smartTab();
            });
"@
            }
        }
    }
}

function New-HTMLTabPanelTab {
    [cmdletBinding()]
    param(
        [scriptblock] $TabContent,
        [string] $Name
    )

    if ($TabContent) {
        $TabExecutedCode = & $TabContent
    } else {
        $TabExecutedCode = ''
    }
    [PSCustomObject] @{
        Name    = $Name
        ID      = "TabPanelID-$(Get-RandomStringName -Size 8 -LettersOnly)"
        Content = $TabExecutedCode
    }
}