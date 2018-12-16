Function Get-HTMLJavaScripts
{
<#
	.SYNOPSIS
		Get's Script File from module directory
#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false)]
        [String]
        $ScriptPath
    )
    if([String]::IsNullOrEmpty($ScriptPath))
    {
    	$ScriptPath="$PSScriptRoot\Resources\JS"
    }
    Write-Verbose "Retrieving *.js from $ScriptPath"
	$ScriptFiles = @((get-childitem $ScriptPath -Filter '*.js' -Recurse))
	$ScriptHeaders = @()
	foreach ($ScriptFile in $ScriptFiles) {
		$ScriptHeaders += "`r`n" + '<script type="text/javascript">  '+ "`r`n"
		if ($ScriptFile -like '*.min.*') {
			Write-Verbose "Generating Script Header from minified file - $($ScriptFile.Fullname)"
			$ScriptHeaders += Get-Content -Path $ScriptFile.Fullname #-Delimiter "`r`n"
		} else {
			Write-Verbose "Generating Script Header from non-minified file (adding delimiter) $($ScriptFile.Fullname)"
			$ScriptHeaders += Get-Content -Path $ScriptFile.Fullname -Delimiter "`r`n"
		}
		$ScriptHeaders += '</script> '
	}
	Write-Output $ScriptHeaders
}