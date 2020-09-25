function Convert-Image {
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