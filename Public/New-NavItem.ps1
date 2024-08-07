function New-NavItem {
    <#
    .SYNOPSIS
    Creates a new navigation item with specified parameters.

    .DESCRIPTION
    The New-NavItem function creates a new navigation item with the specified parameters, such as name, href, type, icon, and color.

    .EXAMPLE
    New-NavItem -Name "Home" -Href "/" -Type "Menu" -IconBrands "fa fa-home" -IconColor "blue"
    Creates a new navigation item named "Home" with a link to the root ("/"), type "Menu", using a home icon from FontAwesome Brands with blue color.

    .EXAMPLE
    New-NavItem -Name "About" -Href "/about" -Type "Grid" -IconRegular "far fa-address-card" -IconColor "green"
    Creates a new navigation item named "About" with a link to "/about", type "Grid", using an address card icon from FontAwesome Regular with green color.

    .EXAMPLE
    New-NavItem -Name "Contact" -Href "/contact" -Type "Menu" -FontMaterial "person" -IconColor "red"
    Creates a new navigation item named "Contact" with a link to "/contact", type "Menu", using a person icon from Material Design Icons with red color.
    #>
    [alias('New-HTMLNavItem')]
    [cmdletBinding(DefaultParameterSetName = 'FontAwesomeSolid')]
    param(
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "FontMaterial")]
        [alias('Text')][string] $Name,

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "FontMaterial")][string] $Href,

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "FontMaterial")][string] $InternalPageID,

        [parameter(ParameterSetName = "FontAwesomeBrands", Mandatory)]
        [parameter(ParameterSetName = "FontAwesomeRegular", Mandatory)]
        [parameter(ParameterSetName = "FontAwesomeSolid", Mandatory)]
        [parameter(ParameterSetName = "FontMaterial", Mandatory)][ValidateSet('Grid', 'Menu')][string] $Type,

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
        $Href = "$($Script:GlobalSchema.StorageInformation.FileName)_$($InternalPageID)$($Script:GlobalSchema.StorageInformation.Extension)"
    }


    if ($Type -eq 'Grid') {
        $GridItem = New-HTMLTag -Tag 'li' -Attributes @{ class = 'grid' } {
            <#
            if ($IconRegular -or $IconBrands -or $IconSolid -or $IconMaterial) {
                $newHTMLFontIconSplat = @{
                    IconColor    = $IconColor
                    IconBrands   = $IconBrands
                    IconRegular  = $IconRegular
                    IconSolid    = $IconSolid
                    IconMaterial = $IconMaterial
                    FixedWidth   = $true
                }
                if ($Spinning) {
                    $newHTMLFontIconSplat['Spinning'] = $Spinning
                }
                if ($SpinningReverse) {
                    $newHTMLFontIconSplat['SpinningReverse'] = $SpinningReverse
                }
                if ($Bordered) {
                    $newHTMLFontIconSplat['Bordered'] = $Bordered
                }
                if ($BorderedCircle) {
                    $newHTMLFontIconSplat['BorderedCircle'] = $BorderedCircle
                }
                if ($PullLeft) {
                    $newHTMLFontIconSplat['PullLeft'] = $PullLeft
                }
                if ($PullRight) {
                    $newHTMLFontIconSplat['PullRight'] = $PullRight
                }
                if ($Rotate) {
                    $newHTMLFontIconSplat['Rotate'] = $Rotate
                }
                if ($FlipVertical) {
                    $newHTMLFontIconSplat['FlipVertical'] = $FlipVertical
                }
                if ($FlipHorizontal) {
                    $newHTMLFontIconSplat['FlipHorizontal'] = $FlipHorizontal
                }
                Remove-EmptyValue -Hashtable $newHTMLFontIconSplat -Recursive
                New-HTMLFontIcon @newHTMLFontIconSplat
            }
            if ($Text) {
                $Text
            }
            #>
            New-HTMLTag -Tag 'a' -Attributes @{ href = $Href } {
                New-InternalNavIcon -IconBrands $IconBrands -IconRegular $IconRegular -IconSolid $IconSolid -IconMaterial $IconMaterial -Spinning:$Spinning.IsPresent -SpinningReverse:$SpinningReverse.IsPresent -IconColor $IconColor -Bordered:$Bordered.IsPresent -BorderedCircle:$BorderedCircle.IsPresent -PullLeft:$PullLeft.IsPresent -PullRight:$PullRight.IsPresent -Rotate $Rotate -FlipVertical:$FlipVertical.IsPresent -FlipHorizontal:$FlipHorizontal.IsPresent
                if ($Name) {
                    $Name
                }
            }
        }
        [PSCustomObject] @{
            Type  = 'NavGridItem'
            Value = $GridItem
        }
    } elseif ($Type -eq 'Menu') {
        $GridItem = New-HTMLTag -Tag 'li' {
            New-HTMLTag -Tag 'a' -Attributes @{ href = $Href } {
                New-InternalNavIcon -IconBrands $IconBrands -IconRegular $IconRegular -IconSolid $IconSolid -IconMaterial $IconMaterial -Spinning:$Spinning.IsPresent -SpinningReverse:$SpinningReverse.IsPresent -IconColor $IconColor -Bordered:$Bordered.IsPresent -BorderedCircle:$BorderedCircle.IsPresent -PullLeft:$PullLeft.IsPresent -PullRight:$PullRight.IsPresent -Rotate $Rotate -FlipVertical:$FlipVertical.IsPresent -FlipHorizontal:$FlipHorizontal.IsPresent
                if ($Name) {
                    $Name
                }
            }
        }
        [PSCustomObject] @{
            Type  = 'NavGridMenu'
            Value = $GridItem
        }
    }
}
Register-ArgumentCompleter -CommandName New-HTMLNavItem -ParameterName IconColor -ScriptBlock $Script:ScriptBlockColors