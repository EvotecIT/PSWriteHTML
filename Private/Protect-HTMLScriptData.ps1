function Protect-HTMLScriptData {
    <#
    .SYNOPSIS
    Escapes HTML raw-text boundaries in already serialized script data.
    #>
    [CmdletBinding()]
    param([Parameter(ValueFromPipeline)][AllowEmptyString()][string] $Json)
    process {
        $Json.Replace('<', '\u003c').Replace('>', '\u003e').Replace('&', '\u0026').Replace([string][char]0x2028, '\u2028').Replace([string][char]0x2029, '\u2029')
    }
}
