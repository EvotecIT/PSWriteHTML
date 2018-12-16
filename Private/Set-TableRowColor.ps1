Function Set-TableRowColor
{
<#
	.SYNOPSIS
		adds a row colour field to the array of object for processing with htmltable
	    .PARAMETER ArrayOfObjects
			The type of logo
		.PARAMETER Green
		     Some additional pish
		.PARAMETER Yellow
		     Some additional pish
		.PARAMETER Red
		    use $this and an expression to measure the value
		.PARAMETER Alertnating
			a switch the will define Odd and Even Rows in the rowcolor column
#>
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory=$false)]
	    [Object[]]$ArrayOfObjects,
	    [Parameter(Mandatory=$false)]
        [string]$Green = '$this -eq $false',
	    [Parameter(Mandatory=$false)]
        [string]$Yellow = '$this -eq $false',
	    [Parameter(Mandatory=$false)]
        [string]$Red = '$this -eq $false',
	    [Parameter(Mandatory=$false)]
        [switch]$Alternating
    )
	if ($Alternating) {
		$ColoredArray = $ArrayOfObjects | Add-Member -MemberType ScriptProperty -Name RowColor -Value {
		if ((([array]::indexOf($ArrayOfObjects,$this)) % 2) -eq 0) {'Odd'}
		if ((([array]::indexOf($ArrayOfObjects,$this)) % 2) -eq 1) {'Even'}
		} -PassThru -Force | Select-Object *
	} else {
		$ColoredArray = $ArrayOfObjects | Add-Member -MemberType ScriptProperty -Name RowColor -Value {
			if (Invoke-Expression $Green) {'Green'}
			elseif (Invoke-Expression $Red) {'Red'}
			elseif (Invoke-Expression $Yellow) {'Yellow'}
			else {'None'}
			} -PassThru -Force | Select-Object *
	}

	return $ColoredArray
}