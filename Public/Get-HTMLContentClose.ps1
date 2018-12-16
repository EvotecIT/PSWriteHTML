Function Get-HTMLContentClose {
    <#
	.SYNOPSIS
		Closes an HTML section
#>
    [CmdletBinding()]
    param()
    $Report = @"
    </div>
    </div>
"@
    Return $Report
}