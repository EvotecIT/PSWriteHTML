Function Get-HTMLLogos {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [string]$LeftLogoName = "Sample",
        [string]$RightLogoName = "Alternate",
        [string]$LeftLogoString,
        [string]$RightLogoString

    )
    $LogoSources = [ordered] @{ }
    $LogoPath = @(
        if ([String]::IsNullOrEmpty($RightLogoString) -eq $false -or [String]::IsNullOrEmpty($LeftLogoString) -eq $false) {
            if ([String]::IsNullOrEmpty($RightLogoString) -eq $false) {
                $LogoSources.Add($RightLogoName, $RightLogoString)
            }
            if ([String]::IsNullOrEmpty($LeftLogoString) -eq $false) {
                $LogoSources.Add($LeftLogoName, $LeftLogoString)
            }
        } else {
            "$PSScriptRoot\..\Resources\Images\Other"
        }
        "$PSScriptRoot\..\Resources\Images\DataTables"
    )
    $ImageFiles = Get-ChildItem -Path (Join-Path $LogoPath '\*') -Include *.jpg, *.png, *.bmp -Recurse
    foreach ($ImageFile in $ImageFiles) {
        <#
        if ($ImageFile.Extension -eq '.jpg') {
            $FileType = 'jpeg'
        } else {
            $FileType = $ImageFile.Extension.Replace('.', '')
        }
        Write-Verbose "Converting $($ImageFile.FullName) to base64 ($FileType)"

        if ($PSEdition -eq 'Core') {
            $ImageContent = Get-Content -AsByteStream -LiteralPath $ImageFile.FullName
        } else {
            $ImageContent = Get-Content -LiteralPath $ImageFile.FullName -Encoding Byte
        }
        #>
        $ImageBinary = Convert-ImageToBinary -ImageFile $ImageFile
        #$LogoSources.Add($ImageFile.BaseName, "data:image/$FileType;base64," + [Convert]::ToBase64String(($ImageContent)))
        $LogoSources.Add($ImageFile.BaseName, $ImageBinary)
    }
    $LogoSources
}


#$t = 'C:\Support\GitHub\PSWriteHTML\Private\Get-HTMLLogos.ps1'
#$t -as [System.IO.FileInfo]