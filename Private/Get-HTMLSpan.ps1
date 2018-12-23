function Get-HTMLSpan {
    Param (
        $block,
        $tokenColor
    )
    #
    # Original Author: Lee Holmes, http://www.leeholmes.com/blog/MorePowerShellSyntaxHighlighting.aspx
    #
    # Modified by: Helge Klein, http://blogs.sepago.de/helge/
    #

    if (($tokenColor -eq 'NewLine') -or ($tokenColor -eq 'LineContinuation')) {
        if ($tokenColor -eq 'LineContinuation') {
            $null = $codeBuilder.Append('`')
        }

        $null = $codeBuilder.Append("<br />`r`n")
    } else {
        $block = [System.Web.HttpUtility]::HtmlEncode($block)
        if (-not $block.Trim()) {
            $block = $block.Replace(' ', '&nbsp;')
        }

        $htmlColor = $tokenColours[$tokenColor].ToString().Replace('#FF', '#')

        if ($tokenColor -eq 'String') {
            $lines = $block -split "`r`n"
            $block = ""

            $multipleLines = $false
            foreach ($line in $lines) {
                if ($multipleLines) {
                    $block += "<BR />`r`n"
                }

                $newText = $line.TrimStart()
                $newText = "&nbsp;" * ($line.Length - $newText.Length) + $newText
                $block += $newText
                $multipleLines = $true
            }
        }

        $null = $codeBuilder.Append("<span style='color:$htmlColor'>$block</span>")
    }
}