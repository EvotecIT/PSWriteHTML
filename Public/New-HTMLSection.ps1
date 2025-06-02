function New-HTMLSection {
    <#
    .SYNOPSIS
    Creates a new HTML section with customizable styling options.

    .DESCRIPTION
    The New-HTMLSection function creates a new HTML section with various customizable styling options such as text alignment, background color, flexbox properties, and more.

    .PARAMETER Content
    Specifies the content of the HTML section as a ScriptBlock.

    .PARAMETER HeaderText
    Specifies the header text of the section.

    .PARAMETER HeaderTextColor
    Specifies the text color of the header.

    .PARAMETER HeaderTextSize
    Specifies the text size of the header.

    .PARAMETER HeaderTextAlignment
    Specifies the text alignment of the header. Valid values are 'center', 'left', 'right', 'justify'.

    .PARAMETER HeaderBackGroundColor
    Specifies the background color of the header.

    .PARAMETER BackgroundColor
    Specifies the background color of the section.

    .PARAMETER CanCollapse
    Indicates whether the section can be collapsed.

    .PARAMETER IsHidden
    Indicates whether the section is initially hidden.

    .PARAMETER Collapsed
    Indicates whether the section is collapsed.

    .PARAMETER Height
    Specifies the height of the section.

    .PARAMETER Width
    Specifies the width of the section. Default value is '100%'.

    .PARAMETER Invisible
    Indicates whether the section is invisible.

    .PARAMETER Margin
    Specifies the margin of the section.

    .PARAMETER Wrap
    Specifies the flex-wrap property. Valid values are 'wrap', 'nowrap', 'wrap-reverse'.

    .PARAMETER Direction
    Specifies the flex-direction property. Valid values are 'row', 'row-reverse', 'column', 'column-reverse'.

    .PARAMETER AlignContent
    Specifies the align-content property. Valid values are 'flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch'.

    .PARAMETER AlignItems
    Specifies the align-items property. Valid values are 'stretch', 'flex-start', 'flex-end', 'center', 'baseline'.

    .PARAMETER JustifyContent
    Specifies the justify-content property. Valid values are 'flex-start', 'flex-end', 'center'.

    .PARAMETER BorderRadius
    Specifies the border radius of the section. Valid values are '0px', '5px', '10px', '15px', '20px', '25px'.

    .PARAMETER Density
    Specifies the layout density using intuitive names. Valid values are 'Spacious', 'Comfortable', 'Compact', 'Dense', 'VeryDense'.
    Automatically enables responsive wrapping behavior for child elements.

    .PARAMETER AnchorName
    Specifies the anchor name for the section.

    .PARAMETER StyleSheetsConfiguration
    Specifies the configuration for style sheets.

    .EXAMPLE
    New-HTMLSection -Content { "This is the content of the section." } -HeaderText "Section Title" -HeaderTextColor "blue" -HeaderTextSize "20px" -HeaderTextAlignment "center" -HeaderBackGroundColor "lightgray" -BackgroundColor "white" -CanCollapse -Height "200px" -Width "50%" -Wrap "wrap" -Direction "row" -AlignContent "center" -AlignItems "center" -JustifyContent "flex-start" -BorderRadius "10px" -AnchorName "section1" -StyleSheetsConfiguration @{ Section = 'customSection'; SectionText = 'customSectionText' }

    .EXAMPLE
    New-HTMLSection -HeaderText "Cards with Responsive Layout" -Density Comfortable {
        New-HTMLInfoCard -Title "Card 1" -Number 100 -Icon "📊"
        New-HTMLInfoCard -Title "Card 2" -Number 200 -Icon "📈"
        # Cards will automatically wrap and maintain comfortable spacing
    }

    .EXAMPLE
    $content = {
        "This is a sample content."
    }
    New-HTMLSection -Content $content -HeaderText "Sample Section" -HeaderTextColor "red" -HeaderTextSize "18px" -HeaderTextAlignment "left" -HeaderBackGroundColor "lightblue" -BackgroundColor "lightyellow" -Height "150px" -Wrap "nowrap" -Direction "column" -AlignContent "flex-start" -AlignItems "flex-start" -JustifyContent "center" -BorderRadius "5px" -AnchorName "sampleSection" -StyleSheetsConfiguration @{ Section = 'customSection'; SectionText = 'customSectionText' }
    #>
    [alias('New-HTMLContent', 'Section')]
    [CmdletBinding()]
    param (
        [Parameter(Position = 0)][ValidateNotNull()][ScriptBlock] $Content = $(throw "Open curly brace"),
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
        # Density parameter - automatically enables responsive wrapping
        [ValidateSet('Spacious', 'Comfortable', 'Compact', 'Dense', 'VeryDense')][string] $Density,

        [ValidateSet('0px', '5px', '10px', '15px', '20px', '25px')][string] $BorderRadius,

        [string] $AnchorName,
        [System.Collections.IDictionary] $StyleSheetsConfiguration
    )
    $Script:HTMLSchema.Features.Main = $true
    $Script:HTMLSchema.Features.MainFlex = $true
    $Script:HTMLSchema.Features.ResponsiveWrap = $true
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
                "color"   = $TextHeaderColorFromRGB
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
                "color"   = $TextHeaderColorFromRGB
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
            "color"   = $TextHeaderColorFromRGB
            'display' = 'none'
        }
        # hides Show button
        $HideStyle = @{
            "color"   = $TextHeaderColorFromRGB
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

    # Auto-enable responsive wrapping if Density is specified
    $ResponsiveWrap = $PSBoundParameters.ContainsKey('Density')

    if ($Wrap -or $Direction -or $ResponsiveWrap) {
        [string] $ClassName = "flexParent$(Get-RandomStringName -Size 8 -LettersOnly)"

        if ($ResponsiveWrap) {
            # Enable responsive wrapping feature
            $Script:HTMLSchema.Features.ResponsiveWrap = $true

            # Use the responsive-wrap CSS classes with Density
            $ClassName += " responsive-wrap-container density-$($Density.ToLower())"

            # Create responsive flex container - minimal attributes since CSS handles most of it
            $Attributes = @{}

            # Only override if user specified custom values
            if ($Direction) { $Attributes['flex-direction'] = $Direction }
            if ($AlignContent) { $Attributes['align-content'] = $AlignContent }
            if ($AlignItems) { $Attributes['align-items'] = $AlignItems }
            if ($JustifyContent) { $Attributes['justify-content'] = $JustifyContent }
        } else {
            $Attributes = @{
                'display'         = 'flex'
                'flex-wrap'       = if ($Wrap) { $Wrap } else { }
                'flex-direction'  = if ($Direction) { $Direction } else { }
                'align-content'   = if ($AlignContent) { $AlignContent } else { }
                'align-items'     = if ($AlignItems) { $AlignItems } else { }
                'justify-content' = if ($JustifyContent) { $JustifyContent } else { }
            }
        }

        if ($Attributes.Count -gt 0) {
            $Css = ConvertTo-LimitedCSS -ClassName $ClassName -Attributes $Attributes -Group
            $Script:HTMLSchema.CustomHeaderCSS[$AnchorName] = $Css
        }
    } else {
        if ($Invisible) {
            [string] $ClassName = "flexParentInvisible flexElement overflowHidden $($StyleSheetsConfiguration.SectionContentInvisible)"
            [string] $ClassNameNested = "flexParent flexElement overflowHidden $($StyleSheetsConfiguration.SectionContentInvisible)"
        } else {
            [string] $ClassName = "flexParent flexElement overflowHidden $($StyleSheetsConfiguration.SectionContent)"
            [string] $ClassNameNested = "flexParent flexElement overflowHidden $($StyleSheetsConfiguration.SectionContent)"
        }

        # Add responsive wrap classes if Density is specified for non-custom flex sections
        if ($PSBoundParameters.ContainsKey('Density')) {
            $Script:HTMLSchema.Features.ResponsiveWrap = $true
            $ClassName += " responsive-wrap-container density-$($Density.ToLower())"
            $ClassNameNested += " responsive-wrap-container density-$($Density.ToLower())"
        }
    }

    $ContentStyle = @{
        'justify-content' = $JustifyContent
        'flex-basis'      = if ($Width) { $Width } else { '100%' }
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