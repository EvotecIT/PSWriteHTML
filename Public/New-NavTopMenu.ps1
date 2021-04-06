function New-NavTopMenu {
    [alias('New-HTMLNavTopMenu')]
    [cmdletBinding(DefaultParameterSetName = 'FontAwesomeSolid')]
    param(
        [parameter(Position = 0, ParameterSetName = "FontAwesomeBrands")]
        [parameter(Position = 0, ParameterSetName = "FontAwesomeRegular")]
        [parameter(Position = 0, ParameterSetName = "FontAwesomeSolid")]
        [parameter(Position = 0, ParameterSetName = "FontMaterial")]
        [ScriptBlock] $MenuItem,

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
        [ArgumentCompleter( {
                param($CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters)
                ($Global:HTMLIcons.FontAwesomeRegular.Keys) }
        )]
        [ValidateScript( { $_ -in (($Global:HTMLIcons.FontAwesomeRegular.Keys)) }        )]
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

    if ($MenuItem) {
        # tracking for New-HTMLNavLink to know when it's being executed as part of TopMenu
        $Script:GlobalSchema['TopMenu'] = $true
        $MenuExecuted = & $MenuItem
        $Menu = New-HTMLTag -Tag 'li' {
            New-HTMLTag -Tag 'span' -Attributes @{class = 'dropdown-heading' } {
                New-HTMLTag -Tag 'span' -Attributes @{ style = @{ "padding-right" = "5px" } } {
                    #New-HTMLFontIcon -IconSolid address-book
                    New-InternalNavIcon -IconBrands $IconBrands -IconRegular $IconRegular -IconSolid $IconSolid -IconMaterial $IconMaterial -Spinning:$Spinning.IsPresent -SpinningReverse:$SpinningReverse.IsPresent -IconColor $IconColor -Bordered:$Bordered.IsPresent -BorderedCircle:$BorderedCircle.IsPresent -PullLeft:$PullLeft.IsPresent -PullRight:$PullRight.IsPresent -Rotate $Rotate -FlipVertical:$FlipVertical.IsPresent -FlipHorizontal:$FlipHorizontal.IsPresent
                }
                $Name
            }
            New-HTMLTag -Tag 'ul' -Attributes @{ class = 'menu-items' } {
                $MenuExecuted.Value
            }
        }
        [PSCustomObject] @{
            Type  = 'TopMenu'
            Value = $Menu
        }
        $Script:GlobalSchema['TopMenu'] = $false
    }
}

Register-ArgumentCompleter -CommandName New-HTMLNavTopMenu -ParameterName IconColor -ScriptBlock $Script:ScriptBlockColors