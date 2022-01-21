function New-HTMLSummaryItem {
    [cmdletBinding(DefaultParameterSetName = 'FontAwesomeSolid')]
    param(
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [Parameter(Position = 0)][scriptblock] $NestedItems,

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [string] $Text,

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [switch] $Open,

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [int] $IconSize,

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [string] $IconColor,

        # ICON BRANDS
        [ArgumentCompleter(
            {
                param($CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters)
                ($Global:HTMLIcons.FontAwesomeBrands.Keys)
            }
        )]
        [ValidateScript(
            {
                $_ -in (($Global:HTMLIcons.FontAwesomeBrands.Keys))
            }
        )]
        [parameter(ParameterSetName = "FontAwesomeBrands")][string] $IconBrands,

        # ICON REGULAR
        [ArgumentCompleter(
            {
                param($CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters)
                ($Global:HTMLIcons.FontAwesomeRegular.Keys)
            }
        )]
        [ValidateScript(
            {
                $_ -in (($Global:HTMLIcons.FontAwesomeRegular.Keys))
            }
        )]
        [parameter(ParameterSetName = "FontAwesomeRegular")][string] $IconRegular,

        # ICON SOLID
        [ArgumentCompleter(
            {
                param($CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters)
                ($Global:HTMLIcons.FontAwesomeSolid.Keys)
            }
        )]
        [ValidateScript(
            {
                $_ -in (($Global:HTMLIcons.FontAwesomeSolid.Keys))
            }
        )]
        [parameter(ParameterSetName = "FontAwesomeSolid")][string] $IconSolid
    )

    $Name = "$(Get-RandomStringName -Size 8 -LettersOnly)"

    $IconChoice = @{
        IconSolid   = $IconSolid
        IconRegular = $IconRegular
        IconBrands  = $IconBrands
    }
    Remove-EmptyValue -Hashtable $IconChoice

    # User made no choice
    if ($IconChoice.Count -eq 0) {
        $IconChoice = @{
            IconSolid = 'check'
        }
    }

    # to not overcomplicate user choices we allow nesting even tho it can be only nested once
    if (-not $Script:SummaryNestedItem) {
        New-HTMLTag -Tag 'details' {
            New-HTMLTag -Tag 'summary' {
                $Text
            } -Attributes @{ class = $Name }
            New-HTMLTag -Tag 'ul' {
                if ($NestedItems) {
                    $Script:SummaryNestedItem = $true
                    & $NestedItems
                    $Script:SummaryNestedItem = $false
                }
            }
        } -Attributes @{ open = if ($Open) { 'open' } else { '' } }
        $StyleNodeInformation = @{
            "details summary.$($Name):before" = New-HTMLFontIcon @IconChoice -AsCSS -AsHashTable -IconColor $IconColor -IconSize $IconSize
        }
    } else {
        New-HTMLTag -Tag 'li' {
            New-HTMLTag -Tag 'div' {
                $Text
                if ($NestedItems) {
                    & $NestedItems
                }
            } -Attributes @{ class = $Name }
        }
        $StyleNodeInformation = @{
            "details ul li div.$($Name):before" = New-HTMLFontIcon @IconChoice -AsCSS -AsHashTable -IconColor $IconColor -IconSize $IconSize
        }
    }
    # Add styles to Header
    Remove-EmptyValue -Hashtable $StyleNodeInformation -Recursive -Rerun 2
    if ($StyleNodeInformation) {
        Add-HTMLStyle -Placement Header -Css $StyleNodeInformation -SkipTags
    }
}

Register-ArgumentCompleter -CommandName New-HTMLSummaryItem -ParameterName IconColor -ScriptBlock $Script:ScriptBlockColors