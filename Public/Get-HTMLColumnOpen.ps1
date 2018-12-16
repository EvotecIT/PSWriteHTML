Function Get-HTMLColumnOpen
{
<#
	.SYNOPSIS
		Dynamic Column Creation
	    .PARAMETER NumberOf
			This is a current column number
		.PARAMETER ColumnTotal
			Total Number of columns

#>
    [CmdletBinding()]
    param
	(
		[Parameter(Mandatory=$true)]
		[int]$ColumnNumber,
		[Parameter(Mandatory=$true)]
		[int]$ColumnCount
	)

	$ColumnItem = [string]$ColumnNumber + "of" + [string]$ColumnCount
	Write-Verbose $ColumnItem
	$ColumnItem = $ColumnItem.replace('1','one').replace('2','two').replace('3','three').replace('4','four').replace('5','five').replace('6','six')
	Write-Verbose $ColumnItem
	$report = '<div class="' + $ColumnItem + ' column">'
	return $report
}