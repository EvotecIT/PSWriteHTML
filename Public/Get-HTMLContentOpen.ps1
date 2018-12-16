Function Get-HTMLContentOpen {
    <#
	.SYNOPSIS
		Creates a section in HTML
	    .PARAMETER HeaderText
			The heading for the section
		.PARAMETER IsHidden
		    Switch parameter to define if the section can collapse
		.PARAMETER BackgroundShade
		    An int for 1 to 6 that defines background shading
#>
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $false)]
        [string]$HeaderText,
        [Parameter(Mandatory = $false)]
        [switch]$IsHidden,
        [Parameter(Mandatory = $false)]
        [string]$Anchor,
        [Parameter(Mandatory = $false)]
        [validateset(1, 2, 3, 4, 5, 6)]
        [int]$BackgroundShade
    )

    switch ($BackgroundShade) {
        1 { $bgColorCode = "#F8F8F8" }
        2 { $bgColorCode = "#D0D0D0" }
        3 { $bgColorCode = "#A8A8A8" }
        4 { $bgColorCode = "#888888" }
        5 { $bgColorCode = "#585858" }
        6 { $bgColorCode = "#282828" }
        default { $bgColorCode = "#ffffff" }
    }

    if ([String]::IsNullOrEmpty($Anchor)) {
        $InsertAnchor = 'name="' + $Anchor + '"'
    }

    if ($IsHidden) {
        $RandomNumber = Get-Random
        $Report = @"
<div class="section">
<div class="header">
    <a name="$($HeaderText)">$($HeaderText)</a> (<a id="show_$RandomNumber" href="#" onclick="show('$RandomNumber');" style="color: #ffffff;">Show</a><a id="hide_$RandomNumber" href="#" onclick="hide('$RandomNumber');" style="color: #ffffff; display:none;">Hide</a>)
</div>
<div class="content" id="$RandomNumber" style="display:none;background-color:$($bgColorCode);">
"@
    } else {
        $Report = @"
<div class="section">
<div class="header">
    <a name="$($HeaderText)">$($HeaderText)</a>
</div>
<div class="content" style="background-color:$($bgColorCode);">
"@
    }
    Return $Report
}