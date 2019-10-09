Function New-HTML {
    [alias('Dashboard')]
    [CmdletBinding()]
    param(
        [alias('Content')][Parameter(Position = 0)][ValidateNotNull()][ScriptBlock] $HtmlData = $(Throw "Have you put the open curly brace on the next line?"),
        [switch] $UseCssLinks,
        [switch] $UseJavaScriptLinks,
        [alias('Name', 'Title')][String] $TitleText,
        [string] $Author,
        [string] $DateFormat = 'yyyy-MM-dd HH:mm:ss',
        [int] $AutoRefresh,
        # save HTML options
        [Parameter(Mandatory = $false)][string]$FilePath,
        [alias('Show', 'Open')][Parameter(Mandatory = $false)][switch]$ShowHTML,
        [ValidateSet('Unknown', 'String', 'Unicode', 'Byte', 'BigEndianUnicode', 'UTF8', 'UTF7', 'UTF32', 'Ascii', 'Default', 'Oem', 'BigEndianUTF32')] $Encoding = 'UTF8'
    )
    [string] $CurrentDate = (Get-Date).ToString($DateFormat)
    $Script:HTMLSchema = @{
        TabsHeaders       = [System.Collections.Generic.List[System.Collections.IDictionary]]::new() # tracks / stores headers
        TabsHeadersNested = [System.Collections.Generic.List[System.Collections.IDictionary]]::new() # tracks / stores headers
        Features          = [ordered] @{ } # tracks features for CSS/JS implementation
        Charts            = [System.Collections.Generic.List[string]]::new()
        Diagrams          = [System.Collections.Generic.List[string]]::new()

        Logos             = ""
        # Tab settings
        TabOptions        = @{
            SlimTabs = $false
        }

        CustomCSS         = [System.Collections.Generic.List[Array]]::new()
    }

    [Array] $TempOutputHTML = Invoke-Command -ScriptBlock $HtmlData
    $Features = Get-FeaturesInUse -PriorityFeatures 'JQuery', 'DataTables', 'Tabs'
    # this gets rid of any non-strings
    # it's added here to track nested tabs
    $OutputHTML = foreach ($_ in $TempOutputHTML) {
        if ($_ -isnot [System.Collections.IDictionary]) {
            $_
        }
    }
    # This removes Nested Tabs from primary Tabs
    foreach ($_ in $Script:HTMLSchema.TabsHeadersNested) {
        $null = $Script:HTMLSchema.TabsHeaders.Remove($_)
    }


    $HTML = @(
        '<!DOCTYPE html>'
        #"<!-- saved from url=(0016)http://localhost -->" + "`r`n"
        New-HTMLTag -Tag 'html' {
            '<!-- HEADER -->'
            New-HTMLTag -Tag 'head' {
                New-HTMLTag -Tag 'meta' -Attributes @{ charset = "utf-8" } -SelfClosing
                #New-HTMLTag -Tag 'meta' -Attributes @{ 'http-equiv' = 'X-UA-Compatible'; content = 'IE=8' } -SelfClosing
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
                    Get-Resources -UseCssLinks:$true -UseJavaScriptLinks:$true -Location 'HeaderAlways' -Features $Features -NoScript
                    Get-Resources -UseCssLinks:$false -UseJavaScriptLinks:$false -Location 'HeaderAlways' -Features $Features -NoScript
                    Get-Resources -UseCssLinks:$UseCssLinks -UseJavaScriptLinks:$UseJavaScriptLinks -Location 'Header' -Features $Features
                }
            }

            New-HTMLCustomCSS -Css $Script:HTMLSchema.CustomCSS

            '<!-- END HEADER -->'
            '<!-- BODY -->'
            New-HTMLTag -Tag 'body' {
                # Add logo if there is one
                $Script:HTMLSchema.Logos
                # Add tabs header if there is one
                if ($Script:HTMLSchema.TabsHeaders) {
                    New-HTMLTabHead
                    New-HTMLTag -Tag 'div' -Attributes @{ 'data-panes' = 'true' } {
                        # Add remaining data
                        $OutputHTML
                    }
                } else {
                    # Add remaining data
                    $OutputHTML
                }
                # Add charts scripts if those are there
                foreach ($Chart in $Script:HTMLSchema.Charts) {
                    $Chart
                }
                foreach ($Diagram in $Script:HTMLSchema.Diagrams) {
                    $Diagram
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