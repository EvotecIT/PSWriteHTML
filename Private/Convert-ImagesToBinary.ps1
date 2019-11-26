function Convert-ImagesToBinary {
    [CmdLetBinding()]
    param(
        [string[]] $Content,
        [string] $Search,
        [string] $ReplacePath
    )
    if ($Content -like "*$Search*") {
        if ($PSEdition -eq 'Core') {
            $ImageContent = Get-Content -AsByteStream -LiteralPath $ReplacePath
        } else {
            $ImageContent = Get-Content -LiteralPath $ReplacePath -Encoding Byte
        }
        $Replace = "data:image/$FileType;base64," + [Convert]::ToBase64String($ImageContent)
        $Content = $Content.Replace($Search, $Replace)
    }
    $Content
}