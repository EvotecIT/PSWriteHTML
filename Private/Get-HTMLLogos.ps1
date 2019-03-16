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