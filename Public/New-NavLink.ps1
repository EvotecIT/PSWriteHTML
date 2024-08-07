﻿function New-NavLink {
    <#
    .SYNOPSIS
    Creates a new navigation link with customizable options for nested links.

    .DESCRIPTION
    The New-NavLink function creates a new navigation link with various customizable options such as nested links, name, name color, href, internal page ID, and icon color.

    .PARAMETER NestedLinks
    Specifies the script block defining the nested link properties.

    .PARAMETER Name
    Specifies the name of the navigation link. This parameter is mandatory.

    .PARAMETER NameColor
    Specifies the color of the navigation link name.

    .PARAMETER Href
    Specifies the URL to navigate to when the navigation link is clicked.

    .PARAMETER InternalPageID
    Specifies the internal page ID associated with the navigation link.

    .PARAMETER IconColor
    Specifies the color of the icon for the navigation link.

    .EXAMPLE
    New-NavLink -NestedLinks { New-NavLink -Name "Sublink 1" -Href "/sublink1" } -Name "Main Link" -NameColor "blue" -Href "/mainlink" -InternalPageID "main" -IconColor "green"
    Creates a new navigation link named "Main Link" with a nested link named "Sublink 1" in blue name color, green icon color, navigating to "/mainlink" with internal page ID "main".

    .EXAMPLE
    New-NavLink -NestedLinks { New-NavLink -Name "Sublink 2" -Href "/sublink2" } -Name "Another Link" -NameColor "red" -Href "/anotherlink" -InternalPageID "another" -IconColor "yellow"
    Creates a new navigation link named "Another Link" with a nested link named "Sublink 2" in red name color, yellow icon color, navigating to "/anotherlink" with internal page ID "another".
    #>
    [alias('New-HTMLNavLink')]
    [cmdletBinding(DefaultParameterSetName = 'FontAwesomeSolid')]
    param(
        [parameter(Position = 0, ParameterSetName = "FontAwesomeBrands")]
        [parameter(Position = 0, ParameterSetName = "FontAwesomeRegular")]
        [parameter(Position = 0, ParameterSetName = "FontAwesomeSolid")]
        [parameter(Position = 0, ParameterSetName = "FontMaterial")]
        [ScriptBlock] $NestedLinks,

        [parameter(Mandatory, ParameterSetName = "FontAwesomeBrands")]
        [parameter(Mandatory, ParameterSetName = "FontAwesomeRegular")]
        [parameter(Mandatory, ParameterSetName = "FontAwesomeSolid")]
        [parameter(Mandatory, ParameterSetName = "FontMaterial")][string] $Name,

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "FontMaterial")]
        [string] $NameColor,

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
    if ($NestedLinks) {
        [Array] $OutputLinks = & $NestedLinks
    }

    if (-not $Script:GlobalSchema['TopMenu']) {
        # Links for Left Side Menu
        $NavLink = @(
            if ($OutputLinks) {
                New-HTMLTag -Tag 'li' -Attributes @{ class = 'has-child' } {
                    New-InternalNavLink -Nested -Name $Name -NameColor $NameColor -Href $Href -IconBrands $IconBrands -IconRegular $IconRegular -IconSolid $IconSolid -IconMaterial $IconMaterial -Spinning:$Spinning.IsPresent -SpinningReverse:$SpinningReverse.IsPresent -IconColor $IconColor -Bordered:$Bordered.IsPresent -BorderedCircle:$BorderedCircle.IsPresent -PullLeft:$PullLeft.IsPresent -PullRight:$PullRight.IsPresent -Rotate $Rotate -FlipVertical:$FlipVertical.IsPresent -FlipHorizontal:$FlipHorizontal.IsPresent
                    New-HTMLTag -Tag 'ul' -Attributes @{ class = 'its-children' } {
                        $OutputLinks.Value
                    }
                }
            } else {
                New-InternalNavLink -Name $Name -NameColor $NameColor -Href $Href -IconBrands $IconBrands -IconRegular $IconRegular -IconSolid $IconSolid -IconMaterial $IconMaterial -Spinning:$Spinning.IsPresent -SpinningReverse:$SpinningReverse.IsPresent -IconColor $IconColor -Bordered:$Bordered.IsPresent -BorderedCircle:$BorderedCircle.IsPresent -PullLeft:$PullLeft.IsPresent -PullRight:$PullRight.IsPresent -Rotate $Rotate -FlipVertical:$FlipVertical.IsPresent -FlipHorizontal:$FlipHorizontal.IsPresent
            }
        )
        [PSCustomObject] @{
            Type  = 'NavLinkItem'
            Value = $NavLink
        }
    } else {
        # Links for Top Menu Only
        $NavLink = @(
            if ($OutputLinks) {
                New-HTMLTag -Tag 'li' -Attributes @{ class = 'has-child' } {
                    New-InternalNavLink -MenuItems -Nested -Name $Name -NameColor $NameColor -Href $Href -IconBrands $IconBrands -IconRegular $IconRegular -IconSolid $IconSolid -IconMaterial $IconMaterial -Spinning:$Spinning.IsPresent -SpinningReverse:$SpinningReverse.IsPresent -IconColor $IconColor -Bordered:$Bordered.IsPresent -BorderedCircle:$BorderedCircle.IsPresent -PullLeft:$PullLeft.IsPresent -PullRight:$PullRight.IsPresent -Rotate $Rotate -FlipVertical:$FlipVertical.IsPresent -FlipHorizontal:$FlipHorizontal.IsPresent
                    New-HTMLTag -Tag 'ul' -Attributes @{ class = 'menu-subitems' } {
                        $OutputLinks.Value
                    }
                }
            } else {
                New-InternalNavLink -MenuItems -Name $Name -NameColor $NameColor -Href $Href -IconBrands $IconBrands -IconRegular $IconRegular -IconSolid $IconSolid -IconMaterial $IconMaterial -Spinning:$Spinning.IsPresent -SpinningReverse:$SpinningReverse.IsPresent -IconColor $IconColor -Bordered:$Bordered.IsPresent -BorderedCircle:$BorderedCircle.IsPresent -PullLeft:$PullLeft.IsPresent -PullRight:$PullRight.IsPresent -Rotate $Rotate -FlipVertical:$FlipVertical.IsPresent -FlipHorizontal:$FlipHorizontal.IsPresent
            }
        )
        [PSCustomObject] @{
            Type  = 'NavLinkItem'
            Value = $NavLink
        }
    }
}
Register-ArgumentCompleter -CommandName New-HTMLNavLink -ParameterName IconColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLNavLink -ParameterName NameColor -ScriptBlock $Script:ScriptBlockColors