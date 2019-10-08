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
                    New-HTMLTag -Tag 'img' -Attributes @{ src = "$LeftLogo" }
                }
                New-HTMLTag -Tag 'div' -Attributes @{ class = 'rightLogo' } {
                    New-HTMLTag -Tag 'img' -Attributes @{ src = "$RightLogo" }
                }
            }
            '<!-- END LOGO -->'
        ) -join ''
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
