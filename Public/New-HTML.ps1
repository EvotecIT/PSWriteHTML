Function New-Html {
    [CmdletBinding()]
    param(
        [Parameter(Position = 0)][ValidateNotNull()][ScriptBlock] $HtmlData = $(Throw "Have you put the open curly brace on the next line?"),
        [switch] $UseCssLinks,
        [switch] $UseStyleLinks,
        [String] $TitleText,
        [String] $CSSPath,
        [String] $CSSName = "default",
        [String] $ScriptPath,
        [String] $ColorSchemePath,
        [String] $LogoPath,
        [string] $LeftLogoName = "Sample",
        [string] $RightLogoName = "Alternate",
        [string] $LeftLogoString,
        [string] $RightLogoString,
        [switch] $HideLogos,
        [switch] $HideTitle,
        [switch] $NoScript,
        [string] $PrimaryColorHex,
        [switch] $AddAuthor,
        [string] $Author,
        [switch] $HideDate,
        [string] $DateFormat = 'yyyy-MM-dd HH:mm:ss',
        [String] $FooterText
    )
    Begin {
        [string] $CurrentDate = (Get-Date).ToString($DateFormat)

        $Options = New-HTMLReportOptions `
            -RightLogoName $RightLogoName `
            -LeftLogoName LeftLogoName  `
            -LeftLogoString $LeftLogoString `
            -RightLogoString $RightLogoString `
            -CSSName $CSSName `
            -CSSPath $CSSPath `
            -ScriptPath $ScriptPath `
            -ColorSchemePath $ColorSchemePath `
            -UseCssLinks:$UseCssLinks `
            -UseStyleLinks:$UseStyleLinks

    }
    Process {
        $HTML = "<HTML>"
        $HTML += Add-HTMLHead `
            -Options $Options `
            -UseStyleLinks:$UseStyleLinks `
            -UseCssLinks:$UseCssLinks `
            -TitleText $TitleText `
            -AddAuthor:$AddAuthor `
            -HideTitle:$HideTitle
        $HTML += Add-HTMLBodyOpening -Options $Options -TitleText $TitleText -HideLogos:$HideLogos -HideTitle:$HideTitle -HideDate:$HideDate -PrimaryColorHex $PrimaryColorHex -CurrentDate $CurrentDate
        $HTML += Invoke-Command -ScriptBlock $HtmlData
        $HTML += Get-JavaScript -FilePath "$PSScriptRoot\..\Resources\JS\Additional\LoadEnlighter.js"

    }
    End {
        $HTML += "</BODY>"
        if ($null -ne $FooterText) {
            $FooterText = "Copyright &#169; $([DateTime]::Now.Year). All Rights Reserved."
        }
      #  $HTML += Add-HTMLHorizontalLine
        $HTML += @"
        <!-- FOOTER -->
        <div class="footer">$FooterText</div>
        <!-- END BODY -->
"@

        $HTML += "</HTML>"
        return $HTML
    }
}