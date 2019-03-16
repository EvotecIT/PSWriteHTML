function Convert-ImagesToBinary {
    [CmdLetBinding()]
    param(
        [string[]] $Content,
        [string] $Search,
        [string] $ReplacePath
    )
    if ($Content -like "*$Search*") {
        $Replace = "data:image/$FileType;base64," + [Convert]::ToBase64String((Get-Content -LiteralPath $ReplacePath -Encoding Byte))
        $Content = $Content.Replace($Search, $Replace)        
    }
    $Content
}