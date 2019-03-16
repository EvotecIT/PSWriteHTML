Function New-HTML {
    [CmdletBinding()]
    param(
        [Parameter(Position = 0)][ValidateNotNull()][ScriptBlock] $HtmlData = $(Throw "Have you put the open curly brace on the next line?"),
        [switch] $UseCssLinks,
        [switch] $UseJavaScriptLinks,
        [String] $TitleText,
        [String] $ColorSchemePath,
        [string] $PrimaryColorHex,
        [string] $Author,
        [string] $DateFormat = 'yyyy-MM-dd HH:mm:ss'
    )

    [string] $CurrentDate = (Get-Date).ToString($DateFormat)

    <#
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
    #>
    $Script:HTMLSchema = @{
        TabsHeaders = [System.Collections.Generic.List[HashTable]]::new() # tracks / stores headers
        Features    = @{} # tracks features for CSS/JS implementation
    }
    $OutputHTML = Invoke-Command -ScriptBlock $HtmlData
    $Features = Get-FeaturesInUse

    '<!DOCTYPE html>'
    New-HTMLTag -Tag 'html' {
        '<!-- HEADER -->'
        New-HTMLTag -Tag 'head' {
            New-HTMLTag -Tag 'meta' -Attributes @{ charset = "utf-8" } -SelfClosing
            New-HTMLTag -Tag 'meta' -Attributes @{ name = 'viewport'; content = 'width=device-width, initial-scale=1' } -SelfClosing
            New-HTMLTag -Tag 'meta' -Attributes @{ name = 'author'; content = $Author } -SelfClosing
            New-HTMLTag -Tag 'meta' -Attributes @{ name = 'revised'; content = $CurrentDate } -SelfClosing
            New-HTMLTag -Tag 'title' { $TitleText }          

            Get-Resources -UseCssLinks:$true -UseJavaScriptLinks:$true -Location 'HeaderAlways' -Features Default, Fonts, FontsAwesome
            Get-Resources -UseCssLinks:$false -UseJavaScriptLinks:$false -Location 'HeaderAlways' -Features Default
            if ($null -ne $Features) {
                Get-Resources -UseCssLinks:$true -UseJavaScriptLinks:$true -Location 'HeaderAlways' -Features $Features
                Get-Resources -UseCssLinks:$false -UseJavaScriptLinks:$false -Location 'HeaderAlways' -Features $Features
                Get-Resources -UseCssLinks:$UseCssLinks -UseJavaScriptLinks:$UseJavaScriptLinks -Location 'Header' -Features $Features
            }
        }
        '<!-- END HEADER -->'
        '<!-- BODY -->'
        #'<body onload="hide();">'       
        New-HTMLTag -Tag 'body' {
            
            if ($HideLogos -eq $false) {
                $Leftlogo = $Options.Logos[$LeftLogoName]
                $Rightlogo = $Options.Logos[$RightLogoName]
                $LogoContent = @"
                <table><tbody>
                <tr>
                    <td class="clientlogo"><img src="$Leftlogo" /></td>
                    <td class="MainLogo"><img src="$Rightlogo" /></td>
                </tr>
                </tbody></table>
"@
                $LogoContent
            }         
            <# Not sure what for 
            if (!([string]::IsNullOrEmpty($PrimaryColorHex))) {
                if ($PrimaryColorHex.Length -eq 7) {
                    $HTML = $HTML -replace '#337E94', $PrimaryColorHex
                } else {
                    Write-Warning '$PrimaryColorHex must be 7 characters with hash eg "#337E94"'
                }
            }
            #> 
            
            if ($Script:HTMLSchema.TabsHeaders) {
                New-HTMLTabHead
            }
            $OutputHTML
            '<!-- FOOTER -->'
            New-HTMLTag -Tag 'footer' {  
                if ($null -ne $Features) {
                    # FooterAlways means we're not able to provide consistent output with and without links and we prefer those to be included 
                    # either as links or from file per required features
                    Get-Resources -UseCssLinks:$true -UseJavaScriptLinks:$true -Location 'FooterAlways' -Features $Features
                    Get-Resources -UseCssLinks:$false -UseJavaScriptLinks:$false -Location 'FooterAlways' -Features $Features
                    # standard footer features
                    Get-Resources -UseCssLinks:$UseCssLinks -UseJavaScriptLinks:$UseJavaScriptLinks -Location 'Footer' -Features $Features      
                }  
            }
            '<!-- END FOOTER -->'
        }
        '<!-- END BODY -->'
    }     
}