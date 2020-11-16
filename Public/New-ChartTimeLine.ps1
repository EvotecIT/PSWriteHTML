function New-ChartTimeLine {
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