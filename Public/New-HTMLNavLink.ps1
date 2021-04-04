function New-HTMLNavLink {
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
        [parameter(ParameterSetName = "FontMaterial")][string] $Href,

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

    if ($NestedLinks) {
        $Attributes = @{ class = 'its-parent' }

        $OutputLinks = & $NestedLinks

    } else {
        $Attributes = @{ }
    }

    $NavLink = New-HTMLTag -Tag 'li' -Attributes $Attributes {
        New-HTMLTag -Tag 'a' -Attributes @{ href = $Href } {
            New-HTMLTag -Tag 'span' -Attributes @{ class = 'icon' } {
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
            }
            $Name
        }
    }
    [PSCustomObject] @{
        Type  = 'NavLinkItem'
        Value = $NavLink
    }

}