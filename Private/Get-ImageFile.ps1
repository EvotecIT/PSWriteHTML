function Get-ImageFile {
    <#
    .SYNOPSIS
    Downloads an image file from a specified URI.

    .DESCRIPTION
    This function downloads an image file from a specified URI. It supports caching of downloaded images.

    .PARAMETER Image
    Specifies the URI of the image to download.

    .PARAMETER Cache
    Indicates whether to cache the downloaded image.

    .EXAMPLE
    Get-ImageFile -Image "https://example.com/image.jpg" -Cache
    Downloads the image file from the specified URI and caches it.

    .EXAMPLE
    Get-ImageFile -Image "https://example.com/image.png"
    Downloads the image file from the specified URI without caching.

    #>
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