function New-HTMLToast {
    [CmdletBinding()]
    param(
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][string] $TextHeader,

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][RGBColors] $TextHeaderColor = [RGBColors]::None,

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][string] $Text,

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][RGBColors] $TextColor = [RGBColors]::None,

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][int] $IconSize = 30,

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][RGBColors] $IconColor = [RGBColors]::Blue,

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][RGBColors] $BarColorLeft = [RGBColors]::Blue,

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][RGBColors] $BarColorRight = [RGBColors]::None,

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
        [parameter(ParameterSetName = "FontAwesomeSolid")][string] $IconSolid
    )

    [string] $Icon = ''
    if ($IconBrands) {
        $Icon = "fab fa-$IconBrands" # fa-$($FontSize)x"
    } elseif ($IconRegular) {
        $Icon = "far fa-$IconRegular" # fa-$($FontSize)x"
    } elseif ($IconSolid) {
        $Icon = "fas fa-$IconSolid" # fa-$($FontSize)x"
    }

    $Script:HTMLSchema.Features.Toasts = $true

    [string] $DivClass = "toast"

    $StyleText = @{ }
    if ($TextColor -ne [RGBColors]::None) {
        $StyleText.'color' = ConvertFrom-Color -Color $TextColor
    }

    $StyleTextHeader = @{ }
    if ($TextHeaderColor -ne [RGBColors]::None) {
        $StyleTextHeader.'color' = ConvertFrom-Color -Color $TextHeaderColor
    }

    $StyleIcon = @{ }
    if ($IconSize -ne 0) {
        $StyleIcon.'font-size' = "$($IconSize)px"
    }

    if ($IconColor -ne [RGBColors]::None) {
        $StyleIcon.'color' = ConvertFrom-Color -Color $IconColor
    }

    $StyleBarLeft = @{ }
    if ($BarColorLeft -ne [RGBColors]::None) {
        $StyleBarLeft.'background-color' = ConvertFrom-Color -Color $BarColorLeft
    }

    $StyleBarRight = @{ }
    if ($BarColorRight -ne [RGBColors]::None) {
        $StyleBarRight.'background-color' = ConvertFrom-Color -Color $BarColorRight
    }

    New-HTMLTag -Tag 'div' -Attributes @{ class = $DivClass } {
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'toastBorderLeft'; style = $StyleBarLeft }
        New-HTMLTag -Tag 'div' -Attributes @{ class = "toastIcon $Icon"; style = $StyleIcon }
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'toastContent' } {
            New-HTMLTag -Tag 'p' -Attributes @{ class = 'toastTextHeader'; style = $StyleTextHeader } {
                $TextHeader
            }
            New-HTMLTag -Tag 'p' -Attributes @{ class = 'toastText'; style = $StyleText } {
                $Text
            }
        }
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'toastBorderRight'; style = $StyleBarRight }
    }
}