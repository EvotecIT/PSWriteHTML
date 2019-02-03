function Add-HTMLBodyOpening {
    [CmdletBinding()]
    param(
        $Options,
        [string] $TitleText,
        [switch] $HideTitle,
        [switch] $HideLogos,
        [switch] $HideDate,
        [string] $PrimaryColorHex,
        [string] $CurrentDate
    )
    $HTML = New-GenericList -Type [string]
    $HTML.Add('<!-- Body -->')
    #$HTML.Add('<body onload="hide();">')
    $HTML.Add('<body>')

    if ($HideLogos -eq $false) {
        $Leftlogo = $Options.Logos[$LeftLogoName]
        $Rightlogo = $Options.Logos[$RightLogoName]
        $LogoContent = @"
        <table><tbody>
        <tr>
            <td class="clientlogo"><img src="$Leftlogo" /></td>
            <td class="MainLogo"><img src="$Rightlogo" /></td>
        </tr>
        </tbody></table>
"@
    }

    if (-not $HideTitle) {
        $HTML.Add("<!-- Report Header -->")
        $HTML.Add($LogoContent)
        $HTML.Add("<div class=`"pageTitle`">$TitleText</div>")
    #    $HTML.Add("<hr />")
    }
    if (-not $HideDate) {
        $HTML.Add("<div class=`"ReportCreated`">Report created on $($CurrentDate)</div>")
    }

    if (!([string]::IsNullOrEmpty($PrimaryColorHex))) {
        if ($PrimaryColorHex.Length -eq 7) {
            $HTML = $HTML -replace '#337E94', $PrimaryColorHex
        } else {
            Write-Warning '$PrimaryColorHex must be 7 characters with hash eg "#337E94"'
        }
    }
    return $HTML
}