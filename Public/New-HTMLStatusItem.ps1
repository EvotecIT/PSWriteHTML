function New-HTMLStatusItem {
    [CmdletBinding(DefaultParameterSetName = 'Statusimo')]
    param(
        [alias('ServiceName')][string] $Name,
        [alias('ServiceStatus')][string] $Status,

        [ValidateSet('Dead', 'Bad', 'Good')]
        [Parameter(ParameterSetName = 'Statusimo')]
        $Icon = 'Good',

        [ValidateSet('0%', '10%', '30%', '70%', '100%')]
        [Parameter(ParameterSetName = 'Statusimo')]
        [string] $Percentage = '100%',

        [string]$FontColor = '#5f6982',

        [parameter(ParameterSetName = 'FontAwesomeBrands')]
        [parameter(ParameterSetName = 'FontAwesomeRegular')]
        [parameter(ParameterSetName = "FontAwesomeSolid")]
        [Parameter(ParameterSetName = 'Hex')]
        [string]$BackgroundColor = '#0ef49b',

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
        [parameter(ParameterSetName = 'FontAwesomeBrands')]
        [string] $IconBrands,

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
        [parameter(ParameterSetName = 'FontAwesomeRegular')]
        [string] $IconRegular,

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
        [parameter(ParameterSetName = 'FontAwesomeSolid')]
        [string] $IconSolid,

        [Parameter(ParameterSetName = 'Hex')]
        [ValidatePattern('^&#x[A-Fa-f0-9]{4,5}$')]
        [string]$IconHex
    )
    #$Script:HTMLSchema.Features.StatusButtonical = $true
    if ($PSCmdlet.ParameterSetName -eq 'Statusimo') {
        Write-Warning 'This parameter set has been deprecated. It will be removed in a future release. Look to move to the other parameter sets with customization options.'

        if ($Percentage -eq '100%') {
            $BackgroundColor = '#0ef49b'
        } elseif ($Percentage -eq '70%') {
            $BackgroundColor = '#d2dc69'
        } elseif ($Percentage -eq '30%') {
            $BackgroundColor = '#faa04b'
        } elseif ($Percentage -eq '10%') {
            $BackgroundColor = '#ff9035'
        } elseif ($Percentage -eq '0%') {
            $BackgroundColor = '#ff5a64'
        }

        if ($Icon -eq 'Dead') {
            $IconType = '&#x2620'
        } elseif ($Icon -eq 'Bad') {
            $IconType = '&#x2639'
        } elseif ($Icon -eq 'Good') {
            $IconType = '&#x2714'
        }
    } elseif ($PSCmdlet.ParameterSetName -like 'FontAwesome*') {
        $Script:HTMLSchema.Features.FontsAwesome = $true
        $BackgroundColor = ConvertFrom-Color -Color $BackgroundColor

        if ($IconBrands) {
            $IconClass = "fab fa-$IconBrands".ToLower()
        } elseif ($IconRegular) {
            $IconClass = "far fa-$IconRegular".ToLower()
        } elseif ($IconSolid) {
            $IconClass = "fas fa-$IconSolid".ToLower()
        }
    } elseif ($PSCmdlet.ParameterSetName -eq 'Hex') {
        $IconType = $IconHex
    }
    $FontColor = ConvertFrom-Color -Color $FontColor

    New-HTMLTag -Tag 'div' -Attributes @{ class = 'buttonical'; style = @{ "background-color" = $BackgroundColor } } -Value {
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'label' } {
            New-HTMLTag -Tag 'span' -Attributes @{ class = 'performance'; style = @{ color = $FontColor } } {
                $Name
            }
        }
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'middle' }
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'status' } {
            New-HTMLTag -Tag 'input' -Attributes @{ name = Get-Random; type = 'radio'; value = 'other-item'; checked = 'true' } -SelfClosing
            New-HTMLTag -Tag 'span' -Attributes @{ class = "performance"; style = @{ color = $FontColor } } {
                $Status
                New-HTMLTag -Tag 'span' -Attributes @{ class = "icon $IconClass" } {
                    $IconType
                }
            }
        }
    }
}
Register-ArgumentCompleter -CommandName New-HTMLStatusItem -ParameterName FontColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLStatusItem -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors