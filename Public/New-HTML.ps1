Function New-HTML {
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
        $FilePath = Get-FileName -Extension 'html' -Temporary
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
                        $Pages[$_.Name] = [ordered] @{
                            Name     = " $($FileName)_$($_.Name)"
                            #Output   = $null
                            Main     = $null
                            Primary  = if ($Pages.Keys.Count -eq 0) { $true } else { $false }
                            Header   = $null
                            Footer   = $null
                            SavePath = [io.path]::Combine($PagesPath, "$($FileName)_$($_.Name).html")
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
