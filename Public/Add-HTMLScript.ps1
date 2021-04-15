function Add-HTMLScript {
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
                    $FileContent = Get-Content -LiteralPath $File -Raw
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