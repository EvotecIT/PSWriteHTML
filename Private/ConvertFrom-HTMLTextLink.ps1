function ConvertFrom-HTMLTextLink {
    <#
    .SYNOPSIS
    Converts inline text links with independently captured labels and balanced destinations.
    #>
    [CmdletBinding()]
    param([AllowEmptyString()][string] $Text)
    $Pattern = '\[(?<Label>[^\]]+)\]\((?<Url>(?:[^()\s]|\((?<Depth>)|\)(?<-Depth>))+)(?(Depth)(?!))\)'
    [regex]::Replace($Text, $Pattern, [System.Text.RegularExpressions.MatchEvaluator]{
        param($Match)
        New-HTMLAnchor -HrefLink $Match.Groups['Url'].Value -Text $Match.Groups['Label'].Value
    })
}
