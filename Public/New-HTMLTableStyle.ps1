function New-HTMLTableStyle {
    [alias('EmailTableStyle', 'TableStyle', 'New-TableStyle')]
    [cmdletBinding()]
    param(
        [ValidateSet('Table', 'Header', 'Content')][string] $Type = 'Table',
        [Parameter(ParameterSetName = 'Manual')][alias('TextSize')][string] $FontSize,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900')][string] $FontWeight,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('normal', 'italic', 'oblique')][string] $FontStyle,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('normal', 'small-caps')][string] $FontVariant,
        [Parameter(ParameterSetName = 'Manual')][string] $FontFamily,
        [Parameter(ParameterSetName = 'Manual')][string] $BackgroundColor,
        [Parameter(ParameterSetName = 'Manual')][string] $TextColor,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('none', 'line-through', 'overline', 'underline')][string] $TextDecoration,
        [Parameter(ParameterSetName = 'Manual')][ValidateSet('uppercase', 'lowercase', 'capitalize')][string] $TextTransform,
        [alias('FontAlign', 'Align')][Parameter(ParameterSetName = 'Manual')][ValidateSet('left', 'right', 'center', 'justify')][string] $TextAlign
    )
    $CssConfiguration = Get-ConfigurationCss -Feature 'Main' -Type 'HeaderAlways'
    $StyleSheetsConfiguration = [ordered] @{
        Table   = "table"
        Header  = "th"
        Content = "tr"
    }

    $TableStyle = [ordered] @{
        'text-align'       = $TextAlign
        'text-transform'   = $TextTransform
        'color'            = ConvertFrom-Color -Color $TextColor
        'background-color' = ConvertFrom-Color -Color $BackgroundColor
        'font-size'        = ConvertFrom-FontSize -TextSize $FontSize
        'font-weight'      = $FontWeight
        'font-style'       = $FontStyle
        'font-variant'     = $FontVariant
        'font-family'      = $FontFamily
        'text-decoration'  = $TextDecoration
    }

    # this will add configuration for all Tables as it already exists
    # any new elements will be added, any existing elements will be overwritten
    # any existing elements that are not defined will not be touched
    Add-ConfigurationCSS -CSS $CssConfiguration -Name $StyleSheetsConfiguration.$Type -Inject $TableStyle
}