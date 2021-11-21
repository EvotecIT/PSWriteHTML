Function New-HTMLSection {
    [alias('New-HTMLContent', 'Section')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0)][ValidateNotNull()][ScriptBlock] $Content = $(Throw "Open curly brace"),
        [alias('Name', 'Title')][Parameter(Mandatory = $false)][string]$HeaderText,
        [alias('TextColor')][string]$HeaderTextColor,
        [alias('TextSize')][string] $HeaderTextSize,
        [alias('TextAlignment')][string][ValidateSet('center', 'left', 'right', 'justify')] $HeaderTextAlignment,
        [alias('TextBackGroundColor')][string]$HeaderBackGroundColor,
        [alias('BackgroundShade')][string]$BackgroundColor,
        [alias('Collapsable')][Parameter(Mandatory = $false)][switch] $CanCollapse,
        [switch] $IsHidden,
        [switch] $Collapsed,
        [object] $Height,
        [object] $Width = '100%',
        [switch] $Invisible,
        [object] $Margin,
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
    $Script:HTMLSchema.Features.Main = $true
    $Script:HTMLSchema.Features.MainFlex = $true
    # This is so we can support external CSS configuration
    if (-not $StyleSheetsConfiguration) {
        $StyleSheetsConfiguration = [ordered] @{
            Section                 = 'defaultSection'
            SectionText             = 'defaultSectionText'
            SectionHead             = "defaultSectionHead"
            SectionContent          = 'defaultSectionContent'
            SectionContentInvisible = 'defaultSectionContentInvisible'
        }
    }
    # This takes care of starting dots in $StyleSheetsConfiguration
    Remove-DotsFromCssClass -Css $StyleSheetsConfiguration
    if (-not $AnchorName) {
        $AnchorName = "anchor-$(Get-RandomStringName -Size 7)"
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
    $TextSize = ConvertFrom-Size -Size $HeaderTextSize
    $HiddenDivStyle = [ordered] @{ }
    $AttributesTop = [ordered] @{}

    # depending on flex-direction for section collapsing works a bit differently
    # we need to find out what is required flex direction and applky rules accordingly
    # same thing happens on JS level in hideSection.js
    if ($StyleSheetsConfiguration.Section -eq 'defaultSection') {
        $Script:HTMLSchema.Features.DefaultSection = $true
        $CurrentFlexDirection = $Script:CurrentConfiguration['Features']['DefaultSection']['HeaderAlways']['CssInline'][".$($StyleSheetsConfiguration.Section)"]['flex-direction']
    } else {
        $CurrentFlexDirection = $Script:CurrentConfiguration['Features']['Inject']['HeaderAlways']['CssInline'][".$($StyleSheetsConfiguration.Section)"]['flex-direction']
    }

    if ($CanCollapse) {
        $Script:HTMLSchema.Features.HideSection = $true
        $Script:HTMLSchema.Features.RedrawObjects = $true
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

            if ($CurrentFlexDirection -eq 'Row') {
                $ClassTop = "sectionHide"
            }
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
            if ($CurrentFlexDirection -eq 'Row') {
                $ClassTop = "sectionShow"
            }
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
        $ClassTop = ''
    }

    $AttributesTop['class'] = "$($StyleSheetsConfiguration.Section) overflowHidden $ClassTop"
    $AttributesTop['style'] = [ordered] @{
        "background-color" = ConvertFrom-Color -Color $BackgroundColor
        'border-radius'    = $BorderRadius
        'flex-basis'       = $Width
    }
    if ($PSBoundParameters.ContainsKey('Margin')) {
        $AttributesTop['style']['margin'] = ConvertFrom-Size -Size $Margin
    }
    if ($IsHidden) {
        $AttributesTop['style']["display"] = 'none'
    }

    if ($Invisible) {
        $AttributesTop['style']['height'] = ConvertFrom-Size -Size $Height
    } else {
        $HiddenDivStyle['height'] = ConvertFrom-Size -Size $Height
    }

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

        #$Script:HTMLSchema.CustomHeaderCSS.Add($Css)
        $Script:HTMLSchema.CustomHeaderCSS[$AnchorName] = $Css
    } else {
        if ($Invisible) {
            [string] $ClassName = "flexParentInvisible flexElement overflowHidden $($StyleSheetsConfiguration.SectionContentInvisible)"
            [string] $ClassNameNested = "flexParent flexElement overflowHidden $($StyleSheetsConfiguration.SectionContentInvisible)"
        } else {
            [string] $ClassName = "flexParent flexElement overflowHidden $($StyleSheetsConfiguration.SectionContent)"
            [string] $ClassNameNested = "flexParent flexElement overflowHidden $($StyleSheetsConfiguration.SectionContent)"
        }
    }

    $ContentStyle = @{
        'justify-content' = $JustifyContent
    }

    $DivHeaderStyle = @{
        #"text-align"       = $HeaderTextAlignment
        'justify-content'  = $HeaderAlignment
        'font-size'        = $TextSize
        "background-color" = ConvertFrom-Color -Color $HeaderBackGroundColor
    }
    $HeaderStyle = @{ "color" = $TextHeaderColorFromRGB }
    if ($Invisible) {
        New-HTMLTag -Tag 'div' -Attributes @{ class = $ClassName; style = $AttributesTop['style'] } -Value {
            New-HTMLTag -Tag 'div' -Attributes @{ class = $ClassNameNested; Style = $ContentStyle } -Value {
                $Object = Invoke-Command -ScriptBlock $Content
                if ($null -ne $Object) {
                    $Object
                }
            }
        }
    } else {
        New-HTMLTag -Tag 'div' -Attributes $AttributesTop -Value {
            New-HTMLTag -Tag 'div' -Attributes @{ class = $StyleSheetsConfiguration.SectionHead; style = $DivHeaderStyle } -Value {
                New-HTMLTag -Tag 'div' -Attributes @{ class = $StyleSheetsConfiguration.SectionText } {
                    New-HTMLAnchor -Name $HeaderText -Text "$HeaderText " -Style $HeaderStyle
                    "&nbsp;" # this adds hard space
                    New-HTMLAnchor -Id "show_$AnchorName" -Href 'javascript:void(0)' -OnClick "show('$AnchorName'); " -Style $ShowStyle -Text '(Show)'
                    New-HTMLAnchor -Id "hide_$AnchorName" -Href 'javascript:void(0)' -OnClick "hide('$AnchorName'); " -Style $HideStyle -Text '(Hide)'
                }
            }
            New-HTMLTag -Tag 'div' -Attributes @{ name = $AnchorName; class = $ClassName; id = $AnchorName; style = $HiddenDivStyle } -Value {
                New-HTMLTag -Tag 'div' -Attributes @{ class = "$ClassNameNested collapsable"; id = $AnchorName; style = $ContentStyle } -Value {
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