Function Get-HTMLJavaScripts {
    <#
	.SYNOPSIS
		Get's Script File from module directory
#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $false)][String]$ScriptPath,
        [switch] $UseLinks
    )
    $ScriptHeaders = New-GenericList -Type [string]
    if ($UseLinks) {
        $Links = @(
            "https://cdn.datatables.net/v/dt/jq-3.3.1/dt-1.10.18/af-2.3.2/b-1.5.4/b-colvis-1.5.4/b-html5-1.5.4/b-print-1.5.4/cr-1.5.0/fc-3.2.5/fh-3.1.4/kt-2.5.0/r-2.2.2/rg-1.1.0/rr-1.2.4/sc-1.5.0/sl-1.2.6/datatables.min.js"
            "https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"
            "https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"
            "https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"
            "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"
        )
        foreach ($Link in $Links) {
            [string] $HTMLLink = '<script type="text/javascript" src="**Link**"></script>'.Replace('**Link**', $Link)
            $ScriptHeaders.Add($HTMLLink)
            $ScriptHeaders.Add("`r`n")
        }
        # Only some links are available online, so some static resources need to be put in. Maybe there is a way to put on CDN.
        # For now we need to reload this function again.
        $ScriptHeaders.Add((Get-HTMLJavaScripts -ScriptPath "$PSScriptRoot\..\Resources\JS\Static"))

    } else {
        if ([String]::IsNullOrEmpty($ScriptPath)) {
            $ScriptPath = "$PSScriptRoot\..\Resources\JS"
        }
        Write-Verbose "Retrieving *.js from $ScriptPath"
        $ScriptFiles = @((get-childitem $ScriptPath -Filter '*.js' -Recurse))

        foreach ($ScriptFile in $ScriptFiles) {
            $ScriptHeaders.Add("`r`n")
            $ScriptHeaders.Add('<script type="text/javascript">')
            $ScriptHeaders.Add("`r`n")
            if ($ScriptFile -like '*.min.*') {
                Write-Verbose "Generating Script Header from minified file - $($ScriptFile.Fullname)"
                $ScriptHeaders.Add((Get-Content -Path $ScriptFile.Fullname))
            } else {
                Write-Verbose "Generating Script Header from non-minified file (adding delimiter) $($ScriptFile.Fullname)"
                $ScriptHeaders.Add((Get-Content -Path $ScriptFile.Fullname -Delimiter "`r`n"))
            }
            $ScriptHeaders.Add('</script>')
            $ScriptHeaders.Add("`r`n")
        }
    }
    Write-Output $ScriptHeaders
}