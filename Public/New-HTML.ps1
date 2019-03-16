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

            #   "<!-- STYLES -->"       
            <#
            $Options.StyleContent
            #New-HTMLResourceCSS -FilePath "$PSScriptRoot\..\Resources\CSS\Styles\timeline.css" -ResourceComment 'Timeline'
            #New-HTMLResourceCSS -FilePath "$PSScriptRoot\..\Resources\CSS\Styles\timeline-ygc.css" -ResourceComment 'Timeline YGC'
            #New-HTMLResourceCSS -FilePath "$PSScriptRoot\..\Resources\CSS\Styles\timeline-scrible.css" -ResourceComment 'Timeline Scrible'
            New-HTMLResourceCSS -FilePath "$PSScriptRoot\..\Resources\CSS\Styles\timeline-simple.css" -ResourceComment 'Timeline Simple'
            #New-HTMLResourceCSS -FilePath "$PSScriptRoot\..\Resources\CSS\Styles\skeleton-tabs.css" -ResourceComment 'Skeleton Tabs'
            #New-HTMLResourceCSS -FilePath "$PSScriptRoot\..\Resources\CSS\Styles\skeleton.css" -ResourceComment 'Skeleton'
            New-HTMLResourceCSS -FilePath "$PSScriptRoot\..\Resources\CSS\Styles\status.css" -ResourceComment 'Status Buttonical'
            #New-HTMLResourceCSS -FilePath "$PSScriptRoot\..\Resources\CSS\Styles\message.css" -ResourceComment 'Message Notifications'
            New-HTMLResourceCSS -FilePath "$PSScriptRoot\..\Resources\CSS\Styles\toasts.css" -ResourceComment 'Toast Notifications'
            New-HTMLResourceCSS -FilePath "$PSScriptRoot\..\Resources\CSS\Styles\tabs-elastic.css" -ResourceComment 'Tabs'


            #>

            Get-Resources -UseCssLinks:$true -UseJavaScriptLinks:$true -Location 'HeaderAlways' -Features Default, Fonts, FontsAwesome
            Get-Resources -UseCssLinks:$false -UseJavaScriptLinks:$false -Location 'HeaderAlways' -Features Default
            if ($null -ne $Features) {
                Get-Resources -UseCssLinks:$true -UseJavaScriptLinks:$true -Location 'HeaderAlways' -Features $Features
                Get-Resources -UseCssLinks:$false -UseJavaScriptLinks:$false -Location 'HeaderAlways' -Features $Features
                Get-Resources -UseCssLinks:$UseCssLinks -UseJavaScriptLinks:$UseJavaScriptLinks -Location 'Header' -Features $Features
            }
            # '<!-- END STYLES -->'
            # '<!-- SCRIPTS -->'
            # $Options.ScriptContent
            # '<!-- END SCRIPTS -->'
        }
        '<!-- END HEADER -->'
        '<!-- BODY -->'
        #'<body onload="hide();">'       
        New-HTMLTag -Tag 'body' {
            #Add-HTMLBodyOpening -Options $Options -TitleText $TitleText -HideLogos:$HideLogos -HideTitle:$HideTitle -HideDate:$HideDate -PrimaryColorHex $PrimaryColorHex -CurrentDate $CurrentDate
            
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
            #if (-not $HideDate) {
            #    New-HTMLTag -Tag 'div' -Attributes @{ class = 'ReportCreated' } -Value { "Report created on $($CurrentDate)" }
            #}

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
                #New-HTMLTag -Tag 'div' -Attributes @{ class = 'defaultFooter' } {
                #    if ($null -ne $FooterText) {
                #        $FooterText = "Copyright &#169; $([DateTime]::Now.Year). All Rights Reserved."
                #    }
                #    $FooterText
                #}    
                <#           
                New-HTMLResourceJS {

                    @'   
                    // INIT CODE - simple page-wide initialization based on css selectors
                    // - highlight all pre + code tags (CSS3 selectors)
                    // - use javascript as default language
                    // - use theme "enlighter" as default theme
                    // - replace tabs with 2 spaces
                    EnlighterJS.init("pre", "code", {
                            language: "powershell",
                            theme: "enlighter",
                            indent: 2
                        });
'@
                }   
                #>    
                if ($null -ne $Features) {
                    # FooterAlways means we're not able to provide consistent output with and without links and we prefer those to be included 
                    # either as links or from file per required features
                    Get-Resources -UseCssLinks:$true -UseJavaScriptLinks:$true -Location 'FooterAlways' -Features $Features
                    Get-Resources -UseCssLinks:$false -UseJavaScriptLinks:$false -Location 'FooterAlways' -Features $Features
                    # standard footer features
                    Get-Resources -UseCssLinks:$UseCssLinks -UseJavaScriptLinks:$UseJavaScriptLinks -Location 'Footer' -Features $Features      
                }  
            }
            #Get-JavaScript -FilePath "$PSScriptRoot\..\Resources\JS\Other\tabs-elastic.js"
            '<!-- END FOOTER -->'
        }
        '<!-- END BODY -->'
    }     
}