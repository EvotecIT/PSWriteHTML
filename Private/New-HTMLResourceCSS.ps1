function New-HTMLResourceCSS {
    [alias('New-ResourceCSS', 'New-CSS')]
    [CmdletBinding()]
    param(
        [alias('ScriptContent')][Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $Content,
        [string[]] $Link,
        [string] $ResourceComment,
        [string[]] $FilePath,
        [System.Collections.IDictionary] $CssInline,
        [System.Collections.IDictionary] $ReplaceData

    )
    $Output = @(
        "<!-- CSS $ResourceComment START -->"
        foreach ($File in $FilePath) {
            if ($File -ne '') {
                if (Test-Path -LiteralPath $File) {
                    New-HTMLTag -Tag 'style' -Attributes @{ type = 'text/css' } {
                        Write-Verbose "New-HTMLResourceCSS - Reading file from $File"
                        # Replaces stuff based on $Script:CurrentConfiguration CustomActionReplace Entry
                        $FileContent = Get-Content -LiteralPath $File -Raw
                        if ($null -ne $ReplaceData) {
                            foreach ($_ in $ReplaceData.Keys) {
                                $FileContent = $FileContent -replace $_, $ReplaceData[$_]
                            }
                        }
                        $FileContent -replace '@charset "UTF-8";'
                    } -NewLine
                }
            }
        }
        foreach ($L in $Link) {
            if ($L -ne '') {
                Write-Verbose "New-HTMLResourceCSS - Adding link $L"
                New-HTMLTag -Tag 'link' -Attributes @{ rel = "stylesheet"; type = "text/css"; href = $L } -SelfClosing -NewLine
            }
        }
        if ($CssInline) {
            ConvertTo-CascadingStyleSheets -Css $CssInline -WithTags
        }
        "<!-- CSS $ResourceComment END -->"
    )
    if ($Output.Count -gt 2) {
        # Outputs only if more than comments
        $Output
    }
}