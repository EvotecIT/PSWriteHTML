function Get-ImageFile {
    [CmdletBinding()]
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