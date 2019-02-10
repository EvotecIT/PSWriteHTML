Function Get-HTMLStackedChart
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


	$DataCount = $DataSet.Count
	Write-Verbose "Data Set count is $DataCount"

	if ($ChartObject.ChartStyle.ColorSchemeName -ne 'Random')
	{
		if ($Options -eq $null) {
			#Write-Verbose "Default Colour Schemes selected, selecting $($ChartObject.ChartStyle.ColorSchemeName)"
			#$ColorSchemes =	Get-HTMLColorSchemes 
			$ChartColorScheme = $GlobalColorSchemes.($ChartObject.ChartStyle.ColorSchemeName) | select -First $DataCount
		} else {
			Write-Verbose "Options Colour Schemes selected, selecting $($ChartObject.ChartStyle.ColorSchemeName)"
			$ChartColorScheme = $Options.ColorSchemes.($ChartObject.ChartStyle.ColorSchemeName) | select -First $DataCount
		}
		if ($ChartColorScheme.Count -lt $DataCount) {
			Write-Warning ("Colorscheme " +  $ChartObject.ChartStyle.ColorSchemeName + " only has " + $ChartColorScheme.Count + " schemes, you have $DataCount Records. Generating one for you" )			
			$ChartColorScheme = GenerateRandomColorScheme -numberofschemes $DataCount -ColorSwing (($DataCount/2)+8)
		}
	}
	else
	{
		$ChartColorScheme = GenerateRandomColorScheme -numberofschemes $DataCount -ColorSwing (($DataCount/2)+8)
	}
		
	$ofs = ','
	$CJSHeader  = @()
	$CJSHeader += '<canvas id="' + $ChartObject.ObjectName + '" width="'+ $ChartObject.Size.Width + '" height="' + $ChartObject.Size.Height +'"></canvas>'
	$CJSHeader += '<script>'
	$CJSHeader += 'var ctx = document.getElementById("' + $ChartObject.ObjectName + '");'
	$CJSHeader += 'var ' + $ChartObject.ObjectName + ' = new Chart(ctx, {'
	$CJSHeader += "	type: '$($ChartObject.ChartStyle.ChartType)',"
	
	
	$CJSData = @()
	$CJSData = "	data:	{"+ "`n"
	if ($ChartObject.ChartStyle.Showlabels) {
		$ofs ='","'
		$CJSData += '		labels: ["' +"$([string]($DataSet.($ChartObject.DataDefinition.DataSetArrayData).($ChartObject.DataDefinition.DataSetArrayXLabels) | select -Unique))" + '"],' + "`n"
	}
	

    $rowCount = 0
	$CJSData += "		datasets: ["
    #$Set = $DataSet[4]
    Foreach ($Set in $DataSet)
    {
        $CJSData += "   {" + "`n"
	    $CJSData += "			label: '$($Set.($ChartObject.DataDefinition.DataSetArrayName))'," + "`n"
	    $ofs =","
        $CJSData += "           fill: true," + "`n"
	    $CJSData += "			data: [" + "$([string]($Set.($ChartObject.DataDefinition.DataSetArrayData).($chartObject.DataDefinition.DataSetArrayDataColumn)))" +"]," + "`n"
	    $ofs ="','"
        $CJSData += "           borderCapStyle: 'butt'," + "`n"	    
        $CJSData += "			backgroundColor: '$($ChartColorScheme[$rowcount].Background)'," + "`n"
	    $CJSData += "			pointBackgroundColor:  '$($ChartColorScheme[$rowcount].Border)'," + "`n"
	    $CJSData += "			pointHighlightStroke: '$($ChartColorScheme[$rowcount].Border)'," + "`n"
        $CJSData += "			borderColor: '$($ChartColorScheme[$rowcount].Border)'," + "`n"
	    
        if ($rowCount -ne ($DataSet.Count -1)) 
        {
            $CJSData += "		},"
        }
        else
        {
            $CJSData += "		}"
        }
        $rowCount++
    }

        $CJSData += "		]"+ "`n"
	    $CJSData += "	},"	
	    $ofs =""
       

	
	
	$CJSOptions = @()
	$cjsOptions += '	options: {'
	#responsive
	$cjsOptions += "		responsive: $($ChartObject.ChartStyle.responsive),"
	#legend
	$cjsOptions += "		legend: {
                position: '$($ChartObject.ChartStyle.legendposition)',
            },"
	#Title
	if ($ChartObject.Title -ne '') {
		$cjsOptions += "		title: {
				display: true,
				text: '$($ChartObject.Title)'
			},"
	}
	#Scales
	$cjsOptions += "scales: {
    	       yAxes: [{
    	       stacked: $($ChartObject.ChartStyle.yAxesStacked),
    	        }]
    	},"
    #Tooltips
    	$cjsOptions += "tooltips: {
    	       mode:  '$($ChartObject.ChartStyle.tooltips.mode)',
    	       intersect: $($ChartObject.ChartStyle.tooltips.intersect),
    	},"

    #Hover 
    	$cjsOptions += "hover: {
    	         mode:  '$($ChartObject.ChartStyle.hover.mode)',
    	       intersect: $($ChartObject.ChartStyle.hover.intersect),
    	},"
    #animation
	$cjsOptions += "	animation: {
                animateScale: $($ChartObject.ChartStyle.animateScale),
                animateRotate: $($ChartObject.ChartStyle.animateRotate),
                duration: 750,
            },"
    $cjsOptions += "}"
	$CJSOptions += "});	"
	
	
	$CJSFooter = " </script>"
	


	$CJS  = @()
	$CJS += $CJSHeader
	$CJS += $CJSData
	$CJS += $CJSOptions 
	$CJS += $CJSFooter

	write-output $CJS
}