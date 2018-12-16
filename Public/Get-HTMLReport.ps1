Function Save-HTMLReport
{
<#
	.SYNOPSIS
		generation of  report and invokes the file to open
	.PARAMETER ReportName
		with generate a random file name if noone is specified
	.PARAMETER ReportPath
		specifiy test directory, will use %TEMP% by default
	.PARAMETER ReportContent
		This should be the complete HTML code
#>
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory=$false)]
	    [string]$ReportName,
	    [Parameter(Mandatory=$false)]
        [string]$ReportPath,
	    [Parameter(Mandatory=$true)]
        [Array]$ReportContent,
        [Parameter(Mandatory=$false)]
	    [switch]$ShowReport
    )

	if ([string]::IsNullOrEmpty($ReportPath))
	{
		Write-Warning "ReportPath parameter $ReportPath is empty,using Temp"
		$ReportPath = $env:temp
	}
	else {
		if ((Test-Path $ReportPath) -eq $false )
		{
			Write-Warning "ReportPath parameter $ReportPath is not valid or can't be accessed,using Temp"
			$ReportPath = $env:temp
		}
	}


	$ReportName = $ReportName.replace('.html','')
	if ($ReportName -eq $null -or $ReportName -eq ""){
        $ReportName = -join ((65..90) + (97..122) | Get-Random -Count 12 | ForEach-Object {[char]$_})
	}
	$rptFile = join-path $ReportPath ($ReportName.replace(" ","") + ".html")
    Write-Verbose "Generating Report File at $rptFile"


    $ReportContent | Set-Content -Path $rptFile -Force
	Write-Verbose $rptFile
    if ($ShowReport) {
		Start-Sleep -Seconds 1
		Invoke-Item $rptFile
	}
	Write-Output $rptFile
}