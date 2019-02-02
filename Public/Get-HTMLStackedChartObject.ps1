Function Get-HTMLStackedChartObject
{
<#
	.SYNOPSIS
		create a Stacked chart object for use with Get-HTMLStackedChart
#>
    [CmdletBinding()]
    param(
		[Parameter(Mandatory=$false)]
		$ColorScheme,
        #[Parameter(Mandatory=$true)]
		[String]
		$DataSetArrayXLabels='Date',
        #[Parameter(Mandatory=$true)]
		[String]
        $DataSetArrayName='OwnerSolution',
        #[Parameter(Mandatory=$true)]
		[String]
		$DataSetArrayData='usagedata',
        #[Parameter(Mandatory=$true)]
		[String]
		$DataSetArrayDataColumn='cost'
)

	$ChartSize = New-Object PSObject -Property @{`
		Width = 1000
		Height = 400
	}
	
	$DataDefinition = New-Object PSObject -Property @{`
		DataSetArrayData = $DataSetArrayData
		DataSetArrayName = $DataSetArrayName
		DataSetArrayXLabels = $DataSetArrayXLabels
        DataSetArrayDataColumn = $DataSetArrayDataColumn
	}
	
	if ($ColorScheme -eq "Generated") {$thisColorScheme = 'Generated' + [string](Get-Random -Minimum 1 -Maximum 8)}
	elseif ($ColorScheme -eq "Random") {$thisColorScheme = 'Random' }
	else {$thisColorScheme = 'ColorScheme2'}

	$ChartStyle = New-Object PSObject -Property @{`
		ChartType = 'line' # bar
		ColorSchemeName = "$thisColorScheme"
		Showlabels= $true
        yAxesStacked= 'true'
		borderWidth = "1"
		responsive = 'false'
		animateScale = 'true'
        animateRotate = 'true'
		legendPosition = 'bottom'
        tooltips = New-Object PSObject -Property @{`
            mode = 'dataset'
            intersect = 'true'
        }
        hover  = New-Object PSObject -Property @{`
            mode = 'point'
            intersect = 'true'
        }

	}
	
	$ChartObject = New-Object PSObject -Property @{`
        ObjectName     = "StackedChart$(Get-RandomStringName -Size 12)"
		Title = ""
		Size = $ChartSize
		DataDefinition = $DataDefinition
		ChartStyle = $ChartStyle
	}
	
	return $ChartObject
}