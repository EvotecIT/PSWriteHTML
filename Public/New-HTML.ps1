Function New-HTML {
    <#
    .SYNOPSIS
    Building block for creating HTML elements. A starting point for all other cmdlets in PSWriteHTML except Out-HtmlView.

    .DESCRIPTION
    Building block for creating HTML elements. A starting point for all other cmdlets in PSWriteHTML except Out-HtmlView.

    .PARAMETER HtmlData
    Provides ability to specify one or more elements within HTML. Using New-HTML without it, makes no larger sense.

    .PARAMETER Online
    Enables or Disables linking of CSS/JS. When Online is enabled that means that the CSS/JS files are loaded from the CDN. When Online is disabled that means that the CSS/JS files are all loaded from same HTML file (making it very large).

    .PARAMETER TitleText
    Title of the HTML page

    .PARAMETER Author
    Defines the author information in the HTML file (meta information). If not specified, the author information is skipped.

    .PARAMETER DateFormat
    Defines the date format in the HTML file (meta information). Default is 'yyyy-MM-dd HH:mm:ss'

    .PARAMETER AutoRefresh
    Defines if the page should be refreshed automatically every X seconds.

    .PARAMETER FilePath
    Provides the path to the file to be created.

    .PARAMETER ShowHTML
    Opens HTML in browser when generating of HTML is done. When no filepath is provided it uses temporary path instead. Good for testing.

    .PARAMETER Encoding
    Provides ability to choose encoding of the HTML file. Not really required to use, as UTF8 is the default. Options available: 'Unknown', 'String', 'Unicode', 'Byte', 'BigEndianUnicode', 'UTF8', 'UTF7', 'UTF32', 'Ascii', 'Default', 'Oem', 'BigEndianUTF32'

    .PARAMETER FavIcon
    Provides ability to add a favicon to the HTML page. Can be a link or file path

    .PARAMETER Temporary
    Forces use of temporary file name. Doesn't work with -FilePath parameter.

    .PARAMETER AddComment
    Adds additional commands to the generated HTML file. This is useful for tracking or knowing what is what.

    .PARAMETER Format
    Formats HTML output (including CSS/JS). Requires PSParseHTML to be installed and available.

    .PARAMETER Minify
    Minifies HTML output (including CSS/JS). Requires PSParseHTML to be installed and available.

    .EXAMPLE
    New-HTML {
        New-HTMLSection -HeaderText 'Donut Charts - Defaults' -CanCollapse {
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartToolbar -Download
                    #New-ChartBarOptions -Gradient
                    New-ChartLegend -Name 'Time', 'Money', 'Taxes', 'test'
                    New-ChartBar -Name 'Test' -Value 1, 2, 3, 0
                    New-ChartBar -Name 'Test1' -Value 2, 5, 7, 0
                    New-ChartBar -Name 'Test2' -Value 3, 1, 50, 5
                }
            }
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartToolbar -Download
                    #New-ChartBarOptions -Gradient
                    New-ChartLegend -Name 'Time', 'Money', 'Taxes' -Color Red, Yellow, Green
                    New-ChartBar -Name 'Test' -Value 1, 2, 3
                    New-ChartBar -Name 'Test1' -Value 2, 5, 7
                    New-ChartBar -Name 'Test2' -Value 3, 1, 2
                }
            }
            New-HTMLPanel {
                New-HTMLChart {
                    New-ChartToolbar -Download
                    New-ChartBarOptions -Type barStacked
                    New-ChartLegend -Name 'Time', 'Money', 'Taxes' -Color Red, Yellow, Green
                    New-ChartBar -Name 'Test' -Value 1, 2, 3
                    New-ChartBar -Name 'Test1' -Value 2, 5, 7
                    New-ChartBar -Name 'Test2' -Value 3, 1, 2
                }
            }
        }
    } -ShowHTML -FilePath $PSScriptRoot\Example-ChartBarNext.html -Online -Format

    .EXAMPLE
    New-HTML -TitleText "Testing HideButtons" -Online -FilePath "$PSScriptRoot\Example7_06.html" {
        # Hide Buttons
        New-HTMLSection -HeaderText "Hide Buttons" -Content {
            New-HTMLTable -DataTable $Table -HideButtons
        }
        New-HTMLSection -Invisible {
            New-HTMLSection -HeaderText "Hide Buttons" -Content {
                New-HTMLTable -DataTable $Table -HideButtons -Transpose
            }
            New-HTMLSection -HeaderText 'Some chart' {
                New-HTMLChart {
                    New-ChartPie -Name 'Passed' -Value 5 -Color $ColorPassed
                    New-ChartPie -Name 'Failed' -Value 10 -Color $ColorFailed
                    New-ChartPie -Name 'Skipped' -Value 15 -Color $ColorSkipped
                }
            }
        }
        New-HTMLSection -HeaderText "Code used to generate above tables" -Content {
            New-HTMLCodeBlock {
                New-HTMLSection -HeaderText "Hide Buttons" -Content {
                    New-HTMLTable -DataTable $Table -HideButtons
                }

                New-HTMLSection -Invisible {
                    New-HTMLSection -HeaderText "Hide Buttons" -Content {
                        New-HTMLTable -DataTable $Table -HideButtons -Transpose
                    }
                    New-HTMLSection -HeaderText 'Some chart' {
                        New-HTMLChart {
                            New-ChartPie -Name 'Passed' -Value 5 -Color $ColorPassed
                            New-ChartPie -Name 'Failed' -Value 10 -Color $ColorFailed
                            New-ChartPie -Name 'Skipped' -Value 15 -Color $ColorSkipped
                        }
                    }
                }
            }
        }
    } -ShowHTML

    .NOTES
    General notes
    #>
    [alias('Dashboard')]
    [CmdletBinding()]
    param(
        [alias('Content')][Parameter(Position = 0)][ValidateNotNull()][ScriptBlock] $HtmlData = $(Throw "Have you put the open curly brace on the next line?"),
        [switch] $Online,
        [alias('Name', 'Title')][String] $TitleText,
        [string] $Author,
        [string] $DateFormat = 'yyyy-MM-dd HH:mm:ss',
        [int] $AutoRefresh,
        # save HTML options
        [Parameter(Mandatory = $false)][string]$FilePath,
        [alias('Show', 'Open')][Parameter(Mandatory = $false)][switch]$ShowHTML,
        [ValidateSet('Unknown', 'String', 'Unicode', 'Byte', 'BigEndianUnicode', 'UTF8', 'UTF7', 'UTF32', 'Ascii', 'Default', 'Oem', 'BigEndianUTF32')] $Encoding = 'UTF8',
        [Uri] $FavIcon,
        # Deprecated - will be removed
        [Parameter(DontShow)][switch] $UseCssLinks,
        [Parameter(DontShow)][switch] $UseJavaScriptLinks,
        [switch] $Temporary,
        [switch] $AddComment,
        [switch] $Format,
        [switch] $Minify
    )
    if ($UseCssLinks -or $UseJavaScriptLinks) {
        Write-Warning "New-HTML - UseCssLinks and UseJavaScriptLinks is depreciated. Use Online switch instead. Those switches will be removed in near future."
        $Online = $true
    }

    [string] $CurrentDate = (Get-Date).ToString($DateFormat)

    if (-not $FilePath -and ($Temporary -or $ShowHTML)) {
        # if we have not chosen filepath but we used ShowHTML user wants to show it right? Or we have chosen temporary
        # We want to make sure we don't return useless HTML to the user
        $FilePath = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), "$($([System.IO.Path]::GetRandomFileName()).Split('.')[0]).html")
    }
    if ($FilePath) {
        $DirectoryPath = [System.IO.Path]::GetDirectoryName($FilePath)
        #$PagesPath = [io.path]::Combine($DirectoryPath, "Pages")
        $PagesPath = $DirectoryPath
        $FileName = [System.IO.Path]::GetFileNameWithoutExtension($FilePath)
    } else {
        # it actually won't be used, as it returns HTML, but we need it for tracking
        $FileName = 'Temporary.html'
        $DirectoryPath = $null
        $PagesPath = $null
    }

    # This makes sure we use always fresh copy
    $Script:CurrentConfiguration = Copy-Dictionary -Dictionary $Script:Configuration
    $Script:GlobalSchema = @{
        Features           = [ordered] @{ } # tracks features for CSS/JS implementation
        StorageInformation = @{
            FileName  = $FileName
            Directory = $DirectoryPath
            PagesPath = $PagesPath
        }
        # We need to track tabs per page, rather then globally
        PagesCurrent       = $FileName
        Pages              = [ordered] @{
            # Tracking different features across pages
            $FileName = New-DefaultSettings
        }
    }

    # lets set primary page as $HTMLSchema
    $Script:HTMLSchema = $Script:GlobalSchema['Pages'][$FileName]

    [Array] $TempOutputHTML = Invoke-Command -ScriptBlock $HtmlData

    $Pages = [ordered]@{}
    # Lets add primary page to the mix, either as the only page, or one of many pages
    $Pages[$FileName] = [ordered] @{
        Name     = $FileName
        Main     = $null
        Primary  = $true
        Header   = $null
        Footer   = $null
        SavePath = $FilePath
        ShowHTML = $ShowHTML.IsPresent
    }
    $Pages[$FileName].Main = foreach ($ObjectTemp in $TempOutputHTML) {
        if ($ObjectTemp -is [PSCustomObject]) {
            if ($ObjectTemp.Type -eq 'Navigation') {
                $Navigation = foreach ($_ in $ObjectTemp.Output) {
                    # this gets rid of any non-strings
                    # it's added here to track nested tabs
                    if ($_ -isnot [System.Collections.IDictionary]) { $_ }
                }
            } elseif ($ObjectTemp.Type -eq 'Page') {
                foreach ($_ in $ObjectTemp) {
                    # this gets rid of any non-strings
                    # it's added here to track nested tabs
                    if ($_.Output -isnot [System.Collections.IDictionary]) {
                        if ($_.FilePath) {
                            $SavePath = $_.FilePath
                        } else {
                            $Name = $_.Name.Replace(":", "_").Replace("/", "_").Replace("\", "_")
                            $SavePath = [io.path]::Combine($PagesPath, "$($FileName)_$($Name).html")
                        }
                        $Pages[$_.Name] = [ordered] @{
                            Name     = " $($FileName)_$($_.Name)"
                            #Output   = $null
                            Main     = $null
                            Primary  = if ($Pages.Keys.Count -eq 0) { $true } else { $false }
                            Header   = $null
                            Footer   = $null
                            SavePath = $SavePath
                            ShowHTML = $false
                        }
                        $Pages[$_.Name].Main = foreach ($Object in $_.Output) {
                            if ($Object.Type -eq 'Footer') {
                                $Pages[$_.Name].Footer = foreach ($Sub in $Object.Output) {
                                    # this gets rid of any non-strings
                                    # it's added here to track nested tabs
                                    if ($Sub -isnot [System.Collections.IDictionary]) { $Sub }
                                }
                            } elseif ($Object.Type -eq 'Header') {
                                $Pages[$_.Name].Header = foreach ($Sub in $Object.Output) {
                                    # this gets rid of any non-strings
                                    # it's added here to track nested tabs
                                    if ($Sub -isnot [System.Collections.IDictionary]) { $Sub }
                                }
                            } else {
                                if ($Object -isnot [System.Collections.IDictionary]) { $Object }
                            }
                        }

                    }
                }
            } elseif ($ObjectTemp.Type -eq 'Footer') {
                $Pages[$FileName].Footer = foreach ($Sub in $ObjectTemp.Output) {
                    # this gets rid of any non-strings
                    # it's added here to track nested tabs
                    if ($Sub -isnot [System.Collections.IDictionary]) { $Sub }
                }
            } elseif ($ObjectTemp.Type -eq 'Header') {
                $Pages[$FileName].Header = foreach ($Sub in $ObjectTemp.Output) {
                    # this gets rid of any non-strings
                    # it's added here to track nested tabs
                    if ($Sub -isnot [System.Collections.IDictionary]) { $Sub }
                }
            } else {
                if ($ObjectTemp.Output) {
                    # this gets rid of any non-strings
                    # it's added here to track nested tabs
                    foreach ($SubObject in $ObjectTemp.Output) {
                        if ($SubObject -isnot [System.Collections.IDictionary]) {
                            $SubObject
                        }
                    }
                }
            }
        } else {
            # this gets rid of any non-strings
            # it's added here to track nested tabs
            if ($ObjectTemp -isnot [System.Collections.IDictionary]) {
                $ObjectTemp
            }
        }
    }
    foreach ($Page in $Pages.Keys) {
        # set current page
        $Script:HTMLSchema = $Script:GlobalSchema['Pages'][$Page]
        $Script:HTMLSchema.Features.Main = $true

        # This removes Nested Tabs from primary Tabs
        foreach ($_ in $Script:HTMLSchema.TabsHeadersNested) {
            $null = $Script:HTMLSchema.TabsHeaders.Remove($_)
        }

        # Find features in use
        $Features = Get-FeaturesInUse -PriorityFeatures 'Main', 'FontsAwesome', 'JQuery', 'Moment', 'DataTables', 'Tabs', 'Raphael' -Email:$Script:HTMLSchema['Email']

        [string] $HTML = @(
            #"<!-- saved from url=(0016)http://localhost -->" + "`r`n"
            '<!-- saved from url=(0014)about:internet -->' + [System.Environment]::NewLine
            '<!DOCTYPE html>' + [System.Environment]::NewLine
            New-HTMLTag -Tag 'html' {
                if ($AddComment) { '<!-- HEAD -->' }
                New-HTMLTag -Tag 'head' {
                    New-HTMLTag -Tag 'meta' -Attributes @{ 'http-equiv' = "Content-Type"; content = "text/html; charset=utf-8" } -NoClosing
                    #New-HTMLTag -Tag 'meta' -Attributes @{ charset = "utf-8" } -NoClosing
                    #New-HTMLTag -Tag 'meta' -Attributes @{ 'http-equiv' = 'X-UA-Compatible'; content = 'IE=8' } -SelfClosing
                    New-HTMLTag -Tag 'meta' -Attributes @{ name = 'viewport'; content = 'width=device-width, initial-scale=1' } -NoClosing
                    if ($Author) {
                        New-HTMLTag -Tag 'meta' -Attributes @{ name = 'author'; content = $Author } -NoClosing
                    }
                    New-HTMLTag -Tag 'meta' -Attributes @{ name = 'revised'; content = $CurrentDate } -NoClosing
                    New-HTMLTag -Tag 'title' { $TitleText }

                    if ($null -ne $FavIcon) {
                        $Extension = [System.IO.Path]::GetExtension($FavIcon)
                        if ($Extension -in @('.png', '.jpg', 'jpeg', '.svg', '.ico')) {
                            switch ($FavIcon.Scheme) {
                                "file" {
                                    if (Test-Path -Path $FavIcon.OriginalString) {
                                        $FavIcon = Get-Item -Path $FavIcon.OriginalString
                                        $FavIconImageBinary = Convert-ImageToBinary -ImageFile $FavIcon
                                        New-HTMLTag -Tag 'link' -Attributes @{rel = 'icon'; href = "$FavIconImageBinary"; type = 'image/x-icon' }
                                    } else {
                                        Write-Warning -Message "The path to the FavIcon image could not be resolved."
                                    }
                                }
                                "https" {
                                    $FavIcon = $FavIcon.OriginalString
                                    New-HTMLTag -Tag 'link' -Attributes @{rel = 'icon'; href = "$FavIcon"; type = 'image/x-icon' }
                                }
                                default {
                                    Write-Warning -Message "The path to the FavIcon image could not be resolved."
                                }
                            }
                        } else {
                            Write-Warning -Message "File extension `'$Extension`' is not supported as a FavIcon image.`nPlease use images with these extensions: '.png', '.jpg', 'jpeg', '.svg', '.ico'"
                        }
                    }

                    if ($Autorefresh -gt 0) {
                        New-HTMLTag -Tag 'meta' -Attributes @{ 'http-equiv' = 'refresh'; content = $Autorefresh } -SelfClosing
                    }
                    # Those are CSS we always add
                    Get-Resources -Online:$Online.IsPresent -Location 'HeaderAlways' -Features Fonts #-NoScript

                    # Those are CSS we only add if user selected proper data
                    if ($null -ne $Features) {
                        # additionally we want to have different rules when Email is being built and not
                        Get-Resources -Online:$Online.IsPresent -Location 'Header' -Features $Features -NoScript
                        Get-Resources -Online:$true -Location 'HeaderAlways' -Features $Features -NoScript
                        Get-Resources -Online:$false -Location 'HeaderAlways' -Features $Features -NoScript
                    }
                    if ($Script:HTMLSchema['Email'] -ne $true -and $Script:HTMLSchema.CustomHeaderJS) {
                        New-HTMLCustomJS -JS $Script:HTMLSchema.CustomHeaderJS
                    }
                    if ($Script:HTMLSchema.CustomHeaderCSS) {
                        New-HTMLCustomCSS -Css $Script:HTMLSchema.CustomHeaderCSS -AddComment:$AddComment
                    }
                }
                if ($AddComment) {
                    '<!-- END HEAD -->'
                    '<!-- BODY -->'
                }
                New-HTMLTag -Tag 'body' {
                    if ($null -ne $Features) {
                        Get-Resources -Online:$Online.IsPresent -Location 'Body' -Features $Features -NoScript
                        Get-Resources -Online:$true -Location 'BodyAlways' -Features $Features -NoScript
                        Get-Resources -Online:$false -Location 'BodyAlways' -Features $Features -NoScript
                    }
                    if ($Navigation) {
                        if ($AddComment) { '<!-- NAVIGATION -->' }
                        $Navigation
                        if ($AddComment) { '<!-- END NAVIGATION -->' }
                    }
                    New-HTMLTag -Tag 'div' -Attributes @{ class = 'main-section' } {
                        if ($Pages[$Page].Header) {
                            if ($AddComment) { '<!-- HEADER -->' }
                            New-HTMLTag -Tag 'header' {
                                $Pages[$Page].Header
                            }
                            if ($AddComment) { '<!-- END HEADER -->' }
                        }
                        # Add logo if there is one
                        if ($Script:HTMLSchema.Logos) {
                            $Script:HTMLSchema.Logos
                        }
                        # Add tabs header if there is one
                        if ($Script:HTMLSchema.TabsHeaders) {
                            New-HTMLTabHead -PageName $Page
                            New-HTMLTag -Tag 'div' -Attributes @{ 'data-panes' = 'true' } {
                                # Add remaining data
                                if ($Pages[$Page].Main) {
                                    $Pages[$Page].Main
                                }
                            }
                        } else {
                            # Add remaining data
                            if ($Pages[$Page].Main) {
                                $Pages[$Page].Main
                            }
                        }
                        # Add charts scripts if those are there
                        foreach ($Chart in $Script:HTMLSchema.Charts) {
                            $Chart
                        }
                        foreach ($Diagram in $Script:HTMLSchema.Diagrams) {
                            $Diagram
                        }
                        foreach ($Carousel in $Script:HTMLSchema.Carousel) {
                            $Carousel
                        }
                    }
                    if ($AddComment) { '<!-- FOOTER -->' }

                    [string] $Footer = @(
                        if ($Pages[$Page].Footer) {
                            $Pages[$Page].Footer
                        }
                        if ($null -ne $Features) {
                            # FooterAlways means we're not able to provide consistent output with and without links and we prefer those to be included
                            # either as links or from file per required features
                            Get-Resources -Online:$true -Location 'FooterAlways' -Features $Features -NoScript
                            Get-Resources -Online:$false -Location 'FooterAlways' -Features $Features -NoScript
                            # standard footer features
                            Get-Resources -Online:$Online.IsPresent -Location 'Footer' -Features $Features -NoScript

                        }
                        if ($Script:HTMLSchema.CustomFooterCSS) {
                            New-HTMLCustomCSS -Css $Script:HTMLSchema.CustomFooterCSS -AddComment:$AddComment
                        }
                        if ($Script:HTMLSchema['Email'] -ne $true -and $Script:HTMLSchema.CustomFooterJS) {
                            New-HTMLCustomJS -JS $Script:HTMLSchema.CustomFooterJS
                        }
                    )
                    if ($Footer) {
                        New-HTMLTag -Tag 'footer' {
                            $Footer
                        }
                    }
                    if ($AddComment) {
                        '<!-- END FOOTER -->'
                        '<!-- END BODY -->'
                    }
                }
            }
        )
        if ($FilePath) {
            Save-HTML -HTML $HTML -FilePath $Pages[$Page].SavePath -Encoding $Encoding -Format:$Format -Minify:$Minify -ShowHTML:$Pages[$Page].ShowHTML
        } else {
            # User opted to return all data in form of html
            $HTML
        }
    }
}
