Function Get-HTMLAnchorLink {
    <#
	.SYNOPSIS
		creates Hyperlink for an Anchor
		.PARAMETER AnchorName
			The Actual name of the Anchor (Hidden)
		.PARAMETER AnchorText
			The HyperLink text.  Will default to $AnchorNname if not specified
#>
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $false)]
        [String]
        $AnchorName,
        [Parameter(Mandatory = $true)]
        [String]
        $AnchorText
    )
    if ($AnchorText -eq $null -or $AnchorText -eq '') {$AnchorText = $AnchorName}
    $report = '<a class="alink" href="#' + $AnchorName + '">' + $AnchorText + '</a>'

    Write-Output $report
}