function Add-Image {
    param(
        [string] $Source,
        [Uri] $UrlLink = '',
        [string] $AlternativeText = '',
        [string] $Class = 'Logo',
        [nullable[int]] $Width,
        [nullable[int]] $Height
    )

    $HTML = Get-Content "$PSScriptRoot\..\Resources\HTML\Image.html"
    if ($UrlLink -eq '') {
        $HTML = $HTML.Replace('target="_blank"', '')
    }
    $HTML = $HTML -Replace 'DefaultHref', $UrlLink `
        -Replace 'DefaultSource', $Source `
        -Replace 'DefaultAlternativeText', $AlternativeText `
        -Replace 'DefaultClass', $Class `
        -Replace 'DefaultWidth', $Width `
        -Replace 'DefaultHeight', $Height
    return $HTML
}