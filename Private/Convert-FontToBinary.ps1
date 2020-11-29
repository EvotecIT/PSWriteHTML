function Convert-FontToBinary {
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