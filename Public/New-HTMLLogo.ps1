function New-HTMLLogo {
    <#
    .SYNOPSIS
    Creates a new HTML logo with specified parameters.

    .DESCRIPTION
    This function creates a new HTML logo using the provided parameters. It allows customization of the left and right logo names, strings, and the option to hide logos.

    .PARAMETER LogoPath
    The path to the logo.

    .PARAMETER LeftLogoName
    The name of the left logo. Default is "Sample".

    .PARAMETER RightLogoName
    The name of the right logo. Default is "Alternate".

    .PARAMETER LeftLogoString
    The string for the left logo.

    .PARAMETER RightLogoString
    The string for the right logo.

    .PARAMETER HideLogos
    Switch parameter to hide logos.

    .EXAMPLE
    New-HTMLLogo -LogoPath "C:\Logos\logo.png" -LeftLogoName "CompanyA" -RightLogoName "CompanyB" -LeftLogoString "Company A Logo" -RightLogoString "Company B Logo"

    Creates a new HTML logo with custom left and right logo names and strings.

    .EXAMPLE
    New-HTMLLogo -LogoPath "C:\Logos\logo.png" -HideLogos

    Creates a new HTML logo with logos hidden.

    #>
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

    $LogoSources = Get-HTMLLogos -LogoPath $LogoPath -RightLogoName $RightLogoName -LeftLogoName $LeftLogoName -LeftLogoString $LeftLogoString -RightLogoString $RightLogoString

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