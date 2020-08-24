function New-ChartTimeLine {
    [alias('ChartTimeLine')]
    [CmdletBinding()]
    param(
        [parameter(Mandatory)][string] $Name,
        [DateTime] $DateFrom,
        [DateTime] $DateTo,
        [string] $Color
        #[ValidateSet('straight', 'smooth', 'stepline')] $Curve = 'straight',
        #[int] $Width = 6,
        #[ValidateSet('butt', 'square', 'round')][string] $Cap = 'butt',
        #[int] $Dash = 0
    )

    $FormattedDateFrom = Get-Date -Date $DateFrom -Format "yyyy-MM-dd"
    $FormattedDateTo = Get-Date -Date $DateTo -Format "yyyy-MM-dd"

    $TimeLine = [ordered] @{
        x         = $Name
        y         = @(
            "new Date('$FormattedDateFrom').getTime()"
            "new Date('$FormattedDateTo').getTime()"
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