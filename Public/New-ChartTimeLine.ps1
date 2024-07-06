function New-ChartTimeLine {
    <#
    .SYNOPSIS
    Creates a new time series chart object.

    .DESCRIPTION
    This function creates a new time series chart object with the specified Name, DateFrom, DateTo, Color, TimeZoneOffset, and DateFormatPattern. It allows customization of the time series chart appearance.

    .PARAMETER Name
    Specifies the name of the time series chart.

    .PARAMETER DateFrom
    Specifies the starting date for the time series chart.

    .PARAMETER DateTo
    Specifies the ending date for the time series chart.

    .PARAMETER Color
    Specifies the color of the time series chart.

    .PARAMETER TimeZoneOffset
    Specifies the time zone offset for the time series chart.

    .PARAMETER DateFormatPattern
    Specifies the date format pattern for the time series chart. Default is "yyyy-MM-dd HH:mm:ss".

    .EXAMPLE
    New-ChartTimeLine -Name "TimeSeries1" -DateFrom (Get-Date) -DateTo (Get-Date).AddDays(7) -Color "Blue" -TimeZoneOffset "+3" -DateFormatPattern "MM/dd/yyyy HH:mm:ss"
    Creates a new time series chart object named "TimeSeries1" with a date range from the current date to 7 days ahead, colored in blue, with a time zone offset of +3, and using the date format pattern "MM/dd/yyyy HH:mm:ss".

    .EXAMPLE
    New-ChartTimeLine -Name "TimeSeries2" -DateFrom (Get-Date) -DateTo (Get-Date).AddDays(14) -Color "Green" -TimeZoneOffset "-5"
    Creates a new time series chart object named "TimeSeries2" with a date range from the current date to 14 days ahead, colored in green, with a time zone offset of -5, using the default date format pattern.

    #>
    [alias('ChartTimeLine')]
    [CmdletBinding()]
    param(
        [parameter(Mandatory)][string] $Name,
        [DateTime] $DateFrom,
        [DateTime] $DateTo,
        [string] $Color,
        [string] $TimeZoneOffset,
        [string] $DateFormatPattern = "yyyy-MM-dd HH:mm:ss"
        #[ValidateSet('straight', 'smooth', 'stepline')] $Curve = 'straight',
        #[int] $Width = 6,
        #[ValidateSet('butt', 'square', 'round')][string] $Cap = 'butt',
        #[int] $Dash = 0
    )

    $timezoneString = ""
    if ($TimeZoneOffset) {
        if ($TimeZoneOffset -Notlike "-*" -and $TimeZoneOffset -Notlike "+*") {
            $TimeZoneOffset = "+$TimeZoneOffset"
        }
        $timezoneString = " GMT$TimeZoneOffset"
    }

    $FormattedDateFrom = Get-Date -Date $DateFrom -Format $DateFormatPattern
    $FormattedDateTo = Get-Date -Date $DateTo -Format $DateFormatPattern

    $TimeLine = [ordered] @{
        x         = $Name
        y         = @(
            "new Date('$FormattedDateFrom$timezoneString').getTime()"
            "new Date('$FormattedDateTo$timezoneString').getTime()"
        )
        fillColor = ConvertFrom-Color -Color $Color
    }
    Remove-EmptyValue -Hashtable $TimeLine

    [PSCustomObject] @{
        ObjectType = 'TimeLine'
        TimeLine   = $TimeLine

        #LineCurve  = $Curve
        #LineWidth  = $Width
        #LineCap    = $Cap
        #LineDash   = $Dash
    }
}

Register-ArgumentCompleter -CommandName New-ChartTimeLine -ParameterName Color -ScriptBlock $Script:ScriptBlockColors