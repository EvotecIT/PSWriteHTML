function Convert-ImagesToBinary {
    <#
    .SYNOPSIS
    Converts images in the input content to base64 format.

    .DESCRIPTION
    This function searches for a specified string in the input content and replaces it with the base64 representation of an image file located at the specified path.

    .PARAMETER Content
    The input content where the search and replacement will be performed.

    .PARAMETER Search
    The string to search for in the input content.

    .PARAMETER ReplacePath
    The path to the image file that will replace the search string in the input content.

    .EXAMPLE
    Convert-ImagesToBinary -Content $content -Search "logo.png" -ReplacePath "C:\Images\logo.png"
    This example searches for the string "logo.png" in the input content and replaces it with the base64 representation of the image file located at "C:\Images\logo.png".

    #>
    [CmdLetBinding()]
    param(
        [string[]] $Content,
        [string] $Search,
        [string] $ReplacePath
    )
    if ($Content -like "*$Search*") {
        if (Test-Path $ReplacePath) {
            try {
                if ($PSEdition -eq 'Core') {
                    $ImageContent = Get-Content -AsByteStream -LiteralPath $ReplacePath -ErrorAction Stop
                } else {
                    $ImageContent = Get-Content -LiteralPath $ReplacePath -Encoding Byte -ErrorAction Stop
                }
            } catch {
                Write-Warning -Message "Convert-ImagesToBinary - Couldn't read image file at $ReplacePath. Error: $($_.Exception.Message)"
                return $Content
            }
            $Replace = "data:image/$FileType;base64," + [Convert]::ToBase64String($ImageContent)
            $Content = $Content.Replace($Search, $Replace)
        }
    }
    $Content
}