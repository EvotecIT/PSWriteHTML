Function Get-HTMLLineChartObject
{
<#
	.SYNOPSIS
		create a Line chart object for use with Get-HTMLLineChart
#>
    [CmdletBinding()]
    param(
		[ValidateSet("line")]
		[String]
		$ChartType = 'line',
		[Parameter(Mandatory=$false)]
		$ColorScheme,
		[Parameter(Mandatory=$false)]
		[int]$Width = 500,
		[Parameter(Mandatory=$false)]
		[int]$Height = 400,
		[Parameter(Mandatory=$false)]
		[string]$DataCategoryName = 'x',
		[Parameter(Mandatory=$false)]
		[string]$DataSetName = 'y',
		[Parameter(Mandatory=$false)]
		[Array]$DataSetNames = @()
	)

	$ChartSize = New-Object PSObject -Property @{`
		Width = $Width
		Height = $Height
	}
	
	if($DataSetNames.Count -eq 0)
	{
		$DataSetNames = @($DataSetName)
	}

	$DataDefinition = New-Object PSObject -Property @{
		DataCategoryName = $DataCategoryName
		DataSetName = $DataSetName
		DataSetNames = $DataSetNames
	}
	
	if ($ColorScheme -eq "Generated") {$thisColorScheme = 'Generated' + [string](Get-Random -Minimum 1 -Maximum 8)}
	elseif ($ColorScheme -eq "Random") {$thisColorScheme = 'Random' }
	else {$thisColorScheme = 'ColorScheme2'}

	$ChartStyle = New-Object PSObject -Property @{`
		ChartType = $ChartType
		ColorSchemeName = "$thisColorScheme"
		Showlabels = $true
		fill = $false
		borderWidth = "1"
		responsive = 'false'
		animateScale = 'true'
        animateRotate = 'true'
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