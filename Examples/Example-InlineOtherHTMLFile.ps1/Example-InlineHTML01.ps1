Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {
    New-HTMLSection {
        New-HTMLFrame -SourcePath "$PSSCriptRoot\GPOZaurr.html" -Scrolling Auto
    } -HeaderText 'Test'
    New-HTMLSection {
        New-HTMLFrame -SourcePath "$PSSCriptRoot\GPOZaurr.html" -Scrolling Auto -Height 1500px
    } -HeaderText 'Test'
    New-HTMLSection {
        New-HTMLFrame -SourcePath "C:\Support\GitHub\PSWriteHTML\Examples\Example-Maps\Example-Maps.html"
    } -HeaderText 'Test' -Height 100vh
} -Online -TitleText 'Test Inline' -ShowHTML -FilePath "$PSScriptRoot\Example-InlineHTML01.html" -AddComment


# Modify file
return

function Set-HTMLInline {
    [CmdletBinding()]
    param(
        [string] $FilePath,
        [string] $Search,
        [string] $Replace
    )
    if ($FilePath -and (Test-Path -LiteralPath $FilePath)) {

        # lets get current information about file
        $File = Get-Item -LiteralPath $FilePath

        $LastModified = $File.LastWriteTime

        $FileContent = Get-Content -Raw -LiteralPath $FilePath
        if ($FileContent -notlike $Search) {

        }
        Set-Content -LiteralPath $FilePath -Value $FileContent
        # <script type="text/javascript" src="https://cdn.jsdelivr.net/gh/davidjbradshaw/iframe-resizer@4.3.2/js/iframeResizer.contentWindow.min.js"></script>

        # replace modification date:
        $file.LastWriteTime = $lastModified
    }
}

Set-HTMLInline -FilePath 'C:\Support\GitHub\PSWriteHTML\Examples\Example-InlineOtherHTMLFile.ps1\GPOZaurr.html' -Search 'iframeResizer.contentWindow.min.js' -Replace '<script type="text/javascript" src="https://cdn.jsdelivr.net/gh/davidjbradshaw/iframe-resizer@4.3.2/js/iframeResizer.contentWindow.min.js"></script>'