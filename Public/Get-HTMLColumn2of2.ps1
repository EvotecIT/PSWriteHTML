Function Get-HTMLColumn2of2 {
    <#
	.SYNOPSIS
		adds a row colour field to the array of object for processing with htmltable
	    .PARAMETER PieChartObject
			This is a custom object with Pie chart properties, Create-HTMLPieChartObject
		.PARAMETER PieChartData
			Required an array with the headings Name and Count.  Using Powershell Group-object on an array

#>
    [CmdletBinding()]
    param()
    $report = '<div class="second column">'
    return $report
}