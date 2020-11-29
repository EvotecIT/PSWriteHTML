function Add-HTMLStyle {
    [alias('Add-CSS')]
    [CmdletBinding()]
    param(
        [ValidateSet('Inline', 'Header', 'Footer')][string] $Placement = 'Header',
        [string] $ResourceComment,
        [string[]] $Link,
        [string[]] $Content,
        [string[]] $FilePath,
        [alias('CssInline')][System.Collections.IDictionary] $Css,
        [Parameter(DontShow)][System.Collections.IDictionary] $ReplaceData,
        [switch] $AddComment,
        [ValidateSet('dns-prefetch', 'preconnect', 'preload')][string] $RelType = 'preload'
    )
    if (-not $ResourceComment) {
        $ResourceComment = "ResourceCSS-$(Get-RandomStringName -Size 8 -LettersOnly)"
    }
    $Output = @(
        # Content from files
        foreach ($File in $FilePath) {
            if ($File -ne '') {
                if (Test-Path -LiteralPath $File) {
                    New-HTMLTag -Tag 'style' -Attributes @{ type = 'text/css' } {
                        Write-Verbose "Add-HTMLStyle - Reading file from $File"
                        # Replaces stuff based on $Script:CurrentConfiguration CustomActionReplace Entry
                        $FileContent = Get-Content -LiteralPath $File -Raw
                        if ($null -ne $ReplaceData) {
                            foreach ($_ in $ReplaceData.Keys) {
                                $FileContent = $FileContent -replace $_, $ReplaceData[$_]
                            }
                        }
                        $FileContent -replace '@charset "UTF-8";'
                    } -NewLine
                }
            }
        }
        # Content from string
        if ($Content) {
            New-HTMLTag -Tag 'style' -Attributes @{ type = 'text/css' } {
                Write-Verbose "Add-HTMLStyle - Reading file from $File"
                $Content
            } -NewLine
        }
        # Content from Link
        foreach ($L in $Link) {
            if ($L -ne '') {
                Write-Verbose "Add-HTMLStyle - Adding link $L"
                #$UriLink = [uri] $L
                #$TopLink = -join ($UriLink.Scheme, '://', $UriLink.DnsSafeHost )
                #if (-not $Script:HTMLSchema['Preload'][$TopLink]) {
                #   $Script:HTMLSchema['Preload'][$TopLink] = $true
                #New-HTMLTag -Tag 'link' -Attributes @{ rel = $RelType; href = $TopLink } -SelfClosing -NewLine
                #New-HTMLTag -Tag 'link' -Attributes @{ rel = $RelType; href = $TopLink; as = 'style' } -SelfClosing -NewLine
                # }
                #New-HTMLTag -Tag 'link' -Attributes @{ rel = "stylesheet"; type = "text/css"; href = $L; } -SelfClosing -NewLine
                #New-HTMLTag -Tag 'link' -Attributes @{ rel = "preload"; type = "text/css"; href = $L; as = 'style' } -SelfClosing -NewLine
                New-HTMLTag -Tag 'link' -Attributes @{ rel = "stylesheet preload prefetch"; type = "text/css"; href = $L; as = 'style' } -SelfClosing -NewLine
            }
        }
        # Content from Hashtable
        if ($Css) {
            ConvertTo-CascadingStyleSheets -Css $Css -WithTags
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