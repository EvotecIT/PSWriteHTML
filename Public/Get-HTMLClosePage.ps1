Function Get-HTMLClosePage {
    <#
	.SYNOPSIS
		Get's the closing segment for the HTML
	    .PARAMETER ClientLogoType
			The type of logo
		.PARAMETER AdditionalContent
		     Some additional pish
#>
    [alias('Get-HTMLPageClose')]
    [CmdletBinding()]
    param(
        [String]$FooterText
    )
    if ($FooterText -eq $null) {
        $Report = @"
<hr />
<!-- FOOTER -->
<div class="footer">Copyright &#169; $([DateTime]::Now.Year) Azure Cloud Enablement. All Rights Reserved.</div>

<!-- END BODY -->
</body>
</html>

"@
    } else {
        $Report = @"
<hr />
<!-- FOOTER -->
<div class="footer">$FooterText</div>

<!-- END BODY -->
</body>
</html>

"@
    }
    Write-Output $Report
}