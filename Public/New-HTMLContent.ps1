Function New-HTMLContent {
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
    Param (
        [Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $Content = $(Throw "Open curly brace with Content"),
        [Parameter(Mandatory = $false)][string]$HeaderText,
        [Parameter(Mandatory = $false)][switch]$IsHidden,
        [Parameter(Mandatory = $false)][string]$Anchor,
        [Parameter(Mandatory = $false)][validateset(1, 2, 3, 4, 5, 6)][int]$BackgroundShade,
        [Parameter(Mandatory = $false)][switch] $CanCollapse
    )
    Begin {
        $HTML = New-GenericList -Type [string]
    }
    Process {
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
        $RandomNumber = Get-Random
        if ($IsHidden) {
            $HTML.Add(@"
<div class="section">
<div class="header">
    <a name="$($HeaderText)">$($HeaderText)</a> (<a id="show_$RandomNumber" href="#" onclick="show('$RandomNumber');" style="color: #ffffff;">Show</a>
    <a id="hide_$RandomNumber" href="#" onclick="hide('$RandomNumber');" style="color: #ffffff; display:none;">Hide</a>)
</div>
<div class="content" id="$RandomNumber" style="display:none;background-color:$($bgColorCode);">
"@)
        } elseif ($CanCollapse) {
            $HTML.Add(@"
<div class="section">
<div class="header">
    <a name="$($HeaderText)">$($HeaderText)</a> (<a id="show_$RandomNumber" href="#" onclick="show('$RandomNumber');" style="color: #ffffff; display:none;">Show</a>
    <a id="hide_$RandomNumber" href="#" onclick="hide('$RandomNumber');" style="color: #ffffff; ">Hide</a>)
</div>
<div class="content" id="$RandomNumber" style="background-color:$($bgColorCode);">
"@)
        } else {
            $HTML.Add(@"
<div class="section">
<div class="header">
    <a name="$($HeaderText)">$($HeaderText)</a>
</div>
<div class="content" style="background-color:$($bgColorCode);">
"@)
        }

        $HTML.Add((Invoke-Command -ScriptBlock $Content))
    }
    End {
        $HTML.Add('</div></div>')
        return $HTML
    }
}