function New-HTMLFontIcon {
    [cmdletBinding(DefaultParameterSetName = 'FontAwesomeSolid')]
    param(
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "FontMaterial")][int] $IconSize,

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
        <#
        [parameter(ParameterSetName = "FontMaterial")][switch] $Wobble,
        [parameter(ParameterSetName = "FontMaterial")][switch] $FadeInLeft,
        [parameter(ParameterSetName = "FontMaterial")][switch] $Pulse,
        #>
        [parameter(ParameterSetName = "FontMaterial")][validateSet('90', '180', '270')][string] $Rotate,
        [parameter(ParameterSetName = "FontMaterial")][switch] $FlipVertical,
        [parameter(ParameterSetName = "FontMaterial")][switch] $FlipHorizontal,
        # for using within UL/LI http://zavoloklom.github.io/material-design-iconic-font/examples.html
        [parameter(ParameterSetName = "FontMaterial")][switch] $ListIcons,

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [parameter(ParameterSetName = "FontMaterial")][switch] $FixedWidth,


        [switch] $AsCSS,
        [switch] $AsHashTable,
        [string] $Name
    )

    $StyleIcon = @{ }
    if ($IconSize -ne 0) {
        $StyleIcon.'font-size' = "$($IconSize)px"
    }

    if ($IconColor) {
        $StyleIcon.'color' = ConvertFrom-Color -Color $IconColor
    }

    if ($IconBrands -or $IconSolid -or $IconRegular) {
        #$Script:HTMLSchema.Features.FontsAwesome = $true
        Enable-HTMLFeature -Feature FontsAwesome

        if ($AsCSS) {
            [string] $Content = @(
                if ($IconBrands) {
                    $Face = '"Font Awesome 5 Brands"'
                    $Global:HTMLIcons['FontAwesomeBrands'][$IconBrands]
                } elseif ($IconRegular) {
                    $Face = '"Font Awesome 5 Free"'
                    $Global:HTMLIcons['FontAwesomeRegular'][$IconRegular]
                } elseif ($IconSolid) {
                    $Face = '"Font Awesome 5 Free"'
                    $Global:HTMLIcons['FontAwesomeSolid'][$IconSolid]
                }
            )
            $Css = [ordered] @{
                'font-family' = $Face
                'font-weight' = 'bold'
                'content'     = "`"\$Content`""
                'color'       = $StyleIcon.'color'
                'font-size'   = $StyleIcon.'font-size'
            }
            Remove-EmptyValue -Hashtable $Css
            if ($AsHashTable) {
                $Css
            } else {
                ConvertTo-CascadingStyleSheets -Css $CSS -Name $Name
            }
        } else {
            $Class = @(
                if ($IconBrands) {
                    "fab fa-$IconBrands".ToLower() # fa-$($FontSize)x"
                } elseif ($IconRegular) {
                    "far fa-$IconRegular".ToLower() # fa-$($FontSize)x"
                } elseif ($IconSolid) {
                    "fas fa-$IconSolid".ToLower() # fa-$($FontSize)x"
                }
                if ($FixedWidth) {
                    'fa-fw'
                }
            ) | Where-Object { $_ }
            New-HTMLTag -Tag 'i' -Attributes @{ class = $Class; style = $StyleIcon }
        }
    } elseif ($IconMaterial) {
        Enable-HTMLFeature -Feature FontsMaterialIcon
        #$Script:HTMLSchema.Features.FontsMaterialIcon = $true
        $Class = @(
            'zmdi'
            "zmdi-$IconMaterial"
            if ($FixedWidth) {
                'zmdi-hc-fw'
            }
            if ($Spinning) {
                'zmdi-hc-spin'
            }
            if ($SpinningReverse) {
                'zmdi-hc-spin-reverse'
            }
            if ($PullLeft) {
                'pull-left'
            }
            if ($PullRight) {
                'pull-right'
            }
            if ($Bordered) {
                'zmdi-hc-border'
            }
            if ($BorderedCircle) {
                'zmdi-hc-border-circle'
            }
            <#
            if ($Wobble) {
                $Script:HTMLSchema.Features.FontsAnimate = $true
                'wobble'
            }
            if ($FadeInLeft) {
                $Script:HTMLSchema.Features.FontsAnimate = $true
                'fadeInLeft'
            }
            if ($Pulse) {
                $Script:HTMLSchema.Features.FontsAnimate = $true
                'pulse'
            }
            #>
            if ($Rotate) {
                "zmdi-hc-rotate-$Rotate"
            }
            if ($FlipVertical) {
                'zmdi-hc-flip-vertical'
            }
            if ($FlipHorizontal) {
                'zmdi-hc-flip-horizontal'
            }
            if ($ListIcons) {
                # for using within UL/LI http://zavoloklom.github.io/material-design-iconic-font/examples.html
                # Use zmdi-hc-ul and zmdi-hc-li to replace default bullets in unordered lists.
                <#
                <ul class="zmdi-hc-ul">
                    <li><i class="zmdi-hc-li zmdi zmdi-check-square"></i>List icons</li>
                    <li><i class="zmdi-hc-li zmdi zmdi-dot-circle-alt"></i>can be used</li>
                    <li><i class="zmdi-hc-li zmdi zmdi-refresh zmdi-hc-spin"></i>as bullets</li>
                    <li><i class="zmdi-hc-li zmdi zmdi-square-o"></i>in lists</li>
                </ul>
                #>
                'zmdi-hc-li'
            }
        ) | Where-Object { $_ }
        New-HTMLTag -Tag 'i' -Attributes @{ class = $Class; style = $StyleIcon }
    }
}

Register-ArgumentCompleter -CommandName New-HTMLFontIcon -ParameterName IconColor -ScriptBlock $Script:ScriptBlockColors