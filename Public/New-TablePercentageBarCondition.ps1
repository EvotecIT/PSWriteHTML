function New-TablePercentageBarCondition {
    <#
    .SYNOPSIS
    Creates a new table percentage bar condition object with specified attributes.

    .DESCRIPTION
    This function creates a new table percentage bar condition object with the provided attributes. It defines the minimum and maximum values for the percentage range, along with the colors for the background, text, and bar.

    .PARAMETER Minimum
    Specifies the minimum value for the percentage range.

    .PARAMETER Maximum
    Specifies the maximum value for the percentage range.

    .PARAMETER BackgroundColor
    Specifies the background color for the percentage bar.

    .PARAMETER TextColor
    Specifies the text color for the percentage bar.

    .PARAMETER BarColor
    Specifies the color of the percentage bar.

    .EXAMPLE
    New-TablePercentageBarCondition -Minimum 0 -Maximum 10 -BackgroundColor "#ff0000" -TextColor "#ffffff" -BarColor "#ff0000"
    Creates a new table percentage bar condition object for the range 0-10 with specified colors.

    .EXAMPLE
    New-TablePercentageBarCondition -Minimum 11 -Maximum 20 -BackgroundColor "#00ff00" -BarColor "#00ff00"
    Creates a new table percentage bar condition object for the range 11-20 with specified colors.

    .EXAMPLE
    New-TablePercentageBarCondition -Minimum 21 -Maximum 23 -BackgroundColor "#0000ff" -BarColor "#0000ff"
    Creates a new table percentage bar condition object for the range 21-23 with specified colors.

    .EXAMPLE
    New-TablePercentageBarCondition -Minimum 24 -Maximum 100 -BackgroundColor "#00FFFF" -BarColor "#00FFFF"
    Creates a new table percentage bar condition object for the range 24-100 with specified colors.
    #>
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