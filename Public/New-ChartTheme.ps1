function New-ChartTheme {
    <#
    .SYNOPSIS
    Creates a new chart theme with customizable options.

    .DESCRIPTION
    This function defines the properties of a chart theme, such as mode, palette, color, shade, and intensity. It allows customization of the theme appearance in the chart.

    .PARAMETER Mode
    Specifies the mode of the chart theme. Valid values are 'light' or 'dark'.

    .PARAMETER Palette
    Specifies the color palette for the chart theme. Valid values are 'palette1' through 'palette10'.

    .PARAMETER Monochrome
    Switch parameter to enable monochrome mode for the chart theme.

    .PARAMETER Color
    Sets the base color for the chart theme.

    .PARAMETER ShadeTo
    Specifies the shading direction for the chart theme. Valid values are 'light' or 'dark'.

    .PARAMETER ShadeIntensity
    Specifies the intensity of the shading effect for the chart theme.

    .EXAMPLE
    New-ChartTheme -Mode 'dark' -Palette 'palette3' -Monochrome -Color 'Red' -ShadeTo 'dark' -ShadeIntensity 0.8
    Creates a new chart theme with dark mode, palette 3, monochrome enabled, red base color, dark shading, and intensity of 0.8.

    .EXAMPLE
    New-ChartTheme -Mode 'light' -Palette 'palette7' -Color 'Blue' -ShadeTo 'light' -ShadeIntensity 0.6
    Creates a new chart theme with light mode, palette 7, blue base color, light shading, and intensity of 0.6.
    #>
    [alias('ChartTheme')]
    [CmdletBinding()]
    param(
        [ValidateSet('light', 'dark')][string] $Mode = 'light',
        [ValidateSet(
            'palette1',
            'palette2',
            'palette3',
            'palette4',
            'palette5',
            'palette6',
            'palette7',
            'palette8',
            'palette9',
            'palette10'
        )
        ][string] $Palette = 'palette1',
        [switch] $Monochrome,
        [string] $Color = "DodgerBlue",
        [ValidateSet('light', 'dark')][string] $ShadeTo = 'light',
        [double] $ShadeIntensity = 0.65
    )

    [PSCustomObject] @{
        ObjectType = 'Theme'
        Theme      = @{
            Mode           = $Mode
            Palette        = $Palette
            Monochrome     = $Monochrome.IsPresent
            Color          = $Color
            ShadeTo        = $ShadeTo
            ShadeIntensity = $ShadeIntensity
        }
    }
}

Register-ArgumentCompleter -CommandName New-ChartTheme -ParameterName Color -ScriptBlock $Script:ScriptBlockColors