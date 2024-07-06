function Add-HTMLScript {
    <#
    .SYNOPSIS
    Adds JavaScript content to the HTML body.

    .DESCRIPTION
    This function adds JavaScript content to the HTML body by including JavaScript code from files, strings, or links. It allows customization of the placement of JavaScript content within the HTML document.

    .PARAMETER Placement
    Specifies where the JavaScript content should be placed in the HTML document. Valid values are 'Inline', 'Header', or 'Footer'. Default is 'Header'.

    .PARAMETER Resource
    Specifies the resource containing the JavaScript content.

    .PARAMETER ResourceComment
    Specifies a comment to be included with the JavaScript content.

    .PARAMETER Link
    Specifies an array of URLs to external JavaScript files to be included.

    .PARAMETER Content
    Specifies an array of JavaScript content as strings to be included.

    .PARAMETER FilePath
    Specifies an array of file paths containing JavaScript code to be included.

    .PARAMETER ReplaceData
    Specifies a dictionary of key-value pairs to replace in the JavaScript code.

    .PARAMETER AddComments
    Indicates whether to add comments around the JavaScript content. By default, comments are not added.

    .PARAMETER SkipTags
    Indicates whether to skip adding script tags around the JavaScript content. By default, script tags are added.

    .EXAMPLE
    Add-HTMLScript -Placement 'Header' -Resource 'MyScript' -ResourceComment 'Script for functionality X' -Link 'https://example.com/script.js'
    Adds an external JavaScript file 'script.js' to the header of the HTML document with a specified comment.

    .EXAMPLE
    Add-HTMLScript -Placement 'Footer' -Resource 'CustomScript' -ResourceComment 'Custom script for feature Y' -Content 'function myFunction() { // code here }'
    Adds custom JavaScript content to the footer of the HTML document with a specified comment.

    .EXAMPLE
    Add-HTMLScript -Placement 'Inline' -Resource 'InlineScript' -ResourceComment 'Inline script for page Z' -FilePath 'C:\Scripts\inline.js' -ReplaceData @{ 'placeholder' = 'replacement' }
    Adds JavaScript code from a file 'inline.js' to be included inline in the HTML document with specified replacements.

    #>
    [alias('Add-JavaScript', 'New-JavaScript', 'Add-JS')]
    [CmdletBinding()]
    param(
        [ValidateSet('Inline', 'Header', 'Footer')][string] $Placement = 'Header',
        [System.Collections.IDictionary] $Resource,
        [string] $ResourceComment,
        [string[]] $Link,
        [string[]] $Content,
        [string[]] $FilePath,
        [Parameter(DontShow)][System.Collections.IDictionary] $ReplaceData,
        [switch] $AddComments,
        [switch] $SkipTags
    )
    if (-not $ResourceComment) {
        $ResourceComment = "ResourceJS-$(Get-RandomStringName -Size 8 -LettersOnly)"
    }
    $Output = @(
        # Content from File(s)
        foreach ($File in $FilePath) {
            if ($File -ne '') {
                if (Test-Path -LiteralPath $File) {
                    # Replaces stuff based on $Script:CurrentConfiguration CustomActionReplace Entry
                    # Not really used anymore
                    $FileContent = Get-Content -LiteralPath $File -Raw -Encoding UTF8
                    if ($null -ne $ReplaceData) {
                        foreach ($_ in $ReplaceData.Keys) {
                            $FileContent = $FileContent -replace $_, $ReplaceData[$_]
                        }
                    }
                    if ($SkipTags) {
                        if ($Resource.InternalComment) { "/* $($Resource.InternalComment)-start */" }
                        $FileContent
                        if ($Resource.InternalComment) { "/* $($Resource.InternalComment)-end */" }
                    } else {
                        New-HTMLTag -Tag 'script' -Attributes @{ type = 'text/javascript'; comment = $Resource.InternalComment } {
                            if ($Resource.InternalComment) { "/* $($Resource.InternalComment)-start */" }
                            $FileContent
                            if ($Resource.InternalComment) { "/* $($Resource.InternalComment)-end */" }
                        } -NewLine
                    }
                } else {
                    Write-Warning "Add-HTMLScript - File $File not found. Unable to load JavaScript to HTML. HTML may be broken. Skipping."
                }
            }
        }
        # Content from string
        if ($Content) {
            if ($SkipTags) {
                if ($Resource.InternalComment) { "/* $($Resource.InternalComment)-start */" }
                $Content
                if ($Resource.InternalComment) { "/* $($Resource.InternalComment)-end */" }
            } else {
                New-HTMLTag -Tag 'script' -Attributes @{ type = 'text/javascript' } {
                    if ($Resource.InternalComment) { "/* $($Resource.InternalComment)-start */" }
                    $Content
                    if ($Resource.InternalComment) { "/* $($Resource.InternalComment)-end */" }
                } -NewLine
            }
        }
        # Content from link
        foreach ($L in $Link) {
            if ($L -ne '') {
                New-HTMLTag -Tag 'script' -Attributes @{ type = "text/javascript"; src = $L; comment = $Resource.InternalComment } -NewLine
            } else {
                return
            }
        }
    )
    if ($Output) {
        if ($AddComment) {
            $Output = @(
                "<!-- JS $ResourceComment START -->"
                $Output
                "<!-- JS $ResourceComment END -->"
            )
        }
        # Outputs only if more than comments
        if ($Placement -eq 'Footer') {
            $Script:HTMLSchema.CustomFooterJS[$ResourceComment] = $Output
        } elseif ($Placement -eq 'Header') {
            $Script:HTMLSchema.CustomHeaderJS[$ResourceComment] = $Output
        } else {
            $Output
        }
    }
}