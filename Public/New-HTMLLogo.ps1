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
    $Script:HTMLSchema.Features.MainImage = $true

    $LogoSources = Get-HTMLLogos -RightLogoName $RightLogoName -LeftLogoName $LeftLogoName -LeftLogoString $LeftLogoString -RightLogoString $RightLogoString

    $Options = [PSCustomObject] @{
        Logos        = $LogoSources
        ColorSchemes = $ColorSchemes
    }

    if ($HideLogos -eq $false) {
        $Leftlogo = $Options.Logos[$LeftLogoName]
        $Rightlogo = $Options.Logos[$RightLogoName]
        $Script:HTMLSchema.Logos = @(
            '<!-- START LOGO -->'
            New-HTMLTag -Tag 'div' -Attributes @{ class = 'legacyLogo' } {
                New-HTMLTag -Tag 'div' -Attributes @{ class = 'legacyLeftLogo' } {
                    New-HTMLTag -Tag 'img' -Attributes @{ src = "$LeftLogo"; class = 'legacyImg' } -SelfClosing
                }
                New-HTMLTag -Tag 'div' -Attributes @{ class = 'legacyRightLogo' } {
                    New-HTMLTag -Tag 'img' -Attributes @{ src = "$RightLogo"; class = 'legacyImg' } -SelfClosing
                }
            }
            '<!-- END LOGO -->'
        ) -join ''
    }
}