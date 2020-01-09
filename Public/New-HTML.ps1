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
        [ValidateSet('Unknown', 'String', 'Unicode', 'Byte', 'BigEndianUnicode', 'UTF8', 'UTF7', 'UTF32', 'Ascii', 'Default', 'Oem', 'BigEndianUTF32')] $Encoding = 'UTF8',
        [Uri] $FavIcon
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

    $HeaderHTML = @()
    #$MainHTML = @()
    $FooterHTML = @()


    $MainHTML = foreach ($_ in $TempOutputHTML) {
        if ($_ -is [PSCustomObject]) {
            if ($_.Type -eq 'Footer') {
                $FooterHTML = $_.Output
            } elseif ($_.Type -eq 'Header') {
                $HeaderHTML = $_.Output
            } else {
                if ($_.Output) {
                            # this gets rid of any non-strings
        # it's added here to track nested tabs
                    if ($_.Output -isnot [System.Collections.IDictionary]) {
                        $_.Output
                    }
                }
            }
        } else {
                    # this gets rid of any non-strings
        # it's added here to track nested tabs
            if ($_ -isnot [System.Collections.IDictionary]) {
                $_
            }
        }
    }
    <#
    if ($MainHTML.Count -eq 0) {
        # this gets rid of any non-strings
        # it's added here to track nested tabs
        $MainHTML = foreach ($_ in $MainHTML) {
            if ($_ -isnot [System.Collections.IDictionary]) {
                $_
            }
        }
    } else {
        $MainHTML = foreach ($_ in $MainHTML) {
            if ($_ -isnot [System.Collections.IDictionary]) {
                $_
            }
        }
    }
    #>

    $Features = Get-FeaturesInUse -PriorityFeatures 'JQuery', 'DataTables', 'Tabs'


    # This removes Nested Tabs from primary Tabs
    foreach ($_ in $Script:HTMLSchema.TabsHeadersNested) {
        $null = $Script:HTMLSchema.TabsHeaders.Remove($_)
    }


    $HTML = @(
        '<!DOCTYPE html>'
        #"<!-- saved from url=(0016)http://localhost -->" + "`r`n"
        '<!-- saved from url=(0014)about:internet -->'
        New-HTMLTag -Tag 'html' {
            '<!-- HEAD -->'
            New-HTMLTag -Tag 'head' {
                New-HTMLTag -Tag 'meta' -Attributes @{ charset = "utf-8" } -SelfClosing
                #New-HTMLTag -Tag 'meta' -Attributes @{ 'http-equiv' = 'X-UA-Compatible'; content = 'IE=8' } -SelfClosing
                New-HTMLTag -Tag 'meta' -Attributes @{ name = 'viewport'; content = 'width=device-width, initial-scale=1' } -SelfClosing
                New-HTMLTag -Tag 'meta' -Attributes @{ name = 'author'; content = $Author } -SelfClosing
                New-HTMLTag -Tag 'meta' -Attributes @{ name = 'revised'; content = $CurrentDate } -SelfClosing
                New-HTMLTag -Tag 'title' { $TitleText }
                
                if($null -ne $FavIcon){
                    $Extension = [System.IO.Path]::GetExtension($FavIcon)
                    if ($Extension -in @('.png', '.jpg', 'jpeg', '.svg', '.ico')) {
                        switch($FavIcon.Scheme){
                            "file" {
                                if(Test-Path -Path $FavIcon.OriginalString){
                                    $FavIcon = Get-Item -Path $FavIcon.OriginalString
                                    $FavIconImageBinary = Convert-ImageToBinary -ImageFile $FavIcon
                                    New-HTMLTag -Tag 'link' -Attributes @{rel = 'icon'; href = "$FavIconImageBinary"; type = 'image/x-icon'}
                                }
                                else{
                                    Write-Warning -Message "The path to the FavIcon image could not be resolved."
                                }
                            }
                            "https" {
                                $FavIcon = $FavIcon.OriginalString
                                New-HTMLTag -Tag 'link' -Attributes @{rel = 'icon'; href = "$FavIcon"; type = 'image/x-icon'}
                            }
                            default {
                                Write-Warning -Message "The path to the FavIcon image could not be resolved."
                            }
                        }   
                    }
                    else{
                        Write-Warning -Message "File extension `'$Extension`' is not supported as a FavIcon image.`nPlease use images with these extensions: '.png', '.jpg', 'jpeg', '.svg', '.ico'"
                    }
                }
                
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
            '<!-- END HEAD -->'
            '<!-- BODY -->'
            New-HTMLTag -Tag 'body' {
                '<!-- HEADER -->'
                New-HTMLTag -Tag 'header' {
                    if ($HeaderHTML) {
                        $HeaderHTML
                    }
                }
                '<!-- END HEADER -->'
                # Add logo if there is one
                $Script:HTMLSchema.Logos
                # Add tabs header if there is one
                if ($Script:HTMLSchema.TabsHeaders) {
                    New-HTMLTabHead
                    New-HTMLTag -Tag 'div' -Attributes @{ 'data-panes' = 'true' } {
                        # Add remaining data
                        #$OutputHTML
                        $MainHTML
                    }
                } else {
                    # Add remaining data
                    $MainHTML
                    #$OutputHTML
                }
                # Add charts scripts if those are there
                foreach ($Chart in $Script:HTMLSchema.Charts) {
                    $Chart
                }
                foreach ($Diagram in $Script:HTMLSchema.Diagrams) {
                    $Diagram
                }

                New-HTMLTag -Tag 'footer' {
                    '<!-- FOOTER -->'
                    if ($FooterHTML) {
                        $FooterHTML
                    }
                    #New-HTMLTag -Tag 'footer' {
                    if ($null -ne $Features) {
                        # FooterAlways means we're not able to provide consistent output with and without links and we prefer those to be included
                        # either as links or from file per required features
                        Get-Resources -UseCssLinks:$true -UseJavaScriptLinks:$true -Location 'FooterAlways' -Features $Features
                        Get-Resources -UseCssLinks:$false -UseJavaScriptLinks:$false -Location 'FooterAlways' -Features $Features
                        # standard footer features
                        Get-Resources -UseCssLinks:$UseCssLinks -UseJavaScriptLinks:$UseJavaScriptLinks -Location 'Footer' -Features $Features
                    }
                    '<!-- END FOOTER -->'
                }
                '<!-- END BODY -->'
            }

        }
    )
    if ($FilePath -ne '') {
        Save-HTML -HTML $HTML -FilePath $FilePath -ShowHTML:$ShowHTML -Encoding $Encoding
    } else {
        $HTML
    }
}
