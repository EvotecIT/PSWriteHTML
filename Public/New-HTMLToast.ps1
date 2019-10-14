function New-HTMLToast {
    [CmdletBinding()]
    param(
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][string] $TextHeader,

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][string] $TextHeaderColor = "",

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][string] $Text,

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][string] $TextColor = "",

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][int] $IconSize = 30,

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][string] $IconColor = "Blue",

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][string] $BarColorLeft = "Blue",

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][string] $BarColorRight = "",

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
    if ($TextColor -ne "") {
        $StyleText.'color' = ConvertFrom-Color -Color $TextColor
    }

    $StyleTextHeader = @{ }
    if ($TextHeaderColor -ne "") {
        $StyleTextHeader.'color' = ConvertFrom-Color -Color $TextHeaderColor
    }

    $StyleIcon = @{ }
    if ($IconSize -ne 0) {
        $StyleIcon.'font-size' = "$($IconSize)px"
    }

    if ($IconColor -ne "") {
        $StyleIcon.'color' = ConvertFrom-Color -Color $IconColor
    }

    $StyleBarLeft = @{ }
    if ($BarColorLeft -ne "") {
        $StyleBarLeft.'background-color' = ConvertFrom-Color -Color $BarColorLeft
    }

    $StyleBarRight = @{ }
    if ($BarColorRight -ne "") {
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