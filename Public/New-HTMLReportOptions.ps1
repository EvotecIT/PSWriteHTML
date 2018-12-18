Function New-HTMLReportOptions {
    [CmdletBinding(DefaultParameterSetName = 'NoSave')]
    param
    (
        [Parameter(Mandatory = $false, ParameterSetName = 'NoSave')]
        [Parameter(Mandatory = $false, ParameterSetName = 'Save')]
        [System.Collections.Hashtable]
        $LogoSources,
        [Parameter(Mandatory = $false, ParameterSetName = 'NoSave')]
        [Parameter(Mandatory = $false, ParameterSetName = 'Save')]
        [System.Collections.Hashtable]
        $ColorSchemes,
        [Parameter(Mandatory = $false, ParameterSetName = 'NoSave')]
        [Parameter(Mandatory = $false, ParameterSetName = 'Save')]
        $CSSName = "default",
        [Parameter(Mandatory = $false, ParameterSetName = 'NoSave')]
        [Parameter(Mandatory = $false, ParameterSetName = 'Save')]
        [String]
        $CSSPath,
        [Parameter(Mandatory = $false, ParameterSetName = 'NoSave')]
        [Parameter(Mandatory = $false, ParameterSetName = 'Save')]
        [String]
        $ScriptPath,
        [Parameter(Mandatory = $false, ParameterSetName = 'NoSave')]
        [Parameter(Mandatory = $false, ParameterSetName = 'Save')]
        [String]
        $ColorSchemePath,
        [Parameter(Mandatory = $false, ParameterSetName = 'NoSave')]
        [Parameter(Mandatory = $false, ParameterSetName = 'Save')]
        [String]
        $LogoPath,
        [Parameter(Mandatory = $false, ParameterSetName = 'Save')]
        [String]$SaveOptionsPath,
        [Parameter(Mandatory = $false, ParameterSetName = 'NoSave')]
        [Parameter(Mandatory = $false, ParameterSetName = 'Save')]
        [String]
        $ReportPath,

        [switch] $UseCssLinks,
        [switch] $UseStyleLinks
    )
    if ($ColorSchemes -eq $null) {
        $ColorSchemes = Get-HTMLColorSchemes -SchemePath $ColorSchemePath
    }
    if ($LogoSources -eq $null) {
        $LogoSources = Get-HTMLLogos -Builtin
        $LogoSources += Get-HTMLLogos -LogoPath $LogoPath
    }

    $ScriptHeaderContent = New-GenericList -Type [string]
    if ($UseCssLinks) {
        $ScriptHeaderContent.Add((Get-HTMLJavaScripts -UseLinks:$UseCssLinks -ScriptPath $ScriptPath))
    } else {
        $ScriptHeaderContent.Add((Get-HTMLJavaScripts -ScriptPath $ScriptPath))
    }

    $StyleHeaderContent = New-GenericList -Type [string]
    $StyleHeaderContent.Add((Get-HTMLCSS -Builtin -UseLinks:$UseStyleLinks))
    $StyleHeaderContent.Add((Get-HTMLCSS -CSSPath $CSSPath -CSSName $CSSName))


    $Options = [PSCustomObject] @{
        Logos         = $LogoSources;
        ScriptContent = $ScriptHeaderContent;
        StyleContent  = $StyleHeaderContent;
        ColorSchemes  = $ColorSchemes;
    }
    set-variable -Name GlobalColorSchemes -Value $ColorSchemes -Scope Global
    if ([string]::IsNullOrEmpty($SaveOptionsPath)) {
        Write-Output $Options
    } else {
        Write-Verbose "Saving Report CSS to $SaveOptionsPath"
        $StyleHeaderContent|Set-Content -Path (Join-Path $SaveOptionsPath default.css)
        Write-Verbose "Saving Report Color Schemes to $SaveOptionsPath"
        foreach ($SchemeName in $ColorSchemes.Keys) {
            $ColorSchemes[$SchemeName]| ConvertTo-Csv  -NoTypeInformation -Delimiter ';' | ForEach-Object {$_.Replace('"', '')} | Out-File (Join-Path $SaveOptionsPath "$schemeName.rcs")
        }
        foreach ($LogoSource in $LogoSources.keys) {
            [IO.File]::WriteAllBytes((Join-Path $SaveOptionsPath "$LogoSource.jpg"), [Convert]::FromBase64String($LogoSources[$LogoSource].split(',')[1]))
        }
        foreach ($CSSFile in $CSSFiles) {
            get-content $CSSFile.FullName | set-content (Join-Path $SaveOptionsPath $CSSFile.name)
        }

    }
}
