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

function Convert-Image {
    param(
        [string] $Image
    )

    $ImageFile = Get-ImageFile -Image $Image
    if ($ImageFile) {
        Convert-ImageToBinary -ImageFile $ImageFile
    }
}

function Get-ImageFile {
    param(
        [uri] $Image
    )
    if (-not $Image.IsFile) {
        $Extension = ($Image.OriginalString).Substring(($Image.OriginalString).Length - 4)

        if ($Extension -notin @('.png', '.jpg', 'jpeg', '.svg')) {
            return
        }
        $Extension = $Extension.Replace('.', '')
        $ImageFile = Get-FileName -Extension $Extension -Temporary
        Invoke-WebRequest -Uri $Image -OutFile $ImageFile
        $ImageFile
    } else {

    }
}

function Convert-ImageToBinary {
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