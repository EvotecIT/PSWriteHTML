function New-ChartInternalTimeLine {
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [string] $Color,
        [Array] $Data,
        [Int64] $Min,
        [Int64] $Max
    )

    if ($Data.Count -eq 0) {
        Write-Warning 'New-ChartInternalTimeLine - Data Empty'
    }

    if ($null -ne $Color) {
        $ColorRGB = ConvertFrom-Color -Color $Color
        $Options.colors = @($ColorRGB)
    }
    $Options.plotOptions = @{
        bar = @{
            horizontal  = $true
            distributed = $true
            dataLabels  = @{
                hideOverflowingLabels = $false
            }
        }
    }
    $Options.series = @(
        @{
            data = @(
                foreach ($Value in $Data) {
                    $Value
                }
            )

        }
    )
}

Register-ArgumentCompleter -CommandName New-ChartInternalSpark -ParameterName Color -ScriptBlock $Script:ScriptBlockColors