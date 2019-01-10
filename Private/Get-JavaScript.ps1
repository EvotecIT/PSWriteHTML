function Get-JavaScript {
    param(
        [string[]] $FilePath
    )
    $ScriptHeaders = New-GenericList -Type [string]
    foreach ($ScriptFile in $FilePath) {
        $ScriptHeaders.Add("`r`n")
        $ScriptHeaders.Add('<script type="text/javascript">')
        $ScriptHeaders.Add("`r`n")
        if ($ScriptFile -like '*.min.*') {
            Write-Verbose "Generating Script Header from minified file - $($ScriptFile)"
            $ScriptHeaders.Add((Get-Content -Path $ScriptFile))
        } else {
            Write-Verbose "Generating Script Header from non-minified file (adding delimiter) $($ScriptFile)"
            $ScriptHeaders.Add((Get-Content -Path $ScriptFile -Delimiter "`r`n"))
        }
        $ScriptHeaders.Add('</script>')
        $ScriptHeaders.Add("`r`n")
    }
    return $ScriptHeaders
}