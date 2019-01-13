function Format-AnchorTag {
    param (
        $Object
    )

    $AnchorTag = ''
    try {
        $href = $Object.url
        if($null -eq $href)
        {
            throw "Missing parameter 'url' (href)"
        }
        # using default target if none is set
        $target = '_self'
        if($null -ne $Object.target)
        {
            $target = $Object.target
        }

        # using url if no content is set
        $Content = $href
        if($null -ne $Object.Content)
        {
            $Content = $Object.Content
            if($Content -is [System.Management.Automation.PSCustomObject])
            {
                # could be an image
                $Content = Format-Html -Object $Content
            }
        }

        $AnchorTag = '<a href="{0}" target="{1}">{2}</a>' -f $href, $target, $Content
    }
    catch {
        Write-Warning "Failed to format anchor tag, error was $_"
    }

    $AnchorTag
}