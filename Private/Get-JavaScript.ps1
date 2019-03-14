function Get-JavaScript {
    param(
        [string[]] $FilePath
    )
    $ScriptHeaders = @(
        foreach ($ScriptFile in $FilePath) {
            '<script type="text/javascript">'
            Write-Verbose "Generating Script Header from file - $($ScriptFile)"
            Get-Content -Path $ScriptFile
            '</script>'
        }
    )
    return $ScriptHeaders
}