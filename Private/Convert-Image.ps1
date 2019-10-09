function Convert-Image {
    [CmdletBinding()]
    param(
        [string] $Image
    )

    $ImageFile = Get-ImageFile -Image $Image
    if ($ImageFile) {
        Convert-ImageToBinary -ImageFile $ImageFile
    }
}