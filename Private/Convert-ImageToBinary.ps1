function Convert-ImageToBinary {
    [CmdletBinding()]
    param(
        [System.IO.FileInfo] $ImageFile
    )

    if ($ImageFile.Extension -eq '.jpg') {
        $FileType = 'jpeg'
    } else {
        $FileType = $ImageFile.Extension.Replace('.', '')
    }
    Write-Verbose "Converting $($ImageFile.FullName) to base64 ($FileType)"

    if ($PSEdition -eq 'Core') {
        $ImageContent = Get-Content -AsByteStream -LiteralPath $ImageFile.FullName
    } else {
        $ImageContent = Get-Content -LiteralPath $ImageFile.FullName -Encoding Byte
    }
    $Output = "data:image/$FileType;base64," + [Convert]::ToBase64String(($ImageContent))
    $Output
}