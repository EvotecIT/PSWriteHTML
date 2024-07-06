function Add-HTMLStyle {
    <#
    .SYNOPSIS
    Adds CSS styles to HTML documents.

    .DESCRIPTION
    The Add-HTMLStyle function allows you to add CSS styles to HTML documents in various ways such as inline styles, external stylesheets, and content from files or strings.

    .PARAMETER Placement
    Specifies where the CSS styles should be placed in the HTML document. Valid values are 'Inline', 'Header', or 'Footer'. Default is 'Header'.

    .PARAMETER Resource
    Specifies the resource to be added as CSS styles.

    .PARAMETER ResourceComment
    Specifies a comment for the resource being added.

    .PARAMETER Link
    Specifies an array of URLs to external CSS stylesheets to be linked in the HTML document.

    .PARAMETER Content
    Specifies an array of CSS content to be added directly to the HTML document.

    .PARAMETER FilePath
    Specifies an array of file paths containing CSS content to be added to the HTML document.

    .PARAMETER Css
    Specifies a hashtable of CSS styles to be converted and added to the HTML document.

    .PARAMETER ReplaceData
    Specifies a hashtable of data to be replaced in the CSS content.

    .PARAMETER AddComment
    Switch parameter to add comments around the added CSS styles.

    .PARAMETER RelType
    Specifies the relationship type for linked stylesheets. Valid values are 'dns-prefetch', 'preconnect', or 'preload'. Default is 'preload'.

    .PARAMETER SkipTags
    Switch parameter to skip adding HTML tags when inserting CSS content.

    .EXAMPLE
    Add-HTMLStyle -Placement 'Header' -Resource 'styles.css' -ResourceComment 'Custom styles' -Link 'https://example.com/styles.css'

    Adds a linked CSS stylesheet to the header of the HTML document with a custom comment.

    .EXAMPLE
    Add-HTMLStyle -Placement 'Inline' -Content 'body { background-color: lightblue; }' -ResourceComment 'Inline styles'

    Adds inline CSS styles directly to the HTML document body with a custom comment.

    .EXAMPLE
    Add-HTMLStyle -Placement 'Footer' -Css @{ 'body' = @{ 'background-color' = 'lightblue' } } -ResourceComment 'Custom CSS'

    Converts a hashtable of CSS styles to a stylesheet and adds it to the footer of the HTML document with a custom comment.

    #>
    [alias('Add-CSS')]
    [CmdletBinding()]
    param(
        [ValidateSet('Inline', 'Header', 'Footer')][string] $Placement = 'Header',
        [System.Collections.IDictionary] $Resource,
        [string] $ResourceComment,
        [string[]] $Link,
        [string[]] $Content,
        [string[]] $FilePath,
        [alias('CssInline')][System.Collections.IDictionary] $Css,
        [Parameter(DontShow)][System.Collections.IDictionary] $ReplaceData,
        [switch] $AddComment,
        [ValidateSet('dns-prefetch', 'preconnect', 'preload')][string] $RelType = 'preload',
        [switch] $SkipTags
    )
    if (-not $ResourceComment) {
        $ResourceComment = "ResourceCSS-$(Get-RandomStringName -Size 8 -LettersOnly)"
    }
    $Output = @(
        # Content from files
        foreach ($File in $FilePath) {
            if ($File -ne '') {
                if (Test-Path -LiteralPath $File) {
                    Write-Verbose "Add-HTMLStyle - Reading file from $File"
                    # Replaces stuff based on $Script:CurrentConfiguration CustomActionReplace Entry
                    $FileContent = Get-Content -LiteralPath $File -Raw -Encoding UTF8
                    if ($null -ne $ReplaceData) {
                        foreach ($_ in $ReplaceData.Keys) {
                            $FileContent = $FileContent -replace $_, $ReplaceData[$_]
                        }
                    }
                    $FileContent = $FileContent -replace '@charset "UTF-8";'
                    # Put with tags or without them
                    if ($SkipTags) {
                        if ($Resource.InternalComment) { "/* $($Resource.InternalComment)-start */" }
                        $FileContent
                        if ($Resource.InternalComment) { "/* $($Resource.InternalComment)-end */" }
                    } else {
                        New-HTMLTag -Tag 'style' -Attributes @{ type = 'text/css'; comment = $Resource.InternalComment } {
                            if ($Resource.InternalComment) { "/* $($Resource.InternalComment)-start */" }
                            $FileContent
                            if ($Resource.InternalComment) { "/* $($Resource.InternalComment)-end */" }
                        } -NewLine
                    }
                } else {
                    Write-Warning "Add-HTMLStyle - File $File not found. Unable to load CSS to HTML. HTML may be broken. Skipping."
                }
            }
        }
        # Content from string
        if ($Content) {
            Write-Verbose "Add-HTMLStyle - Adding style from Content"
            if ($SkipTags) {
                if ($Resource.InternalComment) { "/* $($Resource.InternalComment)-start */" }
                $Content
                if ($Resource.InternalComment) { "/* $($Resource.InternalComment)-end */" }
            } else {
                New-HTMLTag -Tag 'style' -Attributes @{ type = 'text/css'; comment = $Resource.InternalComment } {
                    if ($Resource.InternalComment) { "/* $($Resource.InternalComment)-start */" }
                    $Content
                    if ($Resource.InternalComment) { "/* $($Resource.InternalComment)-end */" }
                } -NewLine
            }
        }
        # Content from Link
        foreach ($L in $Link) {
            if ($L -ne '') {
                Write-Verbose "Add-HTMLStyle - Adding link $L"
                New-HTMLTag -Tag 'link' -Attributes @{ rel = "stylesheet preload prefetch"; type = "text/css"; href = $L; as = 'style'; comment = $Resource.InternalComment } -SelfClosing -NewLine
            }
        }
        # Content from Hashtable
        if ($Css) {
            ConvertTo-CascadingStyleSheets -Css $Css -WithTags:(-not $SkipTags.IsPresent) -Comment $Resource.InternalComment #:$false
        }
    )
    if ($Output) {
        if ($AddComment) {
            $Output = @(
                "<!-- CSS $ResourceComment START -->"
                $Output
                "<!-- CSS $ResourceComment END -->"
            )
        }
        # Outputs only if more than comments
        if ($Placement -eq 'Footer') {
            $Script:HTMLSchema.CustomFooterCSS[$ResourceComment] = $Output
        } elseif ($Placement -eq 'Header') {
            $Script:HTMLSchema.CustomHeaderCSS[$ResourceComment] = $Output
        } else {
            $Output
        }
    }
}