Function Get-HTMLBarChartObject
{
<#
	.SYNOPSIS
		create a Bar chart object for use with Get-HTMLBarChart
#>
    [CmdletBinding()]
    param(
		[Parameter(Mandatory=$false)]
		$ColorScheme
	)


	$ChartSize = New-Object PSObject -Property @{`
		Width = 500
		Height = 400
	}

	$DataDefinition = New-Object PSObject -Property @{`
		DataSetName = "Data"
		AxisXTitle = ""
		AxisYTitle = ""
		DataNameColumnName = "name"
		DataValueColumnName = "count"

	}

	if ($ColorScheme -eq "Generated") {$thisColorScheme = 'Generated' + [string](Get-Random -Minimum 1 -Maximum 8)}
	elseif ($ColorScheme -eq "Random") {$thisColorScheme = 'Random' }
	else {$thisColorScheme = 'ColorScheme1'}

	$ChartStyle = New-Object PSObject -Property @{`
		ChartType = "bar"
		ColorSchemeName = "$thisColorScheme"
		Showlabels= $true
		borderWidth = "1"
		responsive = 'false'
		legendPosition = 'bottom'

	}

	$ChartObject = New-Object PSObject -Property @{`
		ObjectName = -join ((65..90) + (97..122) | Get-Random -Count 12 | ForEach-Object {[char]$_})
		Title = ""
		Size = $ChartSize
		DataDefinition = $DataDefinition
		ChartStyle = $ChartStyle
	}

	return $ChartObject
}
