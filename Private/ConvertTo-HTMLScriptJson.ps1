function ConvertTo-HTMLScriptJson {
    <#
    .SYNOPSIS
    Serializes data for an inline HTML script without changing its string values.
    .DESCRIPTION
    Uses PowerShell JSON serialization and escapes HTML raw-text delimiters and
    JavaScript line separators. Executable callbacks must be added separately.
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)][AllowNull()][object] $InputObject,
        [ValidateRange(1, 100)][int] $Depth = 20,
        [switch] $Compress
    )
    begin { $Items = [System.Collections.Generic.List[object]]::new() }
    process { $Items.Add($InputObject) }
    end {
        if ($Items.Count -eq 1) { $Value = $Items[0] } elseif ($Items.Count -gt 1) { $Value = $Items.ToArray() } else { $Value = $null }
        $Json = ConvertTo-Json -InputObject $Value -Depth $Depth -Compress:$Compress
        Protect-HTMLScriptData -Json $Json
    }
}
