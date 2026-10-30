function Get-HTMLMarkdownImageMap {
    <#
    .SYNOPSIS
    Maps relative Markdown image URLs to embedded images beneath an explicit source directory.
    #>
    [CmdletBinding()]
    param([string] $Content, [string] $ImageBase)
    $BasePath = [IO.Path]::GetFullPath((Convert-Path -LiteralPath $ImageBase))
    $Prefix = $BasePath.TrimEnd([IO.Path]::DirectorySeparatorChar, [IO.Path]::AltDirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
    $Comparison = if ([IO.Path]::DirectorySeparatorChar -eq '\') { [StringComparison]::OrdinalIgnoreCase } else { [StringComparison]::Ordinal }
    $Content = Remove-HTMLMarkdownLiteralContent -Content $Content
    $ImageReferences = @(foreach ($Reference in [regex]::Matches($Content, '!\[(?<Label>[^\]]*)\](?:\[(?<Reference>[^\]]*)\])?(?!\()')) {
        if ($Reference.Groups['Reference'].Value) { $Reference.Groups['Reference'].Value } else { $Reference.Groups['Label'].Value }
    })
    # Discover candidates after excluding literal contexts; the original Markdown
    # remains unchanged for the browser-side Showdown renderer.
    $Pattern = '(?<Prefix>!\[[^\]]*\]\(\s*|(?m:^\s*\[[^\]]+\]:\s*))(?<Path><[^>]+>|(?:[^()\s]|\((?<Depth>)|\)(?<-Depth>))+)(?(Depth)(?!))'
    $Images = [System.Collections.Generic.Dictionary[string, string]]::new([StringComparer]::Ordinal)
    foreach ($Match in [regex]::Matches($Content, $Pattern)) {
        if (-not $Match.Groups['Prefix'].Value.StartsWith('!')) {
            $Reference = [regex]::Match($Match.Groups['Prefix'].Value, '\[([^\]]+)\]').Groups[1].Value
            if ($ImageReferences -notcontains $Reference) { continue }
        }
        $Path = $Match.Groups['Path'].Value.Trim('<', '>')
        if ($Path -match '^[a-z][a-z0-9+.-]*:|^[/\\]' -or $Path.StartsWith('#')) { continue }
        $Relative = [Uri]::UnescapeDataString(($Path -split '[?#]', 2)[0]).Replace('/', [IO.Path]::DirectorySeparatorChar)
        $Candidate = [IO.Path]::GetFullPath((Join-Path $BasePath $Relative))
        if (-not $Candidate.StartsWith($Prefix, $Comparison) -or -not [IO.File]::Exists($Candidate)) { continue }
        if ([IO.Path]::GetExtension($Candidate) -notin '.png', '.jpg', '.jpeg', '.gif', '.webp', '.svg', '.bmp', '.ico', '.tif', '.tiff') { continue }
        # Do not follow junctions or symlinks outside the permitted image source tree.
        $Item = Get-Item -LiteralPath $Candidate
        if ($Item.Attributes -band [IO.FileAttributes]::ReparsePoint) { continue }
        $Directory = $Item.Directory
        $Linked = $false
        while ($Directory -and $Directory.FullName.StartsWith($Prefix, $Comparison)) {
            if ($Directory.Attributes -band [IO.FileAttributes]::ReparsePoint) { $Linked = $true; break }
            $Directory = $Directory.Parent
        }
        if ($Linked) { continue }
        if ($Images.ContainsKey($Path)) { continue }
        $DataUri = Convert-ImageToBinary -ImageFile $Candidate
        if ($DataUri -notlike 'data:image/*') { continue }
        $Images[$Path] = $DataUri
    }
    return $Images
}
