Function Get-HTMLLineChart
{
<#
	.SYNOPSIS
	
#>
	[CmdletBinding()]
	Param (
		[Parameter(Mandatory=$true)]
		$ChartObject,
		[Parameter(Mandatory=$true)]
		[Array]
		$DataSet,
		[Parameter(Mandatory=$false)]
		$Options
	)
	
	$DataCount = $ChartObject.DataDefinition.DataSetNames.Count
	Write-Verbose "Data Set count is $DataCount"

	if ($ChartObject.ChartStyle.ColorSchemeName -ne 'Random')
	{
		if ($null -eq $Options) {
			$ChartColorScheme = $GlobalColorSchemes.($ChartObject.ChartStyle.ColorSchemeName) | Select-Object -First $DataCount
		} else {
			Write-Verbose "Options Colour Schemes selected, selecting $($ChartObject.ChartStyle.ColorSchemeName)"
			$ChartColorScheme = $Options.ColorSchemes.($ChartObject.ChartStyle.ColorSchemeName) | Select-Object -First $DataCount
		}
		if ($ChartColorScheme.Count -lt $DataCount) {
			Write-Warning ("Colorscheme " +  $ChartObject.ChartStyle.ColorSchemeName + " only has " + $ChartColorScheme.Count + " schemes, you have $DataCount Records. Generating one for you" )			
			$ChartColorScheme = GenerateRandomColorScheme -numberofschemes $DataCount
		}
	}
	else
	{
		$ChartColorScheme = GenerateRandomColorScheme -numberofschemes $DataCount
	}

	$Labels = ""
	if($ChartObject.ChartStyle.Showlabels)
	{
		$Labels= '		labels: [{0}],' -f ($DataSet.($ChartObject.DataDefinition.DataCategoryName) -join ',')
	}
	$ChartObjectObjectName = $ChartObject.ObjectName
	# to display the title or not
	$displayTitle = ([string](-not [string]::IsNullOrEmpty($ChartObject.Title))).tolower()

	# a template for the dataset, notice we escape the {}
	$sDataset = @'
	{{
		label: '{0}',
		data: [{1}],
		borderColor: '{2}',
		borderWidth: {3}
	}}
'@

	$CJS = @"
	<canvas id="$ChartObjectObjectName" width="$($ChartObject.Size.Width)" height="$($ChartObject.Size.Height)"></canvas>
	<script>
	var ctx = document.getElementById("$ChartObjectObjectName");
	var $ChartObjectObjectName = new Chart(ctx, {
		type: '$($ChartObject.ChartStyle.ChartType)',
		data:	{
			$Labels
			datasets: [
				$(
					$i = 0
					($ChartObject.DataDefinition.DataSetNames | ForEach-Object {
						$data = $DataSet.$_ -join ','
						$sDataset -f $_, $data, $ChartColorScheme.border[$i], $ChartObject.ChartStyle.borderWidth
						$i += 1
					}) -join ','
					
				)				
			]
		},
		options: {
			responsive: $($ChartObject.ChartStyle.responsive),
			legend: {
					position: '$($ChartObject.ChartStyle.legendposition)',
				},
			title: {
					display: $displayTitle,
					text: '$($ChartObject.Title)'
				},
		},
		animation: {
					animateScale: $($ChartObject.ChartStyle.animateScale),
					animateRotate: $($ChartObject.ChartStyle.animateRotate)
				}
	});	
	</script>
"@	

	write-output $CJS
}