function ConvertTo-ChartSeriesData {
    <#
    .SYNOPSIS
    Converts friendly PowerShell chart data into ApexCharts series points.

    .DESCRIPTION
    Converts X/Y or X/Y/Z arrays, dictionaries, or prebuilt data into the point shapes
    expected by ApexCharts scatter, bubble, and heatmap series.
    #>
    [CmdletBinding()]
    param(
        [object] $Data,
        [object[]] $X,
        [object[]] $Y,
        [object[]] $Z,
        [switch] $Bubble,
        [switch] $Heatmap
    )

    if ($null -ne $Data) {
        if ($Data -is [System.Collections.IDictionary]) {
            $DataKeys = @($Data.Keys)
            if ($DataKeys -contains 'x' -and $DataKeys -contains 'y') {
                , $Data
                return
            }

            foreach ($Key in $Data.Keys) {
                [ordered] @{
                    x = $Key
                    y = $Data[$Key]
                }
            }
            return
        }

        foreach ($Point in @($Data)) {
            $SeriesPoint = $Point
            if ($Point -is [System.Array] -and $Point.Count -eq 1 -and $Point[0] -is [System.Array]) {
                $SeriesPoint = $Point[0]
            }
            , $SeriesPoint
        }
        return
    }

    if ($null -eq $X -or $null -eq $Y) {
        throw 'ConvertTo-ChartSeriesData - Provide either Data or both X and Y values.'
    }
    if ($X.Count -ne $Y.Count) {
        throw "ConvertTo-ChartSeriesData - X and Y counts must match. X has $($X.Count), Y has $($Y.Count)."
    }
    if ($Bubble -and ($null -eq $Z -or $Z.Count -ne $X.Count)) {
        $zCount = if ($null -eq $Z) { 0 } else { $Z.Count }
        throw "ConvertTo-ChartSeriesData - Bubble charts require Z values matching X/Y count. X has $($X.Count), Z has $zCount."
    }

    for ($i = 0; $i -lt $X.Count; $i++) {
        if ($Bubble) {
            [ordered] @{
                x = $X[$i]
                y = $Y[$i]
                z = $Z[$i]
            }
        } elseif ($Heatmap) {
            [ordered] @{
                x = $X[$i]
                y = $Y[$i]
            }
        } else {
            , @($X[$i], $Y[$i])
        }
    }
}
