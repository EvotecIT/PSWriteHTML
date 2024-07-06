function Convert-ImageToBinary {
    <#
    .SYNOPSIS
    Converts an image file to base64 encoding.

    .DESCRIPTION
    This function converts the specified image file to base64 encoding and generates a data URI for embedding images in HTML or CSS.

    .PARAMETER ImageFile
    Specifies the image file to be converted. Provide the full path to the image file.

    .EXAMPLE
    Convert-ImageToBinary -ImageFile "C:\Images\example.jpg"
    Converts the "example.jpg" image file to base64 encoding.

    .EXAMPLE
    Convert-ImageToBinary -ImageFile "C:\Images\logo.svg"
    Converts the "logo.svg" image file to base64 encoding.

    .NOTES
    File types supported for conversion: jpg, svg.

    #>
    [CmdletBinding()]
    param(
        [System.IO.FileInfo] $ImageFile
    )

    if ($ImageFile.Extension -eq '.jpg') {
        $FileType = 'jpeg'
    } elseif ($ImageFile.Extension -eq '.svg') {
        $FileType = 'svg+xml'
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