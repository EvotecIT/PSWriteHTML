Function New-HTML {
    [CmdletBinding()]
    param(
        [Parameter(Position = 0)][ValidateNotNull()][ScriptBlock] $HtmlData = $(Throw "Have you put the open curly brace on the next line?"),
        [switch] $UseCssLinks,
        [switch] $UseJavaScriptLinks,
        [String] $TitleText,
        [string] $Author,
        [string] $DateFormat = 'yyyy-MM-dd HH:mm:ss',
        [int] $AutoRefresh,
        # save HTML options
        [Parameter(Mandatory = $false)][string]$FilePath,
        [Parameter(Mandatory = $false)][switch]$ShowHTML,
        [ValidateSet('Unknown', 'String', 'Unicode', 'Byte', 'BigEndianUnicode', 'UTF8', 'UTF7', 'UTF32', 'Ascii', 'Default', 'Oem', 'BigEndianUTF32')] $Encoding = 'UTF8'
    )
    [string] $CurrentDate = (Get-Date).ToString($DateFormat)
    $Script:HTMLSchema = @{
        TabsHeaders = [System.Collections.Generic.List[HashTable]]::new() # tracks / stores headers
        Features    = @{} # tracks features for CSS/JS implementation
        Charts      = [System.Collections.Generic.List[string]]::new()
    }
    $OutputHTML = Invoke-Command -ScriptBlock $HtmlData
    if ($null -ne $OutputHTML -and $OutputHTML.Count -gt 0) {
        $Logo = Get-HTMLPartContent -Content $OutputHTML -Start '<!-- START LOGO -->' -End '<!-- END LOGO -->' -Type Between
        $OutputHTML = Get-HTMLPartContent -Content $OutputHTML -Start '<!-- START LOGO -->' -End '<!-- END LOGO -->' -Type After
    }
    $Features = Get-FeaturesInUse

    $HTML = @(
        '<!DOCTYPE html>'
        New-HTMLTag -Tag 'html' {
            '<!-- HEADER -->'
            New-HTMLTag -Tag 'head' {
                New-HTMLTag -Tag 'meta' -Attributes @{ charset = "utf-8" } -SelfClosing
                New-HTMLTag -Tag 'meta' -Attributes @{ name = 'viewport'; content = 'width=device-width, initial-scale=1' } -SelfClosing
                New-HTMLTag -Tag 'meta' -Attributes @{ name = 'author'; content = $Author } -SelfClosing
                New-HTMLTag -Tag 'meta' -Attributes @{ name = 'revised'; content = $CurrentDate } -SelfClosing
                New-HTMLTag -Tag 'title' { $TitleText }
                if ($Autorefresh -gt 0) {
                    New-HTMLTag -Tag 'meta' -Attributes @{ 'http-equiv' = 'refresh'; content = $Autorefresh } -SelfClosing
                }
                Get-Resources -UseCssLinks:$true -UseJavaScriptLinks:$true -Location 'HeaderAlways' -Features Default, DefaultHeadings, Fonts, FontsAwesome
                Get-Resources -UseCssLinks:$false -UseJavaScriptLinks:$false -Location 'HeaderAlways' -Features Default, DefaultHeadings
                if ($null -ne $Features) {
                    Get-Resources -UseCssLinks:$true -UseJavaScriptLinks:$true -Location 'HeaderAlways' -Features $Features
                    Get-Resources -UseCssLinks:$false -UseJavaScriptLinks:$false -Location 'HeaderAlways' -Features $Features
                    Get-Resources -UseCssLinks:$true -UseJavaScriptLinks:$true -Location 'HeaderAlways' -Features $Features -NoScript
                    Get-Resources -UseCssLinks:$false -UseJavaScriptLinks:$false -Location 'HeaderAlways' -Features $Features -NoScript
                    Get-Resources -UseCssLinks:$UseCssLinks -UseJavaScriptLinks:$UseJavaScriptLinks -Location 'Header' -Features $Features
                }
            }
            '<!-- END HEADER -->'
            '<!-- BODY -->'
            New-HTMLTag -Tag 'body' {
                # Add logo if there is one
                $Logo
                # Add tabs header if there is one
                if ($Script:HTMLSchema.TabsHeaders) {
                    New-HTMLTabHead
                }
                # Add remaining data
                $OutputHTML
                # Add charts scripts if those are there
                foreach ($Chart in $Script:HTMLSchema.Charts) {
                    $Chart
                }
            }
            '<!-- END BODY -->'
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
    )
    if ($FilePath -ne '') {
        Save-HTML -HTML $HTML -FilePath $FilePath -ShowHTML:$ShowHTML -Encoding $Encoding
    } else {
        $HTML
    }
}