function New-NavFloatWidgetItem {
    <#
    .SYNOPSIS
    Creates a new navigation float item with specified parameters.

    .DESCRIPTION
    This function creates a new navigation float item with the provided parameters. It allows customization of the item's name, link, icon, color, and other properties.

    .PARAMETER Name
    Specifies the name of the navigation float item.

    .PARAMETER Href
    Specifies the URL link for the navigation float item.

    .PARAMETER InternalPageID
    Specifies the internal page ID for the navigation float item.

    .PARAMETER LinkHome
    Indicates whether the navigation float item should link to the home page.

    .PARAMETER IconColor
    Specifies the color of the icon for the navigation float item.

    .PARAMETER IconBrands
    Specifies the icon brand for the navigation float item. Valid values are: $($Global:HTMLIcons.FontAwesomeBrands.Keys).

    .PARAMETER IconRegular
    Specifies the regular icon for the navigation float item. Valid values are: $($Global:HTMLIcons.FontAwesomeRegular.Keys).

    .EXAMPLE
    PS C:\> New-NavFloatWidgetItem -Name "Home" -Href "https://www.example.com" -IconBrands "fab fa-home" -IconColor "blue"

    Creates a new navigation float item named "Home" that links to "https://www.example.com" with a blue home icon.

    .EXAMPLE
    PS C:\> New-NavFloatWidgetItem -Name "About" -InternalPageID "about" -LinkHome

    Creates a new navigation float item named "About" that links to the internal page with ID "about" and links to the home page.

    #>
    [cmdletBinding(DefaultParameterSetName = 'FontAwesomeSolid')]
    param(
        [parameter(Mandatory, ParameterSetName = "FontAwesomeBrands")]
        [parameter(Mandatory, ParameterSetName = "FontAwesomeRegular")]
        [parameter(Mandatory, ParameterSetName = "FontAwesomeSolid")]
        [parameter(Mandatory, ParameterSetName = "FontMaterial")][string] $Name,

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "FontMaterial")][string] $Href,

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "FontMaterial")][string] $InternalPageID,

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "FontMaterial")][switch] $LinkHome,

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "FontMaterial")][string] $IconColor,

        # ICON BRANDS
        [ArgumentCompleter(
            {
                param($CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters)
                ($Global:HTMLIcons.FontAwesomeBrands.Keys)
            }
        )]
        [ValidateScript(
            {
                $_ -in (($Global:HTMLIcons.FontAwesomeBrands.Keys))
            }
        )]
        [parameter(ParameterSetName = "FontAwesomeBrands")][string] $IconBrands,

        # ICON REGULAR
        [ArgumentCompleter(
            {
                param($CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters)
                ($Global:HTMLIcons.FontAwesomeRegular.Keys)
            }
        )]
        [ValidateScript(
            {
                $_ -in (($Global:HTMLIcons.FontAwesomeRegular.Keys))
            }
        )]
        [parameter(ParameterSetName = "FontAwesomeRegular")][string] $IconRegular,

        # ICON SOLID
        [ArgumentCompleter(
            {
                param($CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters)
                ($Global:HTMLIcons.FontAwesomeSolid.Keys)
            }
        )]
        [ValidateScript(
            {
                $_ -in (($Global:HTMLIcons.FontAwesomeSolid.Keys))
            }
        )]
        [parameter(ParameterSetName = "FontAwesomeSolid")][string] $IconSolid,

        # FontsMaterialIcon
        [ArgumentCompleter(
            {
                param($CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters)
                ($Global:HTMLIcons.FontsMaterialIcon)
            }
        )]
        [ValidateScript(
            {
                $_ -in (($Global:HTMLIcons.FontsMaterialIcon))
            }
        )]
        [parameter(ParameterSetName = "FontMaterial")][string] $IconMaterial,
        [parameter(ParameterSetName = "FontMaterial")][switch] $Spinning,
        [parameter(ParameterSetName = "FontMaterial")][switch] $SpinningReverse,
        [parameter(ParameterSetName = "FontMaterial")][switch] $Bordered,
        [parameter(ParameterSetName = "FontMaterial")][switch] $BorderedCircle,
        [parameter(ParameterSetName = "FontMaterial")][switch] $PullLeft,
        [parameter(ParameterSetName = "FontMaterial")][switch] $PullRight,
        [parameter(ParameterSetName = "FontMaterial")][validateSet('90', '180', '270')][string] $Rotate,
        [parameter(ParameterSetName = "FontMaterial")][switch] $FlipVertical,
        [parameter(ParameterSetName = "FontMaterial")][switch] $FlipHorizontal
    )
    if ($InternalPageID) {
        $Href = "$($Script:GlobalSchema.StorageInformation.FileName)_$InternalPageID.html"
    }
    if ($LinkHome) {
        $Href = "$($Script:GlobalSchema.StorageInformation.FileName).html"
    }
    if ($Script:GlobalSchema['NavFloatWidget'] -eq 'dots') {
        New-HTMLTag -Tag 'menuitem' {
            New-InternalNavLink -FloatItem -Name $Name -Href $Href -IconBrands $IconBrands -IconRegular $IconRegular -IconSolid $IconSolid -IconMaterial $IconMaterial -Spinning:$Spinning.IsPresent -SpinningReverse:$SpinningReverse.IsPresent -IconColor $IconColor -Bordered:$Bordered.IsPresent -BorderedCircle:$BorderedCircle.IsPresent -PullLeft:$PullLeft.IsPresent -PullRight:$PullRight.IsPresent -Rotate $Rotate -FlipVertical:$FlipVertical.IsPresent -FlipHorizontal:$FlipHorizontal.IsPresent
        }
    } elseif ($Script:GlobalSchema['NavFloatWidget'] -eq 'selectBox') {
        New-HTMLTag -Tag 'option' { $Name }
    } elseif ($Script:GlobalSchema['NavFloatWidget'] -eq 'list') {
        New-InternalNavLink -ListItem -Name $Name -Href $Href -IconBrands $IconBrands -IconRegular $IconRegular -IconSolid $IconSolid -IconMaterial $IconMaterial -Spinning:$Spinning.IsPresent -SpinningReverse:$SpinningReverse.IsPresent -IconColor $IconColor -Bordered:$Bordered.IsPresent -BorderedCircle:$BorderedCircle.IsPresent -PullLeft:$PullLeft.IsPresent -PullRight:$PullRight.IsPresent -Rotate $Rotate -FlipVertical:$FlipVertical.IsPresent -FlipHorizontal:$FlipHorizontal.IsPresent
    } elseif ($Script:GlobalSchema['NavFloatWidget'] -eq 'toggle') {
        New-HTMLTag -Tag 'li' { $Name }
    } elseif ($Script:GlobalSchema['NavFloatWidget'] -eq 'about') {
        New-HTMLText -Text $Name
    }
}