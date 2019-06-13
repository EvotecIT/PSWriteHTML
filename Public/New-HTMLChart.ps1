function New-HTMLChart {
    [CmdletBinding()]
    param(
        [ScriptBlock] $ChartSettings,
        [string] $Title,
        [ValidateSet('center', 'left', 'right', '')][string] $TitleAlignment = '',
        [nullable[int]] $Height = 350,
        [nullable[int]] $Width
    )

    $DataSet = [System.Collections.Generic.List[object]]::new()
    $DataName = [System.Collections.Generic.List[object]]::new()

    [string] $BarType = 'bar' # Default

    [Array] $Settings = & $ChartSettings
    foreach ($Setting in $Settings) {
        if ($Setting.ObjectType -eq 'Bar') {
            $Type = 'Bar'
            $DataSet.Add($Setting.Value)
            $DataName.Add($Setting.Name)
        } elseif ($Setting.ObjectType -eq 'Legend') {
            $DataLegend = $Setting.Names
            $LegendPosition = $Setting.LegendPosition
        } elseif ($Setting.ObjectType -eq 'BarOptions') {
            $BarType = $Setting.Type
            $BarHorizontal = $Setting.Horizontal
            $BarDataLabelsEnabled = $Setting.DataLabelsEnabled
            $BarDataLabelsOffsetX = $Setting.DataLabelsOffsetX
            $BarDataLabelsFontSize = $Setting.DataLabelsFontSize
            $BarDataLabelsColor = $Setting.DataLabelsColor
            $BarPatternedColors = $Setting.PatternedColors
            $BarDistributed = $Setting.Distributed
        }
    }
    if (-not $DataLegend) {
        Write-Warning -Message 'Legend is missing.'
        Exit
    }

    $HashTable = [ordered] @{ }
    $ArrayCount = $DataSet[0].Count
    if ($ArrayCount -eq 1) {
        $HashTable.1 = $DataSet
    } else {
        for ($i = 0; $i -lt $ArrayCount; $i++) {
            $HashTable.$i = [System.Collections.Generic.List[object]]::new()
        }
        foreach ($Value in $DataSet) {
            for ($h = 0; $h -lt $Value.Count; $h++) {
                $HashTable[$h].Add($Value[$h])
            }
        }
    }

    if ($Type -eq 'Bar') {
        New-HTMLChartBar -Data $($HashTable.Values) -DataNames $DataName -DataLegend $DataLegend -LegendPosition $LegendPosition `
            -Type $BarType -Title $Title -TitleAlignment $TitleAlignment #-Height $Height -Width $Width

    }
}