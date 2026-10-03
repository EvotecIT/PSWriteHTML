function Resolve-HTMLMarkdownImages {
    <#
    .SYNOPSIS
    Embeds relative Markdown image files contained beneath an explicit source directory.
    #>
    [CmdletBinding()]
    param([string] $Content, [string] $ImageBase)
    $BasePath = [IO.Path]::GetFullPath((Convert-Path -LiteralPath $ImageBase))
    $Prefix = $BasePath.TrimEnd([IO.Path]::DirectorySeparatorChar, [IO.Path]::AltDirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
    $Comparison = if ([IO.Path]::DirectorySeparatorChar -eq '\') { [StringComparison]::OrdinalIgnoreCase } else { [StringComparison]::Ordinal }
    $ImageReferences = @(foreach ($Reference in [regex]::Matches($Content, '!\[(?<Label>[^\]]*)\](?:\[(?<Reference>[^\]]*)\])?(?!\()')) {
        if ($Reference.Groups['Reference'].Value) { $Reference.Groups['Reference'].Value } else { $Reference.Groups['Label'].Value }
    })
    # Inline images and image reference definitions retain their label and optional title.
    $Pattern = '(?<Prefix>!\[[^\]]*\]\(\s*|(?m:^\s*\[[^\]]+\]:\s*))(?<Path><[^>]+>|(?:[^()\s]|\((?<Depth>)|\)(?<-Depth>))+)(?(Depth)(?!))'
    [regex]::Replace($Content, $Pattern, [System.Text.RegularExpressions.MatchEvaluator]{
        param($Match)
        if (-not $Match.Groups['Prefix'].Value.StartsWith('!')) {
            $Reference = [regex]::Match($Match.Groups['Prefix'].Value, '\[([^\]]+)\]').Groups[1].Value
            if ($ImageReferences -notcontains $Reference) { return $Match.Value }
        }
        $Path = $Match.Groups['Path'].Value.Trim('<', '>')
        if ($Path -match '^[a-z][a-z0-9+.-]*:|^[/\\]' -or $Path.StartsWith('#')) { return $Match.Value }
        $Relative = [Uri]::UnescapeDataString(($Path -split '[?#]', 2)[0]).Replace('/', [IO.Path]::DirectorySeparatorChar)
        $Candidate = [IO.Path]::GetFullPath((Join-Path $BasePath $Relative))
        if (-not $Candidate.StartsWith($Prefix, $Comparison) -or -not [IO.File]::Exists($Candidate)) { return $Match.Value }
        if ([IO.Path]::GetExtension($Candidate) -notin '.png', '.jpg', '.jpeg', '.gif', '.webp', '.svg', '.bmp', '.ico', '.tif', '.tiff') { return $Match.Value }
        # Do not follow junctions or symlinks outside the permitted image source tree.
        $Item = Get-Item -LiteralPath $Candidate
        if ($Item.Attributes -band [IO.FileAttributes]::ReparsePoint) { return $Match.Value }
        $Directory = $Item.Directory
        while ($Directory -and $Directory.FullName.StartsWith($Prefix, $Comparison)) {
            if ($Directory.Attributes -band [IO.FileAttributes]::ReparsePoint) { return $Match.Value }
            $Directory = $Directory.Parent
        }
        $DataUri = Convert-ImageToBinary -ImageFile $Candidate
        if ($DataUri -notlike 'data:image/*') { return $Match.Value }
        $Match.Groups['Prefix'].Value + $DataUri
    })
}
