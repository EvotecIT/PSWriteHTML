function Add-HTMLStyle {
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
                    $FileContent = Get-Content -LiteralPath $File -Raw
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