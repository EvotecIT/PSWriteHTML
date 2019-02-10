Function Get-HTMLLineChart {
    <#
	.SYNOPSIS
	
#>
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]
        $ChartObject,
        [Parameter(Mandatory = $true)]
        [Array]
        $DataSet,
        [Parameter(Mandatory = $false)]
        $Options
    )
	
    $DataCount = $ChartObject.DataDefinition.DataSetNames.Count
    Write-Verbose "Data Set count is $DataCount"

    if ($ChartObject.ChartStyle.ColorSchemeName -ne 'Random') {
        if ($null -eq $Options) {
            $ChartColorScheme = $GlobalColorSchemes.($ChartObject.ChartStyle.ColorSchemeName) | Select-Object -First $DataCount
        } else {
            Write-Verbose "Options Colour Schemes selected, selecting $($ChartObject.ChartStyle.ColorSchemeName)"
            $ChartColorScheme = $Options.ColorSchemes.($ChartObject.ChartStyle.ColorSchemeName) | Select-Object -First $DataCount
        }
        if ($ChartColorScheme.Count -lt $DataCount) {
            Write-Warning ("Colorscheme " + $ChartObject.ChartStyle.ColorSchemeName + " only has " + $ChartColorScheme.Count + " schemes, you have $DataCount Records. Generating one for you" )			
            $ChartColorScheme = Get-RandomColorScheme -numberofschemes $DataCount
        }
    } else {
        $ChartColorScheme = Get-RandomColorScheme -numberofschemes $DataCount
    }

    $Labels = ""
    if ($ChartObject.ChartStyle.Showlabels) {
        $Labels = '		labels: [{0}],' -f ($DataSet.($ChartObject.DataDefinition.DataCategoryName) -join ',')
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
<#

$dataSet = @()
$dataSet += [ordered] @{ label = 'My'; data = 10, 30, 1, 5; borderColor = 'green'; borderWidth = 1}
$dataSet += [ordered] @{ label = 'My'; data = 20, 50; borderColor = 'green'; borderWidth = 1}
$dataSet += [ordered] @{ label = 'My'; data = 30, 5, 30; borderColor = 'green'; borderWidth = 1}

$Test = [ordered] @{
    type      = 'line'
    data      = @{
        labels   = @()
        datasets = $dataSet
    }
    options   = [ordered] @{
        responsive = $false
        legend     = @{
            position = 'bottom'
        }
        title      = @{
            display = $true
            text    = "Title"
        }
		

    }
    animation = [ordered] @{
        animateScale = $true
        animateRoate = $true
    }
}

$test | ConvertTo-Json -Depth 5
#>
#>

<# Result
<canvas
	id="LineChartlr8hfamk9c37"
	width="500"
	height="400"
></canvas>
<script>
	var ctx = document.getElementById(
		"LineChartlr8hfamk9c37"
	);
	var LineChartlr8hfamk9c37 = new Chart(ctx, {
		type: "line",
		data: {
			labels: ["2011", "2012", "2013"],
			datasets: [
				{
					label: "My",
					data: [10, 30, 1, 5],
					borderColor: "rgba(66,182,115,1)",
					backgroundColor: [
						"yellow"
					],
					borderWidth: 1
				},
				{
					label: "New",
					data: [20, 50],
					borderColor: "rgba(72,40,230,1)",
					borderWidth: 1
				},
				{
					label: "Hello",
					data: [30, 5, 30],
					borderColor: "rgba(64,126,176,1)",
					borderWidth: 1
				}
			]
		},
		options: {
			responsive: false,
			legend: {
				position: "bottom"
			},
			title: {
				display: true,
				text: "Group Membership"
			}
		},
		animation: {
			animateScale: true,
			animateRotate: true
		}
	});
</script>
#>