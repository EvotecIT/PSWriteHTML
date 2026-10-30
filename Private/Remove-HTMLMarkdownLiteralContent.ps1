function Remove-HTMLMarkdownLiteralContent {
    <#
    .SYNOPSIS
    Excludes literal Markdown contexts before discovering local image candidates.
    #>
    [CmdletBinding()]
    param([string] $Content)

    $Lines = [System.Collections.Generic.List[string]]::new()
    [string] $Fence = ''
    foreach ($Line in [regex]::Split($Content, '\r?\n')) {
        $Boundary = [regex]::Match($Line, '^[ \t]*(?:(?:>[ \t]*|(?:[-+*]|\d+[.)])[ \t]+))*(?<Fence>`{3,}|~{3,})(?<Rest>.*)$')
        if ($Fence) {
            if ($Boundary.Success -and $Boundary.Groups['Fence'].Value[0] -eq $Fence[0] -and
                $Boundary.Groups['Fence'].Length -ge $Fence.Length -and
                [string]::IsNullOrWhiteSpace($Boundary.Groups['Rest'].Value)) { $Fence = '' }
            $Lines.Add('')
        } elseif ($Boundary.Success) {
            $Fence = $Boundary.Groups['Fence'].Value
            $Lines.Add('')
        } elseif ($Line -match '^(?: {0,3}> ?)*(?: {4}|\t)') {
            $Lines.Add('')
        } else {
            $Lines.Add($Line)
        }
    }
    $Source = [string]::Join("`n", $Lines)
    $Source = [regex]::Replace($Source, '(?is)<!--.*?-->|<(pre|code|script|style)\b[^>]*>.*?</\1\s*>', '')
    $Source = [regex]::Replace($Source, '(?s)(?<!`)(`+)(?!`).*?(?<!`)\1(?!`)', '')
    # An odd escape count makes the exclamation mark literal; paired slashes do not.
    return [regex]::Replace($Source, '(?<!\\)(?<Pairs>(?:\\\\)*)\\!', '${Pairs} ')
}
