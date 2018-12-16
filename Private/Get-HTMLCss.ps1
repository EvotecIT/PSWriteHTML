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
        [Parameter(Mandatory = $false)]
        [String]
        $CSSPath,
        [Parameter(Mandatory = $false)]
        [String]
        $CSSName,

        [switch] $Builtin
    )

    if ($Builtin) {
        $CSSPath = "$PSScriptRoot\..\Resources\CSS\StylesAlways"

    } else {
        if ([String]::IsNullOrEmpty($CSSPath)) {
            $CSSPath = "$PSScriptRoot\..\Resources\CSS\Styles"
        }
    }
    Write-Verbose "Retrieving *.css from $CSSPath"


    $CSSFiles = @((get-childitem $CSSPath -Filter '*.css'))

    if (-not $Builtin) {
        $CssFiles =	$CSSFiles | Where-Object { $_.BaseName -eq $CSSName }
    }
    #if ([string]::IsNullOrEmpty($CSSName))
    #{
    #		Write-Verbose "CSS - 2Load $($CssFiles -join ',') "
    #		Write-Output $CSSFiles
    #	}
    #	Else
    #	{
    #		Write-Verbose "CSS - 1Load $($CSSFiles | ? {$_.basename -eq $CSSName}).fullname) "
    #		get-content ($CSSFiles | ? {$_.basename -eq $CSSName}).fullname

    #	}
    $CSSHeaders = @()
    foreach ($CssFile in $CSSFiles) {
        #$CSSHeaders += "`r`n" + '<script type="text/javascript">  '+ "`r`n"
        $CSSHeaders += '<style type="text/css">'
        if ($CssFile -like '*.min.*') {
            Write-Verbose "Generating Style Header from - $($CssFile.FullName) (minified file)"

            $CSSHeaders += Get-Content -Path $CssFile.FullName #-Delimiter "`r`n"

        } else {
            Write-Verbose "Generating Style Header from - $($CssFile.FullName) (from non-minified file (adding delimiter))"
            $CSSHeaders += Get-Content -Path $CssFile.FullName -Delimiter "`r`n"
        }
        $CSSHeaders += '</style>'
        #$CSSHeaders += '</script> '
    }
    Write-Output $CSSHeaders



    #get-content ($CSSFiles | ? {$_.name -eq "$CSSName.css"}).fullname | ForEach-Object{$StyleHeaderContent  += "`r`n" + $_  }
}