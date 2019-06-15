Function New-HTMLSection {
    [alias('New-HTMLContent')]
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $Content = $(Throw "Open curly brace"),
        [alias('Name')][Parameter(Mandatory = $false)][string]$HeaderText,
        [RGBColors]$HeaderTextColor = [RGBColors]::White,
        [string][ValidateSet('center', 'left', 'right', 'justify')] $HeaderTextAlignment = 'center',
        [RGBColors]$HeaderBackGroundColor = [RGBColors]::DeepSkyBlue,
        [alias('BackgroundShade')][RGBColors]$BackgroundColor = [RGBColors]::None,
        [alias('Collapsable')][Parameter(Mandatory = $false)][switch] $CanCollapse,
        [Parameter(Mandatory = $false)][switch] $IsHidden,
        [switch] $Collapsed,
        [int] $Height,
        [switch] $Invisible

    )
    $RandomNumber = Get-Random
    $TextHeaderColorFromRGB = ConvertFrom-Color -Color $HeaderTextColor

    if ($CanCollapse) {
        $Script:HTMLSchema.Features.HideSection = $true
        if ($IsHidden) {
            $ShowStyle = "color: $TextHeaderColorFromRGB;" # shows Show button
            $HideStyle = "color: $TextHeaderColorFromRGB; display:none;" # hides Hide button
        } else {
            if ($Collapsed) {
                $HideStyle = "color: $TextHeaderColorFromRGB; display:none;" # hides Show button
                $ShowStyle = "color: $TextHeaderColorFromRGB;" # shows Hide button
                $HiddenDivStyle = 'display:none;'
            } else {
                $ShowStyle = "color: $TextHeaderColorFromRGB; display:none;" # hides Show button
                $HideStyle = "color: $TextHeaderColorFromRGB;" # shows Hide button
            }
        }
    } else {
        if ($IsHidden) {
            $ShowStyle = "color: $TextHeaderColorFromRGB;" # shows Show button
            $HideStyle = "color: $TextHeaderColorFromRGB; display:none;" # hides Hide button
        } else {
            $ShowStyle = "color: $TextHeaderColorFromRGB; display:none;" # hides Show button
            $HideStyle = "color: $TextHeaderColorFromRGB; display:none;" # hides Show button
        }
    }
    if ($IsHidden) {
        $DivContentStyle = @{
            "display"          = 'none'
            #"width"            = "calc(100% / $Count - 15px)"
            "height"           = if ($Height -ne 0) { "height: $($Height)px" } else { '' }
            "background-color" = ConvertFrom-Color -Color $BackgroundColor
        }
    } else {
        $DivContentStyle = @{
            # "width"            = "calc(100% / $Count - 15px)"
            "height"           = if ($Height -ne 0) { "height: $($Height)px" } else { '' }
            "background-color" = ConvertFrom-Color -Color $BackgroundColor
        }
    }

    $DivHeaderStyle = @{
        "text-align"       = $HeaderTextAlignment
        "background-color" = ConvertFrom-Color -Color $HeaderBackGroundColor
    }
    $HeaderStyle = "color: $TextHeaderColorFromRGB;"
    if ($Invisible) {
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'defaultContainerOther' } -Value {
            New-HTMLTag -Tag 'div' -Attributes @{ class = 'defaultContainerOther defaultPanelOther' } -Value {
                $Object = Invoke-Command -ScriptBlock $Content
                if ($null -ne $Object) {
                    $Object
                }
            }
        }
    } else {
        # return this HTML
        New-HTMLTag -Tag 'div' -Attributes @{ 'class' = "defaultSection defaultCard"; 'style' = $DivContentStyle } -Value {
            New-HTMLTag -Tag 'div' -Attributes @{ 'class' = "defaultHeader"; 'style' = $DivHeaderStyle } -Value {
                New-HTMLAnchor -Name $HeaderText -Text $HeaderText -Style $HeaderStyle
                New-HTMLAnchor -Id "show_$RandomNumber" -Href 'javascript:void(0)' -OnClick "show('$RandomNumber');" -Style $ShowStyle -Text '(Show)'
                New-HTMLAnchor -Id "hide_$RandomNumber" -Href 'javascript:void(0)' -OnClick "hide('$RandomNumber');" -Style $HideStyle -Text '(Hide)'
            }
            New-HTMLTag -Tag 'div' -Attributes @{ class = 'defaultContainerOther'; id = $RandomNumber; Style = $HiddenDivStyle } -Value {
                New-HTMLTag -Tag 'div' -Attributes @{ class = 'defaultContainer defaultPanelOther collapsable'; id = $RandomNumber; } -Value {
                    $Object = Invoke-Command -ScriptBlock $Content
                    if ($null -ne $Object) {
                        $Object
                    }
                }
            }
        }
    }
}