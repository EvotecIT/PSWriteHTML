Function Get-HTMLCSS {
    <#
	    .SYNOPSIS
		    Get's HTML Cascading Style Sheet
        .PARAMETER CSSName
		    Name of the CSS
    #>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $false)][String] $CSSPath,
        [Parameter(Mandatory = $false)][String] $CSSName,

        [switch] $Builtin,
        [switch] $UseLinks
    )
    $CSSHeaders = New-GenericList -Type [string]

    if ($Builtin) {
        if ($UseLinks) {
            $Links = @(
                "https://cdn.datatables.net/v/dt/jq-3.3.1/dt-1.10.18/af-2.3.2/b-1.5.4/b-colvis-1.5.4/b-html5-1.5.4/b-print-1.5.4/cr-1.5.0/fc-3.2.5/fh-3.1.4/kt-2.5.0/r-2.2.2/rg-1.1.0/rr-1.2.4/sc-1.5.0/sl-1.2.6/datatables.min.css"
                "https://evotec.xyz/wp-content/uploads/pswritehtml/enlighterjs.min.css"
                "https://cdn.jsdelivr.net/npm/tui-grid@3.5.0/dist/tui-grid.css"
                "https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.4/css/bulma.min.css"
            )
            foreach ($Link in $Links) {
                [string] $HTMLLink = '<link rel="stylesheet" type="text/css" href="**Link**"/>'.Replace('**Link**', $Link)
                $CSSHeaders.Add($HTMLLink)
                $CSSHeaders.Add("`r`n")
            }
            return $CSSHeaders

        } else {
            $CSSPath = "$PSScriptRoot\..\Resources\CSS\StylesAlways"
        }
    } else {
        if ([String]::IsNullOrEmpty($CSSPath)) {
            $CSSPath = "$PSScriptRoot\..\Resources\CSS\Styles"
        }
    }
    Write-Verbose "Retrieving *.css from $CSSPath"

    $CSSFiles = @((get-childitem $CSSPath -Filter '*.css' -Recurse))
    if (-not $Builtin) {
        # By builtin we mean CSS that is part of JS Packages. This is limiting choice to single CSS to make sure reports look properly
        $CSSFiles =	$CSSFiles | Where-Object { $_.BaseName -eq $CSSName }
    }


    foreach ($CssFile in $CSSFiles) {
        $CSSHeaders.Add('<style type="text/css">')
        $CSSHeaders.Add("`r`n")
        if ($CssFile -like '*.min.*') {
            Write-Verbose "Generating Style Header from - $($CssFile.FullName) (minified file)"
            $CSSHeaders.Add((Get-Content -Path $CssFile.FullName))
        } else {
            Write-Verbose "Generating Style Header from - $($CssFile.FullName) (from non-minified file (adding delimiter))"
            $CSSHeaders.Add((Get-Content -Path $CssFile.FullName -Delimiter "`r`n"))
        }
        $CSSHeaders.Add("</style>")
        $CSSHeaders.Add("`r`n")

    }
    Write-Output $CSSHeaders
}