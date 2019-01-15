Function Get-HTMLPieChartObject {
    <#
	.SYNOPSIS
		create a Bar chart object for use with Get-HTMLBarChart
#>
    [CmdletBinding()]
    param(
        [ValidateSet("pie", "doughnut")]
        [String]
        $ChartType = 'pie',
        [Parameter(Mandatory = $false)]
        $ColorScheme
    )

    $ChartSize = [PSCustomObject] @{
        Width  = 500
        Height = 400
    }

    $DataDefinition = [PSCustomObject] @{
        DataSetName         = "Data"
        DataNameColumnName  = "name"
        DataValueColumnName = "count"
    }

    if ($ColorScheme -eq "Generated") {
        $thisColorScheme = 'Generated' + [string](Get-Random -Minimum 1 -Maximum 8)
    } elseif ($ColorScheme -eq "Random") {
        $thisColorScheme = 'Random'
    } else {
        $thisColorScheme = 'ColorScheme2'
    }

    $ChartStyle = [PSCustomObject] @{
        ChartType       = $ChartType
        ColorSchemeName = "$thisColorScheme"
        Showlabels      = $true
        borderWidth     = "1"
        responsive      = 'false'
        animateScale    = 'true'
        animateRotate   = 'true'
        legendPosition  = 'bottom'
    }

    $ChartObject = [PSCustomObject] @{
        ObjectName     = Get-RandomStringName -Size 12
        Title          = ""
        Size           = $ChartSize
        DataDefinition = $DataDefinition
        ChartStyle     = $ChartStyle
    }

    return $ChartObject
}
