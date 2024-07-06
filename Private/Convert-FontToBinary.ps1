function Convert-FontToBinary {
    <#
    .SYNOPSIS
    Converts a specified font file to a base64-encoded string and replaces a given search string in content with the encoded font data.

    .DESCRIPTION
    The Convert-FontToBinary function takes a font file, converts it to a base64-encoded string, and then replaces a specified search string in the content with the encoded font data. This can be useful for embedding font data directly into content.

    .PARAMETER Content
    The content where the search string will be replaced with the encoded font data.

    .PARAMETER Search
    The string to search for in the content that will be replaced with the encoded font data.

    .PARAMETER ReplacePath
    The path to the font file that will be converted to base64.

    .PARAMETER FileType
    The type of file being replaced, used to construct the data URI.

    .EXAMPLE
    $content = "body { font-family: 'MyFont', sans-serif; }"
    $search = "'MyFont'"
    $replacePath = "C:\Fonts\MyFont.ttf"
    $fileType = "ttf"

    Convert-FontToBinary -Content $content -Search $search -ReplacePath $replacePath -FileType $fileType

    Description:
    Converts the font file "MyFont.ttf" to base64 and replaces the font reference in the content with the base64-encoded font data.

    #>
    [CmdLetBinding()]
    param(
        [string[]] $Content,
        [string] $Search,
        [string] $ReplacePath,
        [string] $FileType
    )
    if ($Content -like "*$Search*") {
        if ($PSEdition -eq 'Core') {
            $ImageContent = Get-Content -AsByteStream -LiteralPath $ReplacePath
        } else {
            $ImageContent = Get-Content -LiteralPath $ReplacePath -Encoding Byte
        }
        $Replace = "data:application/$FileType;charset=utf-8;base64," + [Convert]::ToBase64String($ImageContent)
        $Content = $Content.Replace($Search, $Replace)
    }
    $Content
}