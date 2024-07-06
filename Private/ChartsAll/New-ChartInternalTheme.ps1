<#
  theme: {
      mode: 'light',
      palette: 'palette1',
      monochrome: {
          enabled: false,
          color: '#255aee',
          shadeTo: 'light',
          shadeIntensity: 0.65
      },
  }
#>

function New-ChartInternalTheme {
    <#
    .SYNOPSIS
    Creates a new internal theme for the chart with specified options.

    .DESCRIPTION
    This function creates a new internal theme for the chart based on the provided options. It allows customization of the mode, palette, monochrome settings, color, shade intensity, and more.

    .PARAMETER Options
    Specifies the options for the new internal theme.

    .PARAMETER Mode
    Specifies the mode of the theme. Valid values are 'light' or 'dark'.

    .PARAMETER Palette
    Specifies the palette to be used. Valid values are 'palette1' through 'palette10'.

    .PARAMETER Monochrome
    Indicates whether monochrome mode is enabled.

    .PARAMETER Color
    Specifies the color to be used in the theme. Default is "DodgerBlue".

    .PARAMETER ShadeTo
    Specifies the shade to which the theme should transition. Valid values are 'light' or 'dark'.

    .PARAMETER ShadeIntensity
    Specifies the intensity of the shade. Default is 0.65.

    .EXAMPLE
    New-ChartInternalTheme -Options $Options -Mode 'light' -Palette 'palette1' -Monochrome -Color 'DodgerBlue' -ShadeTo 'light' -ShadeIntensity 0.65
    Creates a new internal theme with light mode, palette1, monochrome enabled, DodgerBlue color, light shade, and shade intensity of 0.65.

    .EXAMPLE
    New-ChartInternalTheme -Options $Options -Mode 'dark' -Palette 'palette5' -Color 'Crimson' -ShadeTo 'dark' -ShadeIntensity 0.8
    Creates a new internal theme with dark mode, palette5, monochrome disabled, Crimson color, dark shade, and shade intensity of 0.8.
    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [ValidateSet('light', 'dark')][string] $Mode,
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

    $RGBColor = ConvertFrom-Color -Color $Color

    $Options.theme = [ordered] @{
        mode       = $Mode
        palette    = $Palette
        monochrome = [ordered] @{
            enabled        = $Monochrome.IsPresent
            color          = $RGBColor
            shadeTo        = $ShadeTo
            shadeIntensity = $ShadeIntensity
        }
    }
}

Register-ArgumentCompleter -CommandName New-ChartInternalTheme -ParameterName Color -ScriptBlock $Script:ScriptBlockColors