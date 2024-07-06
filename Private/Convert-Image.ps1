function Convert-Image {
    <#
    .SYNOPSIS
    Converts an image file to a binary format.

    .DESCRIPTION
    The Convert-Image function takes an image file path as input and converts it to a binary format.

    .PARAMETER Image
    Specifies the path to the image file to be converted.

    .PARAMETER Cache
    Indicates whether to cache the image file for future use.

    .EXAMPLE
    Convert-Image -Image "C:\Images\example.jpg" -Cache
    Description:
    Converts the image file "example.jpg" to a binary format and caches it for future use.

    #>
    [CmdletBinding()]
    param(
        [string] $Image,
        [switch] $Cache
    )

    $ImageFile = Get-ImageFile -Image $Image -Cache:$Cache
    if ($ImageFile) {
        Convert-ImageToBinary -ImageFile $ImageFile
    }
}