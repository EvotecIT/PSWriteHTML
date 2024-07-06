function New-HTMLWizardStep {
    <#
    .SYNOPSIS
    Creates a new HTML wizard step with customizable options.

    .DESCRIPTION
    This function creates a new HTML wizard step with various customization options such as setting the HTML data, tab heading, tab name, and icons.

    .PARAMETER HtmlData
    Specifies the HTML data to be displayed in the wizard step.

    .PARAMETER Heading
    Specifies the heading text for the tab.

    .PARAMETER Name
    Specifies the name of the tab.

    .PARAMETER IconBrands
    Specifies the icon for the tab from the FontAwesome Brands collection.

    .PARAMETER IconRegular
    Specifies the icon for the tab from the FontAwesome Regular collection.

    .PARAMETER IconSolid
    Specifies the icon for the tab from the FontAwesome Solid collection.

    .EXAMPLE
    New-HTMLWizardStep -HtmlData { Get-Content -Path "C:\example.html" } -Heading "Step 1" -Name "First Tab" -IconBrands "fa fa-facebook"

    Creates a new HTML wizard step with the specified HTML data, tab heading, tab name, and FontAwesome Brands icon.

    .EXAMPLE
    New-HTMLWizardStep -HtmlData { Get-Content -Path "C:\another.html" } -Heading "Step 2" -Name "Second Tab" -IconRegular "fa fa-github"

    Creates a new HTML wizard step with the specified HTML data, tab heading, tab name, and FontAwesome Regular icon.
    #>
    [CmdLetBinding(DefaultParameterSetName = 'FontAwesomeBrands')]
    param(
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $HtmlData = $(Throw "No curly brace?)"),
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [alias('TabHeading')][Parameter(Mandatory = $false, Position = 1)][String]$Heading,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [alias('TabName')][string] $Name = 'Tab',

        # ICON BRANDS
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [ArgumentCompleter(
            {
                param($CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters)
                ($Global:HTMLIcons.FontAwesomeBrands.Keys)
            }
        )]
        [ValidateScript( { $_ -in (($Global:HTMLIcons.FontAwesomeBrands.Keys)) })]
        [string] $IconBrands,

        # ICON REGULAR
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [ArgumentCompleter(
            {
                param($CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters)
                ($Global:HTMLIcons.FontAwesomeRegular.Keys)
            }
        )]
        [ValidateScript( { $_ -in (($Global:HTMLIcons.FontAwesomeRegular.Keys)) })]
        [string] $IconRegular,

        # ICON SOLID
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [ArgumentCompleter(
            {
                param($CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters)
                ($Global:HTMLIcons.FontAwesomeSolid.Keys)
            }
        )]
        [ValidateScript( { $_ -in (($Global:HTMLIcons.FontAwesomeSolid.Keys)) })]
        [string] $IconSolid,

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][object] $TextSize,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][string] $TextColor,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][object] $IconSize,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][string] $IconColor,
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string] $TextTransform,
        [string] $AnchorName
    )
    if (-not $Script:HTMLSchema.Features) {
        Write-Warning 'New-HTMLWizardStep - Creation of HTML aborted. Most likely New-HTML is missing.'
        Exit
    }
    if (-not $AnchorName) {
        $AnchorName = "WizardStep-$(Get-RandomStringName -Size 8)"
    }
    [string] $Icon = ''
    if ($IconBrands) {
        $Icon = "fab fa-$IconBrands".ToLower() # fa-$($FontSize)x"
    } elseif ($IconRegular) {
        $Icon = "far fa-$IconRegular".ToLower() # fa-$($FontSize)x"
    } elseif ($IconSolid) {
        $Icon = "fas fa-$IconSolid".ToLower() # fa-$($FontSize)x"
    }

    $StyleText = @{ }
    #if ($TextSize -ne 0) {
    $StyleText['font-size'] = ConvertFrom-Size -Size $TextSize  #"$($TextSize)px"
    #}
    if ($TextColor) {
        $StyleText.'color' = ConvertFrom-Color -Color $TextColor
    }

    $StyleText.'text-transform' = "$TextTransform"

    $StyleIcon = @{ }
    #if ($IconSize -ne 0) {
    $StyleIcon.'font-size' = ConvertFrom-Size -Size $IconSize #"$($IconSize)px"
    #}
    if ($IconColor) {
        $StyleIcon.'color' = ConvertFrom-Color -Color $IconColor
    }

    # Tabs related to tab panel (New-HTMLTabPanel)
    if ($HtmlData) {
        $WizardExecutedCode = & $HtmlData
    } else {
        $WizardExecutedCode = ''
    }
    [PSCustomObject] @{
        Name      = $Name
        ID        = $AnchorName
        Icon      = $Icon
        StyleIcon = $StyleIcon
        StyleText = $StyleText
        Content   = $WizardExecutedCode
    }
}