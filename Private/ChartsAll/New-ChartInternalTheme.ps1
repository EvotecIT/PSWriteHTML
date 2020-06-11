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