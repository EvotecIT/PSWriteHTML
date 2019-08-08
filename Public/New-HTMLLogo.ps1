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

    Convert-StyleContent1 -Options $Options


    $Options = [PSCustomObject] @{
        Logos        = $LogoSources
        ColorSchemes = $ColorSchemes
    }

    if ($HideLogos -eq $false) {
        $Leftlogo = $Options.Logos[$LeftLogoName]
        $Rightlogo = $Options.Logos[$RightLogoName]
        '<!-- START LOGO -->'
        $LogoContent = @"
        <table><tbody>
        <tr>
            <td class="clientlogo"><img src="$Leftlogo" /></td>
            <td class="MainLogo"><img src="$Rightlogo" /></td>
        </tr>
        </tbody></table>
"@
        $LogoContent
        '<!-- END LOGO -->'

    }
}

<#

<table><tbody>
<tr>
    <td class="clientlogo"><img src="$Leftlogo" /></td>
    <td class="MainLogo"><img src="$Rightlogo" /></td>
</tr>
</tbody></table>
#>
<#
$Attributes = @{
    src = "https://$Rightlogo"
    style = @{
        color = 'red'
        'background-color' = 'yellow'
    }
}

New-HTMLTag -Tag 'Table' {
    New-HTMLTag -Tag 'tbody' {
        New-HTMLTag -Tag 'tr' {
            New-HTMLTag -Tag 'td' -Attributes @{ class = 'clientLogo' } {
                New-HTMLTag -Tag 'img' -Attributes $Attributes
            }
            New-HTMLTag -Tag 'td' -Attributes @{ class = 'MainLogo' } {
                New-HTMLTag -Tag 'img' -Attributes @{ src = "https://$Rightlogo" }
            }
        }
    }
}
#>
