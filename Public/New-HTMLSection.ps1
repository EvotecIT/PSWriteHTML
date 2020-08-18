Function New-HTMLSection {
    [alias('New-HTMLContent', 'Section')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0)][ValidateNotNull()][ScriptBlock] $Content = $(Throw "Open curly brace"),
        [alias('Name', 'Title')][Parameter(Mandatory = $false)][string]$HeaderText,
        [alias('TextColor')][string]$HeaderTextColor,
        [alias('TextAlignment')][string][ValidateSet('center', 'left', 'right', 'justify')] $HeaderTextAlignment,
        [alias('TextBackGroundColor')][string]$HeaderBackGroundColor,
        [alias('BackgroundShade')][string]$BackgroundColor,
        [alias('Collapsable')][Parameter(Mandatory = $false)][switch] $CanCollapse,
        [switch] $IsHidden,
        [switch] $Collapsed,
        [int] $Height,
        [switch] $Invisible,
        # Following are based on https://css-tricks.com/snippets/css/a-guide-to-flexbox/
        [string][ValidateSet('wrap', 'nowrap', 'wrap-reverse')] $Wrap,
        [string][ValidateSet('row', 'row-reverse', 'column', 'column-reverse')] $Direction,
        [string][ValidateSet('flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch')] $AlignContent,
        [string][ValidateSet('stretch', 'flex-start', 'flex-end', 'center', 'baseline')] $AlignItems,
        [string][ValidateSet('flex-start', 'flex-end', 'center')] $JustifyContent,

        [ValidateSet('0px', '5px', '10px', '15px', '20px', '25px')][string] $BorderRadius,

        [string] $AnchorName,
        [System.Collections.IDictionary] $StyleSheetsConfiguration
    )
    # This is so we can support external CSS configuration
    if (-not $StyleSheetsConfiguration) {
        $StyleSheetsConfiguration = [ordered] @{
            Section        = 'defaultSection'
            SectionText    = 'defaultSectionText'
            SectionHead    = "defaultSectionHead"
            SectionContent = 'defaultSectionContent'
        }
    }
    if (-not $AnchorName) {
        $AnchorName = Get-Random
    }

    if ($HeaderTextAlignment) {
        # We need to translate it to Justify-Alignement - because Text-Aligment doesn't work with flex
        if ($HeaderTextAlignment -eq 'justify' -or $HeaderTextAlignment -eq 'center') {
            $HeaderAlignment = 'center'
        } elseif ($HeaderTextAlignment -eq 'left') {
            $HeaderAlignment = 'flex-start'
        } elseif ($HeaderTextAlignment -eq 'right') {
            $HeaderAlignment = 'flex-end'
        } else {

        }
    }
    $TextHeaderColorFromRGB = ConvertFrom-Color -Color $HeaderTextColor
    $HiddenDivStyle = [ordered] @{ }

    if ($CanCollapse) {
        $Script:HTMLSchema.Features.HideSection = $true
        if ($IsHidden) {
            # shows Show button
            $ShowStyle = @{
                "color" = $TextHeaderColorFromRGB
            }
            # hides Hide button
            $HideStyle = @{
                "color"   = $TextHeaderColorFromRGB
                'display' = 'none'
            }
        } else {
            if ($Collapsed) {
                # hides Show button
                $HideStyle = @{
                    "color"   = $TextHeaderColorFromRGB;
                    'display' = 'none'
                }
                # shows Hide button
                $ShowStyle = @{
                    "color" = $TextHeaderColorFromRGB
                }
                $HiddenDivStyle['display'] = 'none'
            } else {
                # hides Show button
                $ShowStyle = @{
                    "color"   = $TextHeaderColorFromRGB;
                    'display' = 'none'
                }
                # shows Hide button
                $HideStyle = @{
                    "color" = $TextHeaderColorFromRGB
                }
            }
        }
    } else {
        if ($IsHidden) {
            # shows Show button
            $ShowStyle = @{
                "color" = $TextHeaderColorFromRGB
            }
            # hides Hide button
            $HideStyle = @{
                "color"   = $TextHeaderColorFromRGB
                'display' = 'none'
            }
        } else {
            # hides Show button
            $ShowStyle = @{
                "color"   = $TextHeaderColorFromRGB;
                'display' = 'none'
            }
            # hides Show button
            $HideStyle = @{
                "color"   = $TextHeaderColorFromRGB;
                'display' = 'none'
            }
        }
    }
    $DivContentStyle = [ordered] @{
        "background-color" = ConvertFrom-Color -Color $BackgroundColor
        'border-radius'    = $BorderRadius
    }
    if ($IsHidden) {
        $DivContentStyle["display"] = 'none'
    }

    $HiddenDivStyle['height'] = if ($Height -ne 0) { "$($Height)px" } else { '' }

    if ($Wrap -or $Direction) {
        [string] $ClassName = "flexParent$(Get-RandomStringName -Size 8 -LettersOnly)"
        $Attributes = @{
            'display'        = 'flex'
            'flex-wrap'      = if ($Wrap) { $Wrap } else { }
            'flex-direction' = if ($Direction) { $Direction } else { }
            'align-content'  = if ($AlignContent) { $AlignContent } else { }
            'align-items'    = if ($AlignItems) { $AlignItems } else { }
        }
        $Css = ConvertTo-LimitedCSS -ClassName $ClassName -Attributes $Attributes

        $Script:HTMLSchema.CustomHeaderCSS.Add($Css)
    } else {
        [string] $ClassName = "flexParent flexElement overflowHidden $($StyleSheetsConfiguration.SectionContent)"
    }

    $ContentStyle = @{
        'justify-content' = $JustifyContent
    }

    $DivHeaderStyle = @{
        #"text-align"       = $HeaderTextAlignment
        'justify-content'  = $HeaderAlignment
        "background-color" = ConvertFrom-Color -Color $HeaderBackGroundColor
    }
    $HeaderStyle = @{ "color" = $TextHeaderColorFromRGB }
    if ($Invisible) {
        New-HTMLTag -Tag 'div' -Attributes @{ class = $ClassName } -Value {
            New-HTMLTag -Tag 'div' -Attributes @{ class = $ClassName; Style = $ContentStyle } -Value {
                $Object = Invoke-Command -ScriptBlock $Content
                if ($null -ne $Object) {
                    $Object
                }
            }
        }
    } else {
        New-HTMLTag -Tag 'div' -Attributes @{ class = "$($StyleSheetsConfiguration.Section) overflowHidden"; style = $DivContentStyle } -Value {
            New-HTMLTag -Tag 'div' -Attributes @{ class = $StyleSheetsConfiguration.SectionHead; style = $DivHeaderStyle } -Value {
                New-HTMLTag -Tag 'div' -Attributes @{ class = $StyleSheetsConfiguration.SectionText } {
                    New-HTMLAnchor -Name $HeaderText -Text "$HeaderText " -Style $HeaderStyle
                    "&nbsp;" # this adds hard space
                    New-HTMLAnchor -Id "show_$AnchorName" -Href 'javascript:void(0)' -OnClick "show('$AnchorName'); " -Style $ShowStyle -Text '(Show)'
                    New-HTMLAnchor -Id "hide_$AnchorName" -Href 'javascript:void(0)' -OnClick "hide('$AnchorName'); " -Style $HideStyle -Text '(Hide)'
                }
            }
            New-HTMLTag -Tag 'div' -Attributes @{ name = $AnchorName; class = $ClassName; id = $AnchorName; style = $HiddenDivStyle } -Value {
                New-HTMLTag -Tag 'div' -Attributes @{ class = "$ClassName collapsable"; id = $AnchorName; style = $ContentStyle } -Value {
                    $Object = Invoke-Command -ScriptBlock $Content
                    if ($null -ne $Object) {
                        $Object
                    }
                }
            }
        }
    }
}

Register-ArgumentCompleter -CommandName New-HTMLSection -ParameterName HeaderTextColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLSection -ParameterName HeaderBackGroundColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLSection -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors