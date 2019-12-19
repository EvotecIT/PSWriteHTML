function New-HTMLLogo {
    [CmdletBinding()]
    param(
        [String] $LogoPath,
        [string] $LeftLogoName = "Sample",
        [string] $RightLogoName = "Alternate",
        [string] $LeftLogoString,
        [string] $RightLogoString,
        [switch] $HideLogos
    )

    $LogoSources = Get-HTMLLogos `
        -RightLogoName $RightLogoName `
        -LeftLogoName $LeftLogoName  `
        -LeftLogoString $LeftLogoString `
        -RightLogoString $RightLogoString

    #Convert-StyleContent1 -Options $Options

    $Options = [PSCustomObject] @{
        Logos        = $LogoSources
        ColorSchemes = $ColorSchemes
    }

    if ($HideLogos -eq $false) {
        $Leftlogo = $Options.Logos[$LeftLogoName]
        $Rightlogo = $Options.Logos[$RightLogoName]
        $Script:HTMLSchema.Logos = @(
            '<!-- START LOGO -->'
            New-HTMLTag -Tag 'div' -Attributes @{ class = 'logos' } {
                New-HTMLTag -Tag 'div' -Attributes @{ class = 'leftLogo' } {
                    New-HTMLTag -Tag 'img' -Attributes @{ src = "$LeftLogo" } -SelfClosing
                }
                New-HTMLTag -Tag 'div' -Attributes @{ class = 'rightLogo' } {
                    New-HTMLTag -Tag 'img' -Attributes @{ src = "$RightLogo" } -SelfClosing
                }
            }
            '<!-- END LOGO -->'
        ) -join ''
    }
}