Function New-HTML {
    [CmdletBinding(DefaultParameterSetName = 'options')]
    param
    (
        [Parameter(Mandatory = $false, ParameterSetName = 'open')]
        [String]$TitleText,

        [Parameter(Mandatory = $false, ParameterSetName = 'open')]
        [String]$CSSPath,
        [Parameter(Mandatory = $false, ParameterSetName = 'open')]
        [String]$CSSName = "default",
        [Parameter(Mandatory = $false, ParameterSetName = 'open')]
        [String]$ScriptPath,
        [Parameter(Mandatory = $false, ParameterSetName = 'open')]
        [String]$ColorSchemePath,
        [Parameter(Mandatory = $false, ParameterSetName = 'open')]
        [String]$LogoPath,
        [Parameter(Mandatory = $false, ParameterSetName = 'open')]
        [string]$LeftLogoName = "Sample",
        [Parameter(Mandatory = $false, ParameterSetName = 'open')]
        [string]$RightLogoName = "Alternate",
        [Parameter(Mandatory = $false, ParameterSetName = 'open')]
        [string]$LeftLogoString,
        [Parameter(Mandatory = $false, ParameterSetName = 'open')]
        [string]$RightLogoString,

        [Parameter(Mandatory = $false, ParameterSetName = 'open')]

        [switch]$HideLogos,

        [Parameter(Mandatory = $false, ParameterSetName = 'open')]

        [switch]$HideTitle,

        [Parameter(Mandatory = $false, ParameterSetName = 'open')]

        [switch]$NoScript,

        [Parameter(Mandatory = $false, ParameterSetName = 'open')]
        [string]$PrimaryColorHex,

        [Parameter(Mandatory = $false, ParameterSetName = 'open')]
        [switch] $AddAuthor,

        [Parameter(Mandatory = $false, ParameterSetName = 'open')]
        [string] $Author,

        [Parameter(Mandatory = $false, ParameterSetName = 'open')]
        [switch] $HideDate,

        [Parameter(Mandatory = $false, ParameterSetName = 'open')]
        [string] $DateFormat = 'yyyy-MM-dd HH:mm:ss',

        [Parameter(Mandatory = $false, ParameterSetName = 'open')]
        [switch] $UseCssLinks,

        [Parameter(Mandatory = $false, ParameterSetName = 'open')]
        [switch] $UseStyleLinks,

        [Parameter(Mandatory = $false, ParameterSetName = 'open')]


        [switch] $Open,


        [Parameter(Mandatory = $false, ParameterSetName = 'close')]
        [switch] $Close,
        [Parameter(Mandatory = $false, ParameterSetName = 'close')]
        [String]$FooterText # For closing param
    )

    if ($Open) {
        [string] $CurrentDate = (Get-Date).ToString($DateFormat) #Get-Date #-format "MMM d, yyyy hh:mm tt"
        if ([String]::IsNullOrEmpty($RightLogoString) -eq $false -or [String]::IsNullOrEmpty($LeftLogoString) -eq $false) {
            $LogoSources = @{}
            if ([String]::IsNullOrEmpty($RightLogoString) -eq $false) {
                $LogoSources.Add($RightLogoName, $RightLogoString)
            }
            if ([String]::IsNullOrEmpty($LeftLogoString) -eq $false) {
                $LogoSources.Add($LeftLogoName, $LeftLogoString)
            }
        }
        if (!([String]::IsNullOrEmpty($LogoPath))) {
            $LogoSources = Get-HTMLLogos -logopath $LogoPath
        }

        $Options = New-HTMLReportOptions -LogoSources $LogoSources -CSSName $CSSName -CSSPath $CSSPath -ScriptPath $ScriptPath -ColorSchemePath $ColorSchemePath -UseCssLinks:$UseCssLinks -UseStyleLinks:$UseStyleLinks

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
        # Replace PNG / JPG files in Styles

        if ($null -ne $Options.StyleContent) {

            Write-Verbose "Logos: $($Options.Logos.Keys -join ',')"
            foreach ($Logo in $Options.Logos.Keys) {
                $Search = "../images/$Logo.png", "DataTables-1.10.18/images/$Logo.png"
                $Replace = $Options.Logos[$Logo]
                foreach ($S in $Search) {
                    $Options.StyleContent = ($Options.StyleContent).Replace($S, $Replace)
                }
            }
        }
        $HTML = New-GenericList -Type [string]
        $HTML.Add((Add-HTMLHead -TitleText $TitleText -UseStyleLinks:$UseStyleLinks -UseCssLinks:$UseCssLinks -AddAuthor:$AddAuthor -HideTitle:$HideTitle))
        $HTML.Add('<!-- Body -->')
        #$HTML.Add('<body onload="hide();">')
        $HTML.Add('<body>')

        if (-not $HideTitle) {
            $HTML.Add("<!-- Report Header -->")
            $HTML.Add($LogoContent)
            $HTML.Add("<div class=`"pageTitle`">$TitleText</div>")
            $HTML.Add("<hr />")
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

        Write-Output $HTML
    }

    if ($Close) {
        if ($null -ne $FooterText) {
            $FooterText = "Copyright &#169; $([DateTime]::Now.Year). All Rights Reserved."
        }
        $HTML = @"
<hr />
<!-- FOOTER -->
<div class="footer">$FooterText</div>

<!-- END BODY -->
</body>
</html>
"@

        Write-Output $HTML
    }
}