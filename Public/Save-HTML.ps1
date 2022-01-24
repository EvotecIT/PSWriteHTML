Function Save-HTML {
    <#
    .SYNOPSIS
    Saves HTML (text) to a file. Can be used with conjucncton with New-HTML.

    .DESCRIPTION
    Saves HTML (text) to a file. Can be used with conjucncton with New-HTML, although New-HTML has Save-HTML built-in already when providing FilePath parameter.

    .PARAMETER FilePath
    Provides the path to the file to be created.

    .PARAMETER HTML
    HTML (text) to be saved.

    .PARAMETER ShowHTML
    Opens HTML in browser when generating of HTML is done. When no filepath is provided it uses temporary path instead. Good for testing.

    .PARAMETER Encoding
    Provides ability to choose encoding of the HTML file. Not really required to use, as UTF8 is the default. Options available: 'Unknown', 'String', 'Unicode', 'Byte', 'BigEndianUnicode', 'UTF8', 'UTF7', 'UTF32', 'Ascii', 'Default', 'Oem', 'BigEndianUTF32'

    .PARAMETER Suppress
    If Suppress is used then no output is shown. If Suppress is set to false then FilePath is returned.

    .PARAMETER Format
    Formats HTML output (including CSS/JS). Requires PSParseHTML to be installed and available.

    .PARAMETER Minify
    Minifies HTML output (including CSS/JS). Requires PSParseHTML to be installed and available.

    .EXAMPLE
    $Company = 'Evotec'

    $Text = @"
    This email is from Evotec. It may contain confidential information. It is intended for the addressee only and may not be copied or disclosed to any third party without our permission. If you are not the intended recipient please contact the sender as soon as possible and delete the material from any computer. If this email has been sent as a personal message to the addressee, the sender is not acting in his/her capacity as an employee or officer of $Company Limited and no liability is accepted for the content of any such email. Outgoing email may be monitored for the purpose of ensuring compliance with our email policy and relevant laws
    "@

    $HTML = New-HTMLText -FontSize 10 -FontFamily 'Source Sans Pro' -Text $Text
    Save-HTML -FilePath $PSScriptRoot\Disclaimer.html -HTML $HTML -ShowHTML

    .EXAMPLE
    $Test = EmailBody {
        EmailText -LineBreak
        EmailText -Text 'Z poważaniem' -FontSize 8pt -FontFamily 'Verdana,sans-serif' -Color Gray -LineBreak
        EmailText -Text $DisplayName -FontSize 8pt -FontFamily 'Verdana,sans-serif' -Color Gray
        EmailText -Text $Title -FontSize 8pt -FontFamily 'Verdana,sans-serif' -Color Gray
        EmailText -Text $Department -FontSize 8pt -FontFamily 'Verdana,sans-serif' -Color Gray
        EmailText -LineBreak
        if ($Mobile) {
            EmailText -Text "m: $Mobile" -FontSize 8pt -FontFamily 'Verdana,sans-serif' -Color Gray
        }
        EmailText -Text "e: $Email" -FontSize 8pt -FontFamily 'Verdana,sans-serif' -Color Gray
        EmailText -LineBreak
        EmailText -Text $CompanyName -FontSize 8pt -FontFamily 'Verdana,sans-serif' -Color Gray
        EmailText -Text $StreetAddress -FontSize 8pt -FontFamily 'Verdana,sans-serif' -Color Gray
        EmailText -Text "$PostalCode $City" -FontSize 8pt -FontFamily 'Verdana,sans-serif' -Color Gray
        EmailText -LineBreak
        EmailText -Text "[www.aliorleasing.pl](https://www.aliorleasing.pl)" -FontSize 8pt -FontFamily 'Verdana,sans-serif' -Color Gray
        EmailText -LineBreak
        EmailLayoutRow {
            EmailLayoutColumn {
                EmailImage -Source 'https://aliorleasing.pl/images/logoAL2.jpg' -UrlLink '' -AlternativeText 'Alior Leasing Logo' -Width '134' -Inline -Height '90'
            }
            EmailLayoutColumn {

            }
            EmailLayoutColumn {
                EmailImage -Source 'https://aliorleasing.pl/images/akcia-nnw.jpg' -UrlLink '' -AlternativeText 'Alior Leasing Logo' -Width '300' -Inline -Height '90'
            }
        }
        EmailText -LineBreak
        EmailText -FontWeight bold, normal -FontSize 8pt -FontFamily 'Verdana,sans-serif' -Color Gray -Text "Alior Leasing", `
            " Spółka z ograniczoną odpowiedzialnością z siedzibą w Warszawie, ul. Łopuszańska 38D, 02-232 Warszawa, wpisana do rejestru przedsiębiorców Krajowego Rejestru Sądowego pod numerem KRS: 0000554171, której dokumentacja przechowywana jest w Sądzie Rejonowym dla M. St. Warszawy w Warszawie, XIV Wydział Gospodarczy Krajowego Rejestru Sądowego, NIP: 5223027866, REGON: 361335353, o kapitale zakładowym i wpłaconym: 15 009 000,00 PLN."
        EmailText -LineBreak
    }

    Save-HTML -FilePath $PSScriptRoot\Output\TestBody2.html -ShowHTML -HTML $Test

    .NOTES
    General notes
    #>
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $false)][string]$FilePath,
        [Parameter(Mandatory = $true)][string] $HTML,
        [alias('Show', 'Open')][Parameter(Mandatory = $false)][switch]$ShowHTML,
        [ValidateSet('Unknown', 'String', 'Unicode', 'Byte', 'BigEndianUnicode', 'UTF8', 'UTF7', 'UTF32', 'Ascii', 'Default', 'Oem', 'BigEndianUTF32')] $Encoding = 'UTF8',
        [alias('Supress')][bool] $Suppress = $true,
        [switch] $Format,
        [switch] $Minify
    )
    if ([string]::IsNullOrEmpty($FilePath)) {
        $FilePath = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), "$($([System.IO.Path]::GetRandomFileName()).Split('.')[0]).html")
        Write-Verbose "Save-HTML - FilePath parameter is empty, using Temporary $FilePath"
    } else {
        if (Test-Path -LiteralPath $FilePath) {
            Write-Verbose "Save-HTML - Path $FilePath already exists. Report will be overwritten."
        }
    }
    Write-Verbose "Save-HTML - Saving HTML to file $FilePath"

    if ($Format -or $Minify) {
        $Commands = Get-Command -Name 'Format-HTML' -ErrorAction SilentlyContinue
        if ($Commands -and $Commands.Source -eq 'PSParseHTML') {
            if ($Format) {
                $HTML = Format-HTML -Content $HTML
            }
            if ($Minify) {
                $HTML = Optimize-HTML -Content $HTML
            }
        } else {
            Write-Warning "Save-HTML - Minify or Format functionality requires PSParseHTML module. Please install it using Install-Module PSParseHTML -Force."
        }
    }
    try {
        $HTML | Set-Content -LiteralPath $FilePath -Force -Encoding $Encoding -ErrorAction Stop
        if (-not $Suppress) {
            $FilePath
        }
    } catch {
        $ErrorMessage = $_.Exception.Message -replace "`n", " " -replace "`r", " "
        $FilePath = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), "$($([System.IO.Path]::GetRandomFileName()).Split('.')[0]).html")
        Write-Warning "Save-HTML - Failed with error: $ErrorMessage"
        Write-Warning "Save-HTML - Saving HTML to file $FilePath"
        try {
            $HTML | Set-Content -LiteralPath $FilePath -Force -Encoding $Encoding -ErrorAction Stop
        } catch {
            $ErrorMessage = $_.Exception.Message -replace "`n", " " -replace "`r", " "
            Write-Warning "Save-HTML - Failed with error: $ErrorMessage`nPlease define a different path for the `'-FilePath`' parameter."
        }
    }
    if ($ShowHTML) {
        try {
            Invoke-Item -LiteralPath $FilePath -ErrorAction Stop
        } catch {
            $ErrorMessage = $_.Exception.Message -replace "`n", " " -replace "`r", " "
            Write-Verbose "Save-HTML - couldn't open file $FilePath in a browser. Error: $ErrorMessage"
        }
    }
}