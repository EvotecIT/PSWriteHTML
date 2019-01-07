function Format-ImageTag {
    param (
        $Object
    )
    
    $imgtag = ''
    try {
        # ex. <img src="smiley.gif" alt="Smiley face" height="42" width="42">
        $src = $Object.src
        $alt = $Object.alt
        [string]$width = $Object.width
        [string]$height = $Object.height   

        $imgtag = '<img src="{0}" alt="{1}" height="{2}" width="{3}">' -f $src, $alt, $width, $height

        if([string]::IsNullOrEmpty($alt))
        {
            $imgtag = $imgtag -replace 'alt=""'
        }

        if([string]::IsNullOrEmpty($width))
        {
            $imgtag = $imgtag -replace 'width=""'
        }        

        if([string]::IsNullOrEmpty($height))
        {
            $imgtag = $imgtag -replace 'height=""'
        }        
    }
    catch {
        Write-Warning "Failed to format image tag, error was $_"
    }

    $imgtag
}