function New-HTMLMain {
    [alias('Main')]
    [CmdletBinding()]
    param(
        [scriptblock] $HTMLContent,
        [string] $BackgroundColor,
        [string] $Color,
        [string] $FontFamily,
        [object] $FontSize
    )
    # gets current configuration for Main.CSS
    $CssConfiguration = Get-ConfigurationCss -Feature 'Main' -Type 'HeaderAlways'

    # Sets body style to new values
    $BodyStyle = @{
        'background-color' = ConvertFrom-Color -Color $BackgroundColor
        'color'            = ConvertFrom-Color -Color $Color
        'font-family'      = $FontFamily
        'font-size'        = ConvertFrom-FontSize -TextSize $FontSize
    }
    Add-ConfigurationCSS -CSS $CssConfiguration -Name 'body' -Inject $BodyStyle
    # We set the same size for input as for body to keep them in sync.
    # You can still overwrite this values on tables or inputs if required
    $InputStyle = @{
        'font-size' = ConvertFrom-FontSize -TextSize $FontSize
    }
    Add-ConfigurationCSS -CSS $CssConfiguration -Name 'input' -Inject $InputStyle

    # if HTML Content is given send it further down
    if ($HTMLContent) {
        # push this to New-HTML
        [PSCustomObject] @{
            Type   = 'Main'
            Output = & $HTMLContent
        }
    }
}

Register-ArgumentCompleter -CommandName New-HTMLMain -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLMain -ParameterName Color -ScriptBlock $Script:ScriptBlockColors