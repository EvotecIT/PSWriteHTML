function New-HTMLTab {
    [alias('Tab')]
    [CmdLetBinding(DefaultParameterSetName = 'FontAwesomeBrands')]
    param(
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $HtmlData = $(Throw "No curly brace?)"),
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [alias('TabHeading')][Parameter(Mandatory = $false, Position = 1)][String]$Heading,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [alias('TabName')][string] $Name = 'Tab',

        # ICON BRANDS
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [ArgumentCompleter(
            {
                param($CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters)
                ($Global:HTMLIcons.FontAwesomeBrands.Keys)
            }
        )]
        [ValidateScript( { $_ -in (($Global:HTMLIcons.FontAwesomeBrands.Keys)) })]
        [string] $IconBrands,

        # ICON REGULAR
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [ArgumentCompleter(
            {
                param($CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters)
                ($Global:HTMLIcons.FontAwesomeRegular.Keys)
            }
        )]
        [ValidateScript( { $_ -in (($Global:HTMLIcons.FontAwesomeRegular.Keys)) })]
        [string] $IconRegular,

        # ICON SOLID
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [ArgumentCompleter(
            {
                param($CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters)
                ($Global:HTMLIcons.FontAwesomeSolid.Keys)
            }
        )]
        [ValidateScript( { $_ -in (($Global:HTMLIcons.FontAwesomeSolid.Keys)) })]
        [string] $IconSolid,

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][object] $TextSize,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][string] $TextColor,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][object] $IconSize,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][string] $IconColor,
        [ValidateSet('uppercase', 'lowercase', 'capitalize')][string] $TextTransform, # New-HTMLTab - Add text-transform
        [string] $AnchorName
    )
    if (-not $Script:HTMLSchema.Features) {
        Write-Warning 'New-HTMLTab - Creation of HTML aborted. Most likely New-HTML is missing.'
        Exit
    }
    if ($IconBrands -or $IconRegular -or $IconSolid) {
        $Script:HTMLSchema.Features.FontsAwesome = $true
    }
    $Script:HTMLSchema.Features.MainFlex = $true
    if (-not $AnchorName) {
        $AnchorName = "Tab-$(Get-RandomStringName -Size 8)"
    }
    [string] $Icon = ''
    if ($IconBrands) {
        $Icon = "fab fa-$IconBrands".ToLower() # fa-$($FontSize)x"
    } elseif ($IconRegular) {
        $Icon = "far fa-$IconRegular".ToLower() # fa-$($FontSize)x"
    } elseif ($IconSolid) {
        $Icon = "fas fa-$IconSolid".ToLower() # fa-$($FontSize)x"
    }

    $StyleText = @{ }
    #if ($TextSize -ne 0) {
    $StyleText['font-size'] = ConvertFrom-Size -Size $TextSize  #"$($TextSize)px"
    #}
    if ($TextColor) {
        $StyleText.'color' = ConvertFrom-Color -Color $TextColor
    }
    # New-HTMLTab - Add text-transform
    $StyleText.'text-transform' = "$TextTransform"
    # end

    $StyleIcon = @{ }
    #if ($IconSize -ne 0) {
    $StyleIcon.'font-size' = ConvertFrom-Size -Size $IconSize #"$($IconSize)px"
    #}
    if ($IconColor) {
        $StyleIcon.'color' = ConvertFrom-Color -Color $IconColor
    }

    if ($Script:HTMLSchema['TabPanelsList'].Count -eq 0) {
        #$Script:HTMLSchema['TabPanelsList'][-1]
        #}


        #if ($Script:HTMLSchema['TabPanels'] -eq $false) {
        #if ($Script:HTMLSchema.TabPanel -eq $false) {
        # Reset all Tabs Headers to make sure there are no Current Tab Set
        # This is required for New-HTMLTable

        foreach ($Tab in $Script:HTMLSchema.TabsHeaders) {
            $Tab.Current = $false
        }
        # Start Tab Tracking
        $Tab = [ordered] @{ }
        $Tab.ID = $AnchorName
        $Tab.Name = $Name
        $Tab.StyleIcon = $StyleIcon
        $Tab.StyleText = $StyleText
        $Tab.Current = $true

        if ($Script:HTMLSchema.TabsHeaders | Where-Object { $_.Active -eq $true }) {
            $Tab.Active = $false
        } else {
            $Tab.Active = $true
        }
        $Tab.Icon = $Icon
        # End Tab Tracking

        # This is building HTML

        if ($Tab.Active) {
            $Class = 'active'
        } else {
            $Class = ''
        }


        $Script:HTMLSchema.Features.Tabbis = $true
        $Script:HTMLSchema.Features.RedrawObjects = $true
        #New-HTMLTag -Tag 'div' -Attributes @{ id = $Tab.ID; class = $Class } {
        New-HTMLTag -Tag 'div' -Attributes @{ id = "$($Tab.ID)-Content"; class = $Class } {
            if (-not [string]::IsNullOrWhiteSpace($Heading)) {
                New-HTMLTag -Tag 'h7' {
                    $Heading
                }
            }
            $OutputHTML = Invoke-Command -ScriptBlock $HtmlData
            [Array] $TabsCollection = foreach ($_ in $OutputHTML) {
                if ($_ -is [System.Collections.IDictionary]) {
                    $_
                    $Script:HTMLSchema.TabsHeadersNested.Add($_)
                }
            }
            [Array] $HTML = foreach ($_ in $OutputHTML) {
                if ($_ -isnot [System.Collections.IDictionary]) {
                    $_
                }
            }
            if ($TabsCollection.Count -gt 0) {
                New-HTMLTabHead -TabsCollection $TabsCollection
                New-HTMLTag -Tag 'div' -Attributes @{ 'data-panes' = 'true' } {
                    # Add remaining data
                    $HTML
                }

            } else {
                $HTML
            }
        }
        $Script:HTMLSchema.TabsHeaders.Add($Tab)
        $Tab
    } else {
        # Tabs related to tab panel (New-HTMLTabPanel)
        if ($HtmlData) {
            $TabExecutedCode = & $HtmlData
        } else {
            $TabExecutedCode = ''
        }
        [PSCustomObject] @{
            Name      = $Name
            ID        = $AnchorName #"TabPanelID-$(Get-RandomStringName -Size 8 -LettersOnly)"
            Icon      = $Icon
            StyleIcon = $StyleIcon
            StyleText = $StyleText
            Content   = $TabExecutedCode
        }
    }
}

Register-ArgumentCompleter -CommandName New-HTMLTab -ParameterName IconColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLTab -ParameterName TextColor -ScriptBlock $Script:ScriptBlockColors
