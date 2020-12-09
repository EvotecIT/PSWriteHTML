function New-HTMLWizard {
    <#
    .SYNOPSIS
    Provides a simple way to build wizard

    .DESCRIPTION
    Provides a simple way to build wizard

    .PARAMETER Theme
    Choose a theme to display wizard in

    .PARAMETER DisableCycleSteps
    Disables the navigation cycle through

    .PARAMETER ToolbarPosition
    Position of the toolbar (none, top, bottom, both)

    .PARAMETER ToolbarButtonPosition
    Button alignment of the toolbar (left, right, center)

    .PARAMETER HideNextButton
    Hide next button

    .PARAMETER HidePreviousButton
    Hide previous button

    .PARAMETER DiableAnchorClickable
    Disable anchor navigation

    .PARAMETER EnableAllAnchors
    Activates all anchors clickable all times

    .PARAMETER DisableMarkDoneStep
    Disable done state on navigation

    .PARAMETER DisableMarkAllPreviousStepsAsDone
    Disable when a step selected by url hash, all previous steps are marked done

    .PARAMETER RemoveDoneStepOnNavigateBack
    While navigate back done step after active step will be cleared

    .PARAMETER DisableAnchorOnDoneStep
    Disable the done steps navigation

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

    .EXAMPLE
    An example

    .NOTES
    Implementation based on: http://techlaboratory.net/jquery-smartwizard
    License: MIT
    #>
    [cmdletBinding()]
    param(
        [scriptblock] $WizardSteps,
        [ValidateSet('default', 'arrows', 'dots', 'progress')][string] $Theme,
        [switch] $DisableCycleSteps,

        [ValidateSet('bottom', 'top', 'both', 'none')][string] $ToolbarPosition,
        [ValidateSet('right', 'left', 'center')][string] $ToolbarButtonPosition,
        [switch] $HideNextButton,
        [switch] $HidePreviousButton,

        [switch] $DiableAnchorClickable, #: true, // Enable/Disable anchor navigation
        [switch] $EnableAllAnchors, #: false, // Activates all anchors clickable all times
        [switch] $DisableMarkDoneStep, #: true, // Add done state on navigation
        [switch] $DisableMarkAllPreviousStepsAsDone, #: true, // When a step selected by url hash, all previous steps are marked done
        [switch] $RemoveDoneStepOnNavigateBack, #: false, // While navigate back done step after active step will be cleared
        [switch] $DisableAnchorOnDoneStep, #: true // Enable/Disable the done steps navigation

        [switch] $DisableJustification,
        [switch] $DisableBackButtonSupport,
        [switch] $DisableURLhash,
        [ValidateSet('none', 'fade', 'slide-horizontal', 'slide-vertical', 'slide-swing')][string] $TransitionAnimation, # 'none', // Effect on navigation, none/fade/slide-horizontal/slide-vertical/slide-swing
        [int] $TransitionSpeed
    )
    $Script:HTMLSchema.Features.MainFlex = $true
    $Script:HTMLSchema.Features.JQuery = $true
    $Script:HTMLSchema.Features.Wizard = $true
    $Script:HTMLSchema.Features.RedrawObjects = $true

    $WizardID = "TabPanel-$(Get-RandomStringName -Size 8 -LettersOnly)"
    if ($WizardSteps) {
        $Script:HTMLSchema['WizardList'].Add($WizardID)
        $WizardContent = & $WizardSteps
        if ($WizardContent) {
            New-HTMLTag -Tag 'div' -Attributes @{ id = $WizardID; class = 'flexElement defaultWizard' } {
                New-HTMLTag -Tag 'ul' -Attributes @{ class = 'nav' } {
                    foreach ($Step in $WizardContent) {
                        New-HTMLTag -Tag 'li' {
                            New-HTMLTag -Tag 'a' -Attributes @{ class = 'nav-link'; href = "#$($Step.ID)" } {
                                if ($Tab.Icon) {
                                    New-HTMLTag -Tag 'span' -Attributes @{ class = $($Step.Icon); style = $($Step.StyleIcon) }
                                    '&nbsp;' # adds an extra space
                                }
                                New-HTMLTag -Tag 'span' -Attributes @{ style = $($Step.StyleText ) } -Value { $Step.Name }
                            }
                        }
                    }
                }
                New-HTMLTag -Tag 'div' -Attributes @{ class = 'tab-content flexElement' } {
                    foreach ($Step in $WizardContent) {
                        New-HTMLTag -Tag 'div' -Attributes @{ class = 'tab-pane flexElement'; id = $Step.ID; role = 'tabpanel'; style = @{ padding = '0px' } } {
                            $Step.Content
                        }
                    }
                }
                $SmartWizard = [ordered] @{
                    orientation      = $Orientation
                    autoAdjustHeight = $false # this fights with Flex
                }
                if ($Theme) {
                    $SmartWizard['theme'] = $Theme
                }
                if ($TransitionAnimation) {
                    $SmartWizard['transition'] = [ordered] @{}
                    $SmartWizard['transition']['animation'] = $TransitionAnimation
                    if ($TransitionSpeed) {
                        $SmartWizard['transition']['speed'] = $TransitionSpeed
                    }
                }
                if ($ToolbarPosition -or $ToolbarButtonPosition -or $HideNextButton -or $HidePreviousButton) {
                    $SmartWizard['toolbarSettings'] = [ordered]@{}
                    if ($ToolbarPosition) {
                        $SmartWizard['toolbarSettings']['toolbarPosition'] = $ToolbarPosition
                    }
                    if ($ToolbarButtonPosition) {
                        $SmartWizard['toolbarSettings']['toolbarButtonPosition'] = $ToolbarButtonPosition
                    }
                    if ($HideNextButton) {
                        $SmartWizard['toolbarSettings']['showNextButton'] = $false
                    }
                    if ($HidePreviousButton) {
                        $SmartWizard['toolbarSettings']['showPreviousButton'] = $false
                    }
                }

                if ($DiableAnchorClickable -or $EnableAllAnchors -or $DisableMarkDoneStep -or $DisableMarkAllPreviousStepsAsDone -or $RemoveDoneStepOnNavigateBack -or $DisableAnchorOnDoneStep) {
                    $SmartWizard['anchorSettings'] = [ordered]@{}
                    if ($DiableAnchorClickable) {
                        $SmartWizard['anchorSettings']['anchorClickable'] = $false
                    }
                    if ($EnableAllAnchors) {
                        $SmartWizard['anchorSettings']['enableAllAnchors'] = $true
                    }
                    if ($DisableMarkDoneStep) {
                        $SmartWizard['anchorSettings']['markDoneStep'] = $false
                    }
                    if ($DisableMarkAllPreviousStepsAsDone) {
                        $SmartWizard['anchorSettings']['markAllPreviousStepsAsDone'] = $false
                    }
                    if ($RemoveDoneStepOnNavigateBack) {
                        $SmartWizard['anchorSettings']['removeDoneStepOnNavigateBack'] = $true
                    }
                    if ($DisableAnchorOnDoneStep) {
                        $SmartWizard['anchorSettings']['enableAnchorOnDoneStep'] = $false
                    }
                }

                if ($DisableCycleSteps) {
                    $SmartWizard['cycleSteps'] = $false
                }
                if ($DisableJustification) {
                    $SmartWizard['justified'] = $false
                }
                if ($DisableBackButtonSupport) {
                    $SmartWizard['backButtonSupport'] = $false
                }
                if ($DisableURLhash) {
                    $SmartWizard['enableURLhash'] = $false
                }

                Remove-EmptyValue -Hashtable $SmartWizard
                $SmartWizardConfiguration = $SmartWizard | ConvertTo-Json -Depth 2

                New-HTMLTag -Tag 'script' {
                    @"
                `$(document).ready(function(){
                    // SmartWizard initialize
                    `$('#$WizardID').smartWizard($SmartWizardConfiguration);
                });
                // Initialize the stepContent event
                `$("#$WizardID").on("showStep", function (e, anchorObject, stepIndex, stepDirection) {
                    if (anchorObject[0].hash) {
                        var id = anchorObject[0].hash.replace('#', '');
                        findObjectsToRedraw(id);
                    };
                });
"@
                }
            }
            $null = $Script:HTMLSchema['WizardList'].Remove($TabID)
        }
    }
}