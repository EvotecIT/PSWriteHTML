function New-TablePercentageBarCondition {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][int] $Minimum,
        [Parameter(Mandatory)][int] $Maximum,
        [string] $BackgroundColor,
        [string] $TextColor,
        [string] $BarColor
    )

    $Output = [PSCustomObject]@{
        Type   = 'TablePercentageBarCondition'
        Output = [ordered] @{
            min             = $Minimum
            max             = $Maximum
            backgroundColor = ConvertFrom-Color -Color $BackgroundColor
            textColor       = ConvertFrom-Color -Color $TextColor
            barColor        = ConvertFrom-Color -Color $BarColor
        }
    }
    $Output
}

Register-ArgumentCompleter -CommandName New-TablePercentageBarCondition -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-TablePercentageBarCondition -ParameterName TextColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-TablePercentageBarCondition -ParameterName BarColor -ScriptBlock $Script:ScriptBlockColors
<#
[
                                    {
                                        "barColor": "#ff0000",
                                        "backgroundColor": "#ff0000",
                                        "textColor": "#ffffff",
                                        "min": 0,
                                        "max": 10
                                    },
                                    {
                                        "barColor": "#00ff00",
                                        "backgroundColor": "#00ff00",
                                        "min": 11,
                                        "max": 20
                                    },
                                    {
                                        "barColor": "#0000ff",
                                        "backgroundColor": "#0000ff",
                                        "min": 21,
                                        "max": 23
                                    },
                                    {
                                        "barColor": "#00FFFF",
                                        "backgroundColor": "#00FFFF",
                                        "min": 24,
                                        "max": 100
                                    }
                                ]
#>