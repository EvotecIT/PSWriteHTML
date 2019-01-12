Function New-HtmlPage {
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
    Begin {}
    Process {
        $HTML = "<HTML>"
        $HTML += Add-HTMLHead -UseStyleLinks:$UseStyleLinks -UseCssLinks:$UseCssLinks -TitleText $TitleText -AddAuthor $AddAuthor -HideTitle:$HideTitle
        $HTML += "<BODY>"
        $HTML += Invoke-Command -ScriptBlock $HtmlData
        $HTML += Get-JavaScript -FilePath "$PSScriptRoot\..\Resources\JS\Additional\LoadEnlighter.js"
        $HTML += "</BODY>"
    }
    End {
        $HTML += "</HTML>"
        return $HTML
    }
}