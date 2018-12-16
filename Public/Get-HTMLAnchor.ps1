Function Get-HTMLAnchor {
    <#
	.SYNOPSIS
		creates an Anchor
		.PARAMETER AnchorName
			The Actual Anchor
#>
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $true)]
        [String]
        $AnchorName
    )

    $Anchor = '<a name="' + $AnchorName + '"></a>'
    Write-Output $Anchor
}
