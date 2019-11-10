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
        [parameter(ParameterSetName = "FontAwesomeSolid")][string] $IconSolid,

        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][int] $TextSize,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][string] $TextColor = "",
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][int] $IconSize,
        [parameter(ParameterSetName = "FontAwesomeBrands")]
        [parameter(ParameterSetName = "FontAwesomeRegular")]
        [parameter(ParameterSetName = "FontAwesomeSolid")][string] $IconColor = ""
    )
    if (-not $Script:HTMLSchema.Features) {
        Write-Warning 'New-HTMLTab - Creation of HTML aborted. Most likely New-HTML is missing.'
        Exit
    }
    [string] $Icon = ''
    if ($IconBrands) {
        $Icon = "fab fa-$IconBrands" # fa-$($FontSize)x"
    } elseif ($IconRegular) {
        $Icon = "far fa-$IconRegular" # fa-$($FontSize)x"
    } elseif ($IconSolid) {
        $Icon = "fas fa-$IconSolid" # fa-$($FontSize)x"
    }

    $StyleText = @{ }
    if ($TextSize -ne 0) {
        $StyleText.'font-size' = "$($TextSize)px"
    }
    if ($TextColor -ne "") {
        $StyleText.'color' = ConvertFrom-Color -Color $TextColor
    }

    $StyleIcon = @{ }
    if ($IconSize -ne 0) {
        $StyleIcon.'font-size' = "$($IconSize)px"
    }
    if ($IconColor -ne "") {
        $StyleIcon.'color' = ConvertFrom-Color -Color $IconColor
    }
    $Script:HTMLSchema.Features.Tabbis = $true

    # Reset all Tabs Headers to make sure there are no Current Tab Set
    # This is required for New-HTMLTable

    foreach ($Tab in $Script:HTMLSchema.TabsHeaders) {
        $Tab.Current = $false
    }

    # Start Tab Tracking
    $Tab = [ordered] @{ }
    $Tab.ID = "Tab-$(Get-RandomStringName -Size 8)"
    $Tab.Name = " $Name"
    $Tab.StyleIcon = $StyleIcon
    $Tab.StyleText = $StyleText
    #$Tab.Used = $true
    $Tab.Current = $true


    if ($Script:HTMLSchema.TabsHeaders | Where-Object { $_.Active -eq $true }) {
        $Tab.Active = $false
    } else {
        $Tab.Active = $true
    }

    # $Tab.Active = $true
    # $Tab.Active = $true
    $Tab.Icon = $Icon
    # End Tab Tracking

    # This is building HTML

    if ($Tab.Active) {
        $Class = 'active'
    } else {
        $Class = ''
    }
    #New-HTMLTag -Tag 'div' -Attributes @{ id = $Tab.ID; class = $Class } {
    New-HTMLTag -Tag 'div' -Attributes @{ id = $Tab.ID; class = $Class } {
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
}