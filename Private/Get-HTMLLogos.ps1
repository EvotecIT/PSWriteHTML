Function Get-HTMLLogos {
    <#
	 	.SYNOPSIS
		    Get Base64 HTML

	#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $false)]
        [string]$LeftLogoName = "Sample",
        [string]$RightLogoName = "Alternate",
        [string]$LeftLogoString,
        [string]$RightLogoString

    )
    $LogoSources = @{}
    $LogoPath = @()

    if ([String]::IsNullOrEmpty($RightLogoString) -eq $false -or [String]::IsNullOrEmpty($LeftLogoString) -eq $false) {
        if ([String]::IsNullOrEmpty($RightLogoString) -eq $false) {
            $LogoSources.Add($RightLogoName, $RightLogoString)
        }
        if ([String]::IsNullOrEmpty($LeftLogoString) -eq $false) {
            $LogoSources.Add($LeftLogoName, $LeftLogoString)
        }
    } else {
        $LogoPath += "$PSScriptRoot\..\Resources\Images\Other"
    }
    $LogoPath += "$PSScriptRoot\..\Resources\Images\DataTables"

    $ImageFiles = Get-ChildItem -Path (join-path $LogoPath '\*') -Include *.jpg, *.png, *.bmp -Recurse
    foreach ($ImageFile in $ImageFiles) {
        if ($ImageFile.Extension -eq '.jpg') {
            $FileType = 'jpeg'
        } else {
            $FileType = $ImageFile.Extension.Replace('.', '')
        }
        Write-Verbose "Converting $($ImageFile.FullName) to base64 ($FileType)"
        $LogoSources.Add($ImageFile.BaseName, "data:image/$FileType;base64," + [Convert]::ToBase64String((Get-Content $ImageFile.FullName -Encoding Byte)))
    }
    Write-Output $LogoSources
}


function New-HTMLLogo {
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
        $LogoContent = @"
        <table><tbody>
        <tr>
            <td class="clientlogo"><img src="$Leftlogo" /></td>
            <td class="MainLogo"><img src="$Rightlogo" /></td>
        </tr>
        </tbody></table>
"@
        $LogoContent
    }       
}