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

    Write-Warning "New-HTMLLogo - This function is deprecated. If you're using it consider letting me know on https://github.com/evotecit/PSWriteHTML"
    Write-Warning "New-HTMLLogo - There will be replacement for this sooner or later."

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