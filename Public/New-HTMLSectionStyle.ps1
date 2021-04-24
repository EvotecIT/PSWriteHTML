function New-HTMLSectionStyle {
    [alias("New-HTMLSectionOptions", 'SectionOption', 'New-HTMLSectionOption')]
    [cmdletBinding()]
    param(
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('0px', '5px', '10px', '15px', '20px', '25px')][string] $BorderRadius,

        [Parameter(ParameterSetName = 'Manual')][switch] $RemoveShadow,

        [Parameter(ParameterSetName = 'Manual')][alias('TextColor')][string]$HeaderTextColor,
        [Parameter(ParameterSetName = 'Manual')][alias('TextAlignment')][string][ValidateSet('center', 'left', 'right', 'justify')] $HeaderTextAlignment,
        [Parameter(ParameterSetName = 'Manual')][alias('TextBackGroundColor')][string]$HeaderBackGroundColor,
        [Parameter(ParameterSetName = 'Manual')][switch] $HeaderRemovePadding,


        [Parameter(ParameterSetName = 'Manual')][string][ValidateSet('wrap', 'nowrap', 'wrap-reverse')] $Wrap,
        [Parameter(ParameterSetName = 'Manual')][string][ValidateSet('row', 'row-reverse', 'column', 'column-reverse')] $Direction,
        [Parameter(ParameterSetName = 'Manual')][string][ValidateSet('flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch')] $Align,
        [Parameter(ParameterSetName = 'Manual')][string][ValidateSet('stretch', 'flex-start', 'flex-end', 'center', 'baseline')] $AlignItems,
        [Parameter(ParameterSetName = 'Manual')][string][ValidateSet('flex-start', 'flex-end', 'center')] $Justify,
        [Parameter(ParameterSetName = 'Manual')][string][ValidateSet('-180deg', '-90deg', '90deg', '180deg')] $Rotate,

        [Parameter(ParameterSetName = 'Manual')][alias('BackgroundShade')][string]$BackgroundColorContent,
        [string][ValidateSet('wrap', 'nowrap', 'wrap-reverse')] $WrapContent,
        [string][ValidateSet('row', 'row-reverse', 'column', 'column-reverse')] $DirectionContent,
        [string][ValidateSet('flex-start', 'flex-end', 'center', 'space-between', 'space-around', 'stretch')] $AlignContent,
        [string][ValidateSet('stretch', 'flex-start', 'flex-end', 'center', 'baseline')] $AlignItemsContent,
        [string][ValidateSet('flex-start', 'flex-end', 'center')] $JustifyContent,

        [Parameter(ParameterSetName = 'Manual')][ValidateSet('vertical-rl', 'vertical-lr', 'horizontal-tb')][string] $WritingMode,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('mixed', 'upright')][string] $TextOrientation,

        [Parameter(ParameterSetName = 'Manual')][switch] $RequestConfiguration
    )
    # lets get original CSS configuration
    # this is read from $Script:Configuration (or more precise $Script:CurrentConfiguration which is a copy on New-HTML start)
    $CssConfiguration = Get-ConfigurationCss -Feature 'DefaultSection' -Type 'HeaderAlways'
    $StyleSheetsConfiguration = [ordered] @{
        Section                 = ".defaultSection"
        SectionText             = ".defaultSectionText"
        SectionHead             = ".defaultSectionHead"
        SectionContent          = '.defaultSectionContent'
        SectionContentInvisible = '.defaultSectionContentInvisible'
    }

    if ($RequestConfiguration) {
        # This copies current CSS that we need (in this case defaultSection,defaultSectionText, defaultSectionHead)
        # Inserts it into $Script:CurrentConfiguration
        # Which then will be inserted into HTML
        # finally it returns new names for sections above
        $RequestedConfiguration = New-RequestCssConfiguration -Pair $StyleSheetsConfiguration -CSSConfiguration $CssConfiguration -Feature 'Inject' -Type 'HeaderAlways'
        $StyleSheetsConfiguration = $RequestedConfiguration.StyleSheetConfiguration
        $CssConfiguration = $RequestedConfiguration.CSSConfiguration
        <#
        # We define how our CSS classes will be called - this can be per Section so we need to have it random
        $Name = $(Get-RandomStringName -Size 7)
        $ExpectedStyleSheetsConfiguration = [ordered] @{
            Section     = "defaultSection-$Name"
            SectionText = "defaultSectionText-$Name"
            SectionHead = "defaultSectionHead-$Name"
        }
        # We want to use different configuration for section based on existing original template
        # So we copy original CSSConfiguration
        $CssConfiguration = Copy-Dictionary -Dictionary $CssConfiguration
        # We then remove everything we're not interested in leaving only 2 sections that we modify
        Remove-ConfigurationCSS -CSS $CssConfiguration -Not -Section $StyleSheetsConfiguration.Values # 'defaultSection', 'defaultSectionText', 'defaultSectionHead'
        # We now need to rename existing CSS classes to their new names
        Rename-Dictionary -HashTable $CssConfiguration -Pair @{
            $StyleSheetsConfiguration.Section     = $ExpectedStyleSheetsConfiguration.Section
            $StyleSheetsConfiguration.SectionText = $ExpectedStyleSheetsConfiguration.SectionText
            $StyleSheetsConfiguration.SectionHead = $ExpectedStyleSheetsConfiguration.SectionHead
        }

        # Now we need to get already existing CSS code that we may have generaed for other sections
        $CssOtherConfiguration = Get-ConfigurationCss -Feature 'Inject' -Type 'HeaderAlways'
        # Finally we need to inject this into CSSInline configuration so it's delivered as style to final destination
        Set-ConfigurationCSS -CSS ($CssOtherConfiguration + $CssConfiguration) -Feature 'Inject' -Type 'HeaderAlways'

        # We also need to tell that we actually want this added
        $Script:HTMLSchema.Features.Inject = $true
        # Finally we overwrite what we need to deliver to users
        $StyleSheetsConfiguration = [ordered] @{
            Section     = $ExpectedStyleSheetsConfiguration.Section
            SectionText = $ExpectedStyleSheetsConfiguration.SectionText
            SectionHead = $ExpectedStyleSheetsConfiguration.SectionHead
        }
        #>
    }

    # Manage SECTION
    if ($Wrap -or $Direction -or $Align -or $AlignItems) {
        # This makes sure we can control placement of HEAD within SECTION
        Add-ConfigurationCSS -CSS $CssConfiguration -Name $StyleSheetsConfiguration.Section -Inject @{
            'display'        = 'flex'
            'flex-direction' = $Direction
        }
    }

    # keep in mind that also empty elements will be removed from this
    # so if background color is empty it will be removed from "overwritting"
    $SectionStyle = @{
        "background-color" = ConvertFrom-Color -Color $BackgroundColorContent
        'border-radius'    = $BorderRadius
    }
    Add-ConfigurationCSS -CSS $CssConfiguration -Name $StyleSheetsConfiguration.Section -Inject $SectionStyle

    # Removing elements needs to be defined separatly
    if ($BackgroundColorContent -eq 'none') {
        Remove-ConfigurationCSS -CSS $CssConfiguration -Name $StyleSheetsConfiguration.Section -Property 'background-color'
    }
    if ($RemoveShadow) {
        Remove-ConfigurationCSS -CSS $CssConfiguration -Name $StyleSheetsConfiguration.Section -Property 'box-shadow'
    }

    # Manage SECTION HEAD behaviour
    <#
    $SectionHeadStyle = @{
        "text-align"       = $HeaderTextAlignment
        "background-color" = ConvertFrom-Color -Color $HeaderBackGroundColor
        'align-content'    = $AlignContent
    }
    #>

    $SectionHeadStyle = @{
        'flex-wrap'        = $Wrap
        'flex-direction'   = $Direction
        'align-content'    = $Align
        'align-items'      = $AlignItems
        'justify-content'  = $Justify
        "background-color" = ConvertFrom-Color -Color $HeaderBackGroundColor
        'border-radius'    = $BorderRadius
        "text-align"       = $HeaderTextAlignment
        "transform"        = ConvertFrom-Rotate -Rotate $Rotate
    }

    Add-ConfigurationCSS -CSS $CssConfiguration -Name $StyleSheetsConfiguration.SectionHead -Inject $SectionHeadStyle

    # colors are a bit special, since ConvertFrom-Color when given nothing or none will simply return empty string
    # this means it would be removed by Add-ConfigurationCSS
    # so if user requests removal of background color we need to remove it
    if ($HeaderBackGroundColor -eq 'none') {
        Remove-ConfigurationCSS -CSS $CssConfiguration -Name $StyleSheetsConfiguration.SectionHead -Property 'background-color'
    }
    if ($HeaderRemovePadding) {
        Remove-ConfigurationCSS -CSS $CssConfiguration -Name $StyleSheetsConfiguration.SectionHead -Property 'padding'
    }

    # Manage SECTION TEXT behavior
    $SectionHeadTextStyle = @{
        'writing-mode'     = $WritingMode
        'text-orientation' = $TextOrientation
        'color'            = ConvertFrom-Color -Color $HeaderTextColor
    }
    Add-ConfigurationCSS -CSS $CssConfiguration -Name $StyleSheetsConfiguration.SectionText -Inject $SectionHeadTextStyle

    if ($HeaderTextColor -eq 'none') {
        Remove-ConfigurationCSS -CSS $CssConfiguration -Name $StyleSheetsConfiguration.SectionText -Property 'color'
    }


    if ($WrapContent -or $DirectionContent -or $AlignContent -or $AlignItemsContent -or $JustifyContent) {
        # This makes sure we can control placement of HEAD within SECTION
        Add-ConfigurationCSS -CSS $CssConfiguration -Name $StyleSheetsConfiguration.SectionContent -Inject @{ display = 'flex' }
    }

    $SectionContentStyle = @{
        'flex-wrap'       = $WrapContent
        'flex-direction'  = $DirectionContent
        'align-content'   = $AlignContent
        'align-items'     = $AlignItemsContent
        'justify-content' = $JustifyContent
    }
    Add-ConfigurationCSS -CSS $CssConfiguration -Name $StyleSheetsConfiguration.SectionContent -Inject $SectionContentStyle
    Add-ConfigurationCSS -CSS $CssConfiguration -Name $StyleSheetsConfiguration.SectionContentInvisible -Inject $SectionContentStyle

    if ($RequestConfiguration) {
        # We only return this when requesting configuration
        # otherwise this overwrites global section settings
        return $StyleSheetsConfiguration
    }

}