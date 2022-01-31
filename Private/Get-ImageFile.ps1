function Get-ImageFile {
    [CmdletBinding()]
    param(
        [uri] $Image,
        [switch] $Cache
    )
    if (-not $Image.IsFile) {
        if ($Cache -and -not $Script:CacheImagesHTML) {
            $Script:CacheImagesHTML = @{}
        }
        $Extension = ($Image.OriginalString).Substring(($Image.OriginalString).Length - 4)
        if ($Extension -notin @('.png', '.jpg', 'jpeg', '.svg')) {
            return
        }
        $Extension = $Extension.Replace('.', '')
        $ImageFile = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), "$($([System.IO.Path]::GetRandomFileName()).Split('.')[0]).$Extension")
        if ($Cache -and $Script:CacheImagesHTML[$Image]) {
            $Script:CacheImagesHTML[$Image]
        } else {
            try {
                Invoke-WebRequest -Uri $Image -OutFile $ImageFile
                if ($Cache) {
                    $Script:CacheImagesHTML[$Image] = $ImageFile
                }
            } catch {
                Write-Warning "Get-Image - Couldn't download image. Error: $($_.Exception.Message)"
            }
            $ImageFile
        }
    } else {
        $Image.LocalPath
    }
}