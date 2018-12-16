Function Get-Functions {
    PAram (
        $pattern,
        $path = "$pwd\*",
        [switch]$Recurse = $false
    )
    $parser = [System.Management.Automation.PSParser]
    Get-ChildItem (join-Path $path '\*') -Recurse:$Recurse -Include *.ps1, *.psm1 | ForEach {
        $content = [IO.File]::ReadAllText($_.FullName)
        $tokens = $parser::Tokenize($content, [ref] $null)
        $count = $tokens.Count
        $(
            for ($idx = 0; $idx -lt $count; $idx += 1) {
                if ($tokens[$idx].Content -eq 'function') {
                    $targetToken = $tokens[$idx + 1]
                    [PSCustomObject] @{
                        FileName     = $_.FullName
                        FunctionName = $targetToken.Content

                        Line         = $targetToken.StartLine
                    } | Select FunctionName, FileName, Line
                }
            }
        ) #| Where {$_.FunctionName -match $pattern}
    }
}