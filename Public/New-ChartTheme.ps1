function New-ChartTheme {
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