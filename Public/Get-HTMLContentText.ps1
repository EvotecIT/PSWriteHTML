Function Get-HTMLContentText {
    <#
	.SYNOPSIS
		Creates an HTML entry with heading and detail
	    .PARAMETER Heading
			The type of logo
		.PARAMETER Detail
		     Some additional pish
#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $false)]
        [String]
        $Heading,
        [Parameter(Mandatory = $false)]
        [String]
        $Detail
    )

    $Report = @"
<table><tbody>
	<tr>
	<th class="content">$Heading</th>
	<td class="content">$($Detail)</td>
	</tr>
</tbody></table>
"@
    $Report = $Report -replace 'URL01NEW', '<a target="_blank" href="'
    $Report = $Report -replace 'URL01', '<a href="'
    $Report = $Report -replace 'URL02', '">'
    $Report = $Report -replace 'URL03', '</a>'
    Return $Report
}