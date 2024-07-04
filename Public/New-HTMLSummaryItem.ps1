function New-HTMLSummaryItem {
    <#
    .SYNOPSIS
    Creates a new HTML summary item with specified parameters.

    .DESCRIPTION
    This function creates a new HTML summary item with customizable text, icons, and other visual properties.

    .PARAMETER NestedItems
    Specifies the nested items to include within the summary item.

    .PARAMETER Text
    Specifies the text content of the summary item.

    .PARAMETER Open
    Indicates whether the summary item should be initially open or closed.

    .PARAMETER IconSize
    Specifies the size of the icon in the summary item.

    .PARAMETER IconColor
    Specifies the color of the icon in the summary item.

    .PARAMETER IconBrands
    Specifies the icon brand to use for the summary item. Valid values are retrieved from the available FontAwesome brands.

    .PARAMETER IconRegular
    Specifies the regular icon to use for the summary item. Valid values are retrieved from the available FontAwesome regular icons.

    .EXAMPLE
    New-HTMLSummaryItem -Text "Summary Item 1" -IconBrands "fa-windows" -IconSize 2 -IconColor "blue" -Open

    Creates a new HTML summary item with the text "Summary Item 1", using the Windows icon brand, a size of 2, blue color, and initially open.

    .EXAMPLE
    New-HTMLSummaryItem -Text "Summary Item 2" -IconRegular "fa-address-book" -IconSize 3 -IconColor "green"

    Creates a new HTML summary item with the text "Summary Item 2", using the address book regular icon, a size of 3, and green color.

    #>
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
        Add-HTMLStyle -Placement Header -Css $StyleNodeInformation #-SkipTags
    }
}

Register-ArgumentCompleter -CommandName New-HTMLSummaryItem -ParameterName IconColor -ScriptBlock $Script:ScriptBlockColors